#!/bin/bash

#	first arg contains 'off'
if [ "$(echo "$1"|grep "off")" ]
then
	echo "Turning VGA1 off..."
	xrandr --output VGA1 --off
	echo "Done."
fi

#	first arg contains 'on'
if [ "$(echo "$1"|grep "on")" ]
then
	echo "Turning VGA1 on..."
	xrandr --output VGA1 --auto
	echo "Setting multiple monitor settings..."
	#xrandr --output VGA1 --right-of LVDS1 --output LVDS1 --mode 1280x800
	#xrandr --output VGA1 --left-of LVDS1 --output LVDS1 
	xrandr --output VGA1 --left-of LVDS1 --mode 1280x1024
	echo "Done."
#	first arg does not contain 'on' (from above, elif) and does not contain 'off'
elif [ -z "$(echo "$1"|grep "off")" ] 
then
	echo "Error. First arg needs to be 'on' or 'off'"
fi
