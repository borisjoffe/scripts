#!/bin/bash

# Suspends to ram (default), disk, or both
# Deps: usage.sh, notify.sh

set -u

usage.sh "suspend.sh [ram|disk|hybrid]" $@ && exit

readonly input=${1:-ram}

case $input in
	ram|mem|memory|suspend)
		cmd="suspend"
		msg="Suspending"
		;;
	disk|hibernate)
		cmd="hibernate"
		msg="Hibernating"
		;;
	hybrid)
		cmd="hibernate"
		msg="Hybrid suspend/hibernate"
		;;
	*)
		suspend.sh ram
		;;
esac

notify.sh "$msg..."

locknow() {
	xautolock -locknow
	echo $?
}

suspendnow() {
	sleep 1
	systemctl "$cmd"
}

if [[ $(locknow) == 0 ]]; then
	suspendnow
else
	notify.sh "Could not lock screen...will restart xautolock and try again"
	run xautolock-init.sh
	sleep 2
	[[ $(locknow) == 0 ]] && suspendnow || notify.sh "Still couldn't lock screen...try to do it manually"
fi
