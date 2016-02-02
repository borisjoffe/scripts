#!/bin/bash

set -u

xautolock -locknow
if [[ $? != 0 ]]; then
	notify.sh "Starting xautolock"
	xautolock-init.sh &
	sleep 1
	#wait $! # doesn't work - fix this
	xautolock -locknow
#else
	#notify.sh "xautolock already running"
fi
