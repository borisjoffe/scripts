#!/bin/bash

set -u

# xautolock -locknow
# st=$?
# notify.sh "xautolock status: $st"

if ! xautolock -locknow; then
	notify.sh "Failed initial lock"
	notify.sh "Restarting xautolock"
	xautolock-init.sh
	sleep 1
	#wait $! # doesn't work - fix this
	xautolock -locknow
else
	notify.sh "success lock: $?"
fi
exit

# xautolock -locknow
if xautolock -locknow; then
	notify.sh "Starting xautolock"
	xautolock-init.sh
	sleep 1
	#wait $! # doesn't work - fix this
	xautolock -locknow
#else
	#notify.sh "xautolock already running"
fi
