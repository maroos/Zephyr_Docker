# Zephyr_Docker
Zephyr OS repository with docker usage for Esp32 test project

#build docker image
docker build -t env-zephyr-espressif -f tools/Dockerfile.espressif ./tools
#ToDo check if ./tools or .

#ToDo: check and change if needed Dockerfile.espressif <- 
docker run --rm -it -p 3333:3333 -p 2222:22 -p 8800:8800 -v "$(pwd)"/workspace:/workspace -w /workspace env-zephyr-espressif


#---- run in VSCode
run code -> attach to running docker


west build -p always -b esp32_devkitc_wroom/esp32/procpu -- -DDTC_OVERLAY_FILE=boards/esp32_devkitc_wroom.overlay



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
