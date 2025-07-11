#include <stdio.h>
#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>

// Settings
static const int32_t sleep_time_ms = 1000;
static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(DT_ALIAS(my_led), gpios);
static const struct gpio_dt_spec extled = GPIO_DT_SPEC_GET(DT_ALIAS(my_ext_led), gpios);

int main(void)
{
	printf("Hello World! %s\n", CONFIG_BOARD_TARGET);
	int ret;
	int state = 0;

	// Make sure that the GPIO was initialized
	if (!gpio_is_ready_dt(&led) || !gpio_is_ready_dt(&extled)) {
		return 0;
	}

	// Set the GPIO as output
	ret = gpio_pin_configure_dt(&led, GPIO_OUTPUT);
	if (ret < 0) {
		return 0;
	}

	// Set the GPIO as output
	ret = gpio_pin_configure_dt(&extled, GPIO_OUTPUT);
	if (ret < 0) {
		return 0;
	}

	// Do forever
	while (1) {

		// Change the state of the pin and print
		state = !state;
		printk("LED state inter: %d\r\n", state);
		printk("LED state exter: %d\r\n", !state);

		// Set pin state
		ret = gpio_pin_set_dt(&led, state);
		if (ret < 0) {
			return 0;
		}
		ret = gpio_pin_set_dt(&extled, !state);
		if (ret < 0) {
			return 0;
		}

		// Sleep
		k_msleep(sleep_time_ms);
	}

	return 0;
}
