#!/bin/bash

if [ "$1" == "off" ]; then
	sudo modprobe -r b43
else
	sudo modprobe b43
fi

