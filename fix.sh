#!/bin/bash

if [[ $(pgrep xautolock) ]] ; then
	echo "[OK] xautolock is running"
else
	echo -e "[Error] xautolock is not running.\nStarting..."
	sleep 1
	xautolock-init.sh
	[[ $(pgrep xautolock) ]] && echo "[FIXED] xautolock started" || "[FAIL] xautolock failed to start"
fi

if [[ $(localectl status | grep dvorak) ]] ; then
	echo "[OK] Keyboard is set to: dvorak"
else
	echo -e "\n[Error] The keyboard layout is not dvorak"
	setxkbmap dvovark
	[[ $(localectl status | grep dvorak) ]] && echo "[FIXED] Set keyboard layout to: dvorak" || "[FAIL] Could not set keyboard to: dvorak"
fi

if [[ $(xmodmap -pke | grep " 66" | grep 8) ]] ; then
	echo "[OK] Eight key enabled"
else
	echo -e "\n[Error] Eight key not enabled. Enabling eight key..."
	enable-eight-key.sh
	[[ $(xmodmap -pke | grep " 66" | grep 8) ]] && echo "[FIXED] Enabled eight key" || echo "[FAIL] Could not enable eight key"
fi

if [[ $SOLARIZED > 0 ]] ; then
	echo "[OK] SOLARIZED is set to: $SOLARIZED"
else
	echo -e "\n[Error] SOLARIZED variable is not set.\nSet SOLARIZED manually or by sourcing '.env'..."
fi
