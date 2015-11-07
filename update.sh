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
run pacmatic -Syu
run sudo npm update -g

if [[ $1 == "all" ]]; then
	run pushd /data/src; git-update-subdirs.sh; popd;
	run cabal update
	run opam update && opam upgrade
fi

run sudo updatedb
