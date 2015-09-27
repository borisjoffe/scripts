#!/bin/bash

CHECK='pgrep xautolock'
if [[ $($CHECK) ]] ; then
	echo "[OK] xautolock is running"
else
	echo -e "[Error] xautolock is not running.\nStarting..."
	sleep 1
	xautolock-init.sh
	[[ $($CHECK) ]] && echo "[FIXED] xautolock started" || "[FAIL] xautolock failed to start"
fi

CHECK='localectl status | head -1 | tail -1 | grep dvorak'
if [[ $(bash -c $CHECK) ]] ; then
	echo "[OK] Keyboard is set to: dvorak"
else
	echo -e "\n[Error] The keyboard layout is not dvorak"
	setxkbmap dvovark
	[[ $(bash -c $CHECK) ]] && echo "[FIXED] Set keyboard layout to: dvorak" || "[FAIL] Could not set keyboard to: dvorak"
fi

CHECK='xmodmap -pke | grep " 66" | grep 8'
if [[ $(bash -c $CHECK) ]] ; then
	echo "[OK] Eight key enabled"
else
	echo -e "\n[Error] Eight key not enabled. Enabling eight key..."
	enable-eight-key.sh
	[[ $(bash -c $CHECK) ]] && echo "[FIXED] Enabled eight key" || echo "[FAIL] Could not enable eight key"
fi

CHECK='$SOLARIZED'
if [[ $CHECK == 1 ]] ; then
	echo "[OK] SOLARIZED is set to: $SOLARIZED"
else
	echo -e "\n[Error] SOLARIZED variable is not set.\nSet SOLARIZED manually or by sourcing '.env'..."
fi
