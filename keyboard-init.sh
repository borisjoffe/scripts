#!/bin/bash

setxkbmap -layout dvorak,ru,us -model inspiron -option compose:menu

# Disable CAPS LOCK
# Switch layouts by pressing both shift keys
setxkbmap -option caps:none,grp:shifts_toggle


# remap Caps lock to '8' and '*'
xmodmap -e 'keycode 66=8 asterisk 8 asterisk 8 asterisk'
