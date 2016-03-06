#!/bin/bash

notify () {
	notify.sh "$@" &
}

run () {
	echo "Starting: $@"
	eval "$@" && notify "Finished: $@" || notify "Error: $@"
}

sudo echo "Starting update..." # to get sudo password prompt before async work starts
run "dropbox-backup.sh" &
run "sudo pacmatic -Syu"
run "npml update -g"
run "pip-upgrade-all"
run "sudo pip install --upgrade pip"

if [[ $1 == "all" ]]; then
	run "pushd /data/src; git-update-subdirs.sh; popd;"
	run "cabal update"
	run "opam update && opam upgrade"
fi

run sudo updatedb
