#!/bin/bash

# Start docker container for zephyr with connected device
#!/bin/bash

if [ $1 ]
then
  exec "weird arg"
else
  exec west build -p always -b esp32_devkitc_wroom/esp32/procpu -- -DDTC_OVERLAY_FILE=boards/esp32_devkitc_wroom.overlay
fi


#west build -p always -b esp32_devkitc_wroom/esp32/procpu -- -DDTC_OVERLAY_FILE=boards/esp32_devkitc_wroom.overlay

