#!/bin/bash

WINDOW_ID=$(window-id.sh $1)
#echo "window id is: "$WINDOW_ID
#echo "focused window id is: "`xdotool getwindowfocus`

if [[ "$(xdotool getwindowfocus)" -eq "$WINDOW_ID" ]]; then
	# current window is focused -> lower it
	wmctrl -ir $WINDOW_ID -b add,hidden
else
	# raise window
	wmctrl -iR $WINDOW_ID
fi

