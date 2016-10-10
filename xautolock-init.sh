#!/bin/bash

# time - minutes before locking
# notify - seconds to turn off screen
# killtime - minutes after locking before suspending

set -u

LOCK_TIME_MIN=10
NOTIFY_TIME_SEC=5
KILL_TIME_MIN=20

# Suspend doesn't work with physlock
#readonly locker='physlock -d -s'
readonly locker='slock'
readonly killer='systemctl suspend'
readonly notifier='xset dpms force off'

pid=`pidof xautolock`
if [[ "$pid" -ne 0 ]]; then
	echo "Process running...killing"
	kill -15 $pid

	sleep 2
	pid=`pidof xautolock`
	if [[ "$pid" -ne 0 ]]; then
		echo "Could not kill xautolock. Force-killing"
		kill -9 $pid
	fi
else
	echo "Process not running...starting xautolock"
fi

nohup xautolock -detectsleep -nowlocker "$locker" \
	-time $LOCK_TIME_MIN -locker "$locker" \
	-killtime $KILL_TIME_MIN -killer "$killer" \
	-notify $NOTIFY_TIME_SEC -notifier "$notifier" &
#    -secure

echo "[DONE] xautolock started"
