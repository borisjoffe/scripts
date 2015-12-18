#!/bin/bash

TIMEOUT=${TIMEOUT:-5000}

if [[ $DISPLAY ]]; then
	# xmessage -center "$@"
	# zenity --notification --text="$@"

	if [[ $# > 1 ]]; then
		header=$1
		shift
		notify-send -t $TIMEOUT "$header" "$@"
	else
		notify-send -t $TIMEOUT "$@"
	fi

else
	wall "$@"
fi
