#!/bin/bash
echo "Suspending..."

xautolock -locknow
SUCCESSFUL_LOCK=$?

if [ $SUCCESSFUL_LOCK == 0 ]; then
	sleep 1
	systemctl suspend
else
	notify.sh "could not lock screen...start xautolock"
fi
