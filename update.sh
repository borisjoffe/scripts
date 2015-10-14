#!/bin/bash

notify () {
	notify.sh "$@" &
}

run () {
	echo "Starting: $@"
	eval "$@" && notify "Finished: $@" || notify "Error: $@"
}

run dropbox-backup.sh &
run sudo pacmatic -Syu
run sudo pacaur -Syu
run sudo npm update -g
run sudo updatedb
