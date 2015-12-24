#!/bin/bash

help='presentmode.sh [on|off]'
usage.sh $help $@ && exit

case $1 in
on)
	redshift -x
	pkill redshift
	pkill workrave
	;;
off)
	nohup redshift -o &
	nohup workrave &
	;;
*)
	echo "USAGE: $help"
esac

