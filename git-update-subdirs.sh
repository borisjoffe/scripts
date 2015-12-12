#!/bin/bash
# Deps: git-update-branches.sh

LOGFILE="$(pwd)/git-update-subdir.log"

for directory in */; do
	cd $directory
	git-update-branches.sh $LOGFILE
	cd ../
done
