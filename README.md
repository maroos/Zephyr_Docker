# Zephyr_Docker
Zephyr OS repository with docker usage for Esp32 test project

#build docker image
docker build -t env-zephyr-espressif -f tools/Dockerfile.espressif ./tools
#ToDo check if ./tools or .

#ToDo: check and change if needed Dockerfile.espressif <- 
docker run --rm -it -p 3333:3333 -p 2222:22 -p 8800:8800 -v "$(pwd)"/workspace:/workspace -w /workspace env-zephyr-espressif

#add support for device 
docker run --rm -it -p 3333:3333 -p 2222:22 -p 8800:8800 -v "$(pwd)"/workspace:/workspace -w /workspace --device=/dev/ttyUSB0:/dev/ttyUSB0 env-zephyr-espressif


#minimal with interactive mode:
docker run --rm -it -v "$(pwd)"/workspace:/workspace -w /workspace --device=/dev/ttyUSB0:/dev/ttyUSB0 env-test-zephyr-espressif

#---- run in VSCode
run code -> attach to running docker
select ../workspace/zephyr.code-workspace

west build -p always -b esp32_devkitc_wroom/esp32/procpu -- -DDTC_OVERLAY_FILE=boards/esp32_devkitc_wroom.overlay
west espressif monitor


#--------
# from repo dir create venv and install requirements
 
 python3 -m venv .venv
 source .venv/bin/activate
 pip install -r tools/requirements.txt
 
 
 #flash
 esptool.py --port /dev/ttyUSB0 --chip auto --baud 921600 --before default_reset --after hard_reset write_flash -u --flash_size detect 0x0 ./workspace/apps/01_blink/build/zephyr/zephyr.bin
 
 esptool.py --chip auto --baud 921600 --before default_reset --after hard_reset write_flash -u --flash_mode dio --flash_freq 40m --flash_size detect 0x0 /workspace/apps/01_blink/build/zephyr/zephyr.bin

works: 
west flash

#monitor: 
pyserial-miniterm /dev/ttyUSB0 115200



#ToDo: 

- run sh while starting docker to have interactive mode
- 





#tips and tricks

- if esp32 board not supported message:

boot: You are using ESP32 chip revision (1) that is unsupported. While it may work, it could cause unexpected behavior or issues.
E (74) boot: Proceeding with this ESP32 chip revision is not recommended unless you fully understand the potential risk and limitations.
E (86) boot: If you choose to continue, please enable the 'CONFIG_ESP32_USE_UNSUPPORTED_REVISION' in your project configuration.
E (98) boot: HW init failed, aborting


add in prj.conf
CONFIG_ESP32_USE_UNSUPPORTED_REVISION=y
#------------------------------------------    
