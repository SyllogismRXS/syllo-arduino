#!/bin/bash

#Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This script must be run as root because libraries will be installed."
    usage
    exit
fi

dfu-programmer atmega16u2 erase
dfu-programmer atmega16u2 flash --debug 1 $1 #Arduino-usbserial-uno.hex
dfu-programmer atmega16u2 reset
