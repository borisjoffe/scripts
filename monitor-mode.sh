#!/bin/bash

echo "Warning, requires root privs. Continuing..."
if [ "$1" != "off" ]
then
	sudo ifconfig wlan0 down
	sudo iwconfig wlan0 mode monitor
	sudo ifconfig wlan0 up
elif [ "$1" == "off" ]
then
	sudo ifconfig wlan0 down
	sudo iwconfig wlan0 mode managed
	sudo ifconfig wlan0 up
fi
