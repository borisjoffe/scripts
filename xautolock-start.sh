#!/bin/bash

# time - minutes before locking
# notify - seconds to turn off screen
# killtime - minutes after locking before suspending

exec xautolock -detectsleep -nowlocker slock \
		-time 10 -locker slock \
		-notify 5 -notifier "xset dpms force off" \
		-killtime 20 -killer "systemctl suspend" &
