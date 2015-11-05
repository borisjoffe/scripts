#!/bin/bash

LOGFILE=git-update-subdir.log
CWD=`pwd`

[ -f $LOGFILE ] && mv $LOGFILE $LOGFILE.bak

log() {
	echo $@ | tee -a $CWD/$LOGFILE
}

for directory in */; do
	cd $directory

	if [ -d .git ]; then
		log "Starting to update $directory ... "
		BRANCH=`git rev-parse --symbolic-full-name --abbrev-ref HEAD`

		OUTPUT=`git pull`
		STATUS=$?
		if [[ ! $STATUS ]]; then
			log "git pull ERROR:\n$OUTPUT"
			git fetch --tags
			log "FETCH ONLY"
		fi

		log "[X] Done updating $directory"
	else
		log "Not a git repo: $directory"
	fi

	cd ../
done
