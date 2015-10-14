#!/bin/bash

notify () {
	notify.sh "$@" &
}

run () {
	echo "Starting: $@"
	eval "$@" && notify "Finished: $@" || notify "Error: $@"
}

sudo echo "Starting update..." # to get sudo password prompt before async work starts
run dropbox-backup.sh &
run sudo pacmatic -Syu
run sudo npm update -g
run sudo updatedb
