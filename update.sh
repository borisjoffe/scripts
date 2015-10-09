#!/bin/bash

notify () {
	xmessage -center "$@" &
}

run () {
	echo "Starting: $@"
	eval "$@"
	notify "Finished: $@"
}

run dropbox-backup.sh &
run sudo pacmatic -Syu
run sudo pacaur -Syu
run sudo npm update -g
run sudo updatedb
