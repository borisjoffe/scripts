#!/bin/bash

# Maps 8 and * to CAPS LOCK while disabling CAPS LOCK

setxkbmap -option caps:none
xmodmap -e 'keycode 66=8 asterisk 8 asterisk 8 asterisk'
