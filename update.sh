#!/bin/bash

notify () {
	xmessage -center "$@" &
}

run () {
	echo "Starting: $@"
	eval "$@"
	notify "Finished: $@"
}

run sudo pacmatic -Syu
run sudo pacaur -Syu
run dropbox-backup.sh
run sudo npm update -g
