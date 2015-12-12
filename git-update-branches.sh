#!/bin/bash
# Deps: git-current-branch.sh, usage.sh

usage.sh "git-update-branches.sh [LOGFILE]" $@ && exit

LOGFILE=${1:-git-update-branches.log}

[ -f $LOGFILE ] && mv $LOGFILE $LOGFILE.bak

log() {
	echo $@ | tee -a $LOGFILE
}

directory=$(basename `pwd`)

if [ -d .git ]; then
	log "Updating $directory ... "

	git fetch --tags
	currentBranch=`git-current-branch.sh`

	for branch in $(git branch | cut -c3-); do
		log "Updating $directory/$branch ... "
		git checkout $branch
		OUTPUT=`git pull --ff-only`
		STATUS=$?
		if [[ ! $STATUS ]]; then
			log "[ERROR from git pull]:\n$OUTPUT"
			log "FETCH ONLY"
		fi
	done
	git checkout $currentBranch

	log "[DONE] Updated $directory"
else
	log "[SKIPPING] Not a git repo: $directory"
fi

