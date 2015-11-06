#!/bin/bash

# time - minutes before locking
# notify - seconds to turn off screen
# killtime - minutes after locking before suspending

PID=`pidof xautolock`
if [[ $PID -ne 0 ]]; then
	echo "Process running...killing"
	kill -15 $PID
else
	echo "Process not running...starting xautolock"
fi

exec xautolock -detectsleep -nowlocker slock \
		-time 10 -locker slock \
		-notify 5 -notifier "xset dpms force off" \
		-killtime 20 -killer "systemctl suspend" &

echo "[DONE] xautolock started"
