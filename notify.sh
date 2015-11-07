#!/bin/bash

if [[ $DISPLAY ]]; then
	# xmessage -center "$@"
	# zenity --notification --text="$@"

	if [[ $# > 1 ]]; then
		header=$1
		shift
		notify-send -t 5000 "$header" "$@"
	else
		notify-send -t 5000 "$@"
	fi

else
	wall "$@"
fi
