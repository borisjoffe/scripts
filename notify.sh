#!/bin/bash

if [[ $DISPLAY ]]; then
	# xmessage -center "$@"
	zenity --notification --text="$@"
else
	wall "$@"
fi
