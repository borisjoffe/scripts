#!/bin/bash

# time - minutes before locking
# notify - seconds to turn off screen
# killtime - minutes after locking before suspending

set -u

# Suspend doesn't work with physlock
#readonly locker="physlock -d -s"
readonly locker="slock"

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

xautolock -detectsleep -nowlocker "$locker" \
	-time 10 -locker "$locker" \
	-notify 5 -notifier "xset dpms force off" \
	-killtime 20 -killer "systemctl suspend"
#    -secure

echo "[DONE] xautolock started"
