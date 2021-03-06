#!/bin/bash
# Deps: git-update-branches.sh

set -u
LOGFILE="$(pwd)/git-update-subdir.log"

# TODO: parallelize with GNU Parallel
for directory in ./*/; do
	cd $directory
	git-update-branches.sh $LOGFILE
	cd ../
done
