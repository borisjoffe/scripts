#!/bin/bash

setxkbmap dvorak &
setxkbmap -option compose:menu
. $HOME/bin/enable-eight-key.sh &
