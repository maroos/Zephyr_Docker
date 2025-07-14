#!/bin/bash

# Start docker container for zephyr with connected device
#!/bin/bash

if [ $1 = "m" ]
then
  west build -p always -b esp32_devkitc_wroom/esp32/procpu -- -DDTC_OVERLAY_FILE=boards/esp32_devkitc_wroom.overlay
  west flash
  exec west espressif monitor
elif [ $1 = 'f' ]
then
  west build -p always -b esp32_devkitc_wroom/esp32/procpu -- -DDTC_OVERLAY_FILE=boards/esp32_devkitc_wroom.overlay
  exec west flash
else
  west build -p always 
fi


#west build -p always -b esp32_devkitc_wroom/esp32/procpu -- -DDTC_OVERLAY_FILE=boards/esp32_devkitc_wroom.overlay

