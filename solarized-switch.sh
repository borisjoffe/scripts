#!/bin/zsh

OLD_SOLARIZED=$SOLARIZED

if [ $1 ]; then
	export SOLARIZED=$1
elif [[ $SOLARIZED == 1 ]]; then
	# toggle to light
	export SOLARIZED=2
	echo "SOLARIZED is light"
else
	# toggle to dark (if not set to 1) - default
	export SOLARIZED=1
	echo "SOLARIZED is dark"
fi

fish -c "source $HOME/bin/solarized-switch.fish"

if [[ $SOLARIZED == 1 ]]; then
	xrdb -override "$HOME/.Xresources.solarized"
	alias tmux='tmux-dark.sh'
elif [[ $SOLARIZED == 2 ]]; then
	xrdb -override "$HOME/.Xresources.solarized-light"
	alias tmux='tmux-light.sh'
fi
