#!/bin/bash

# Start docker container for zephyr with connected device
#!/bin/bash

if [ $1 ]
then
  exec docker run --rm -it -v "$(pwd)"/workspace:/workspace -w /workspace --device=$1:$1 env-zephyr-espressif
else
  exec docker run --rm -it -v "$(pwd)"/workspace:/workspace -w /workspace env-zephyr-espressif
fi

#  exec docker run --rm -it -v "$(pwd)"/workspace:/workspace -w /workspace --device=/dev/ttyUSB0:/dev/ttyUSB0 env-zephyr-espressif
#
