#!/bin/bash

i3status | while :
do
	read -r line
	availMem=$(free -h | row.sh 2 | column-last.sh)
	# TODO: preserve colors in i3status output
	#printf "avail: %s | %s" "$availMem" "$line" || exit 1
	#printf "%s" "$line"
	echo "avail: $availMem | $line" || exit 1
done
