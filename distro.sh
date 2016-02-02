#!/bin/bash

if [[ $1 =~ "help" ]]; then
	echo 'First argument (TYPE) can be "id" (default), "name", "pretty_name", etc"'
	exit
fi

TYPE=${1:-"ID"}

# convert to uppercase
TYPE=`echo $TYPE | tr '[:lower:]' '[:upper:]'`

# TODO: doesn't work for Ubuntu
# fields are in the form DISTRO_<FIELD>=
grep "^"$TYPE /etc/*release | awk -F= '{print $2}' | sed 's/"//g'
