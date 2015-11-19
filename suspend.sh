#!/bin/bash
echo "Suspending..."

locknow() {
	xautolock -locknow
	echo $?
}

suspendnow() {
	sleep 1
	systemctl suspend
}

if [[ `locknow` == 0 ]]; then
	suspendnow
else
	notify.sh "Could not lock screen...will restart xautolock and try again"
	xautolock-init.sh
	sleep 2
	[[ `locknow` == 0 ]] && suspendnow || notify.sh "Still couldn't lock screen...try to do it manually"
fi
