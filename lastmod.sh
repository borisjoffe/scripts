#!/bin/bash

# Deps: usage, all-but-last-elements

USAGE="lm [0 or more args to ls] [path] [number of files display] \n\
argument priority is: path, number of files, ls args"
usage.sh "$USAGE" $@ && exit

if [[ $# > 2 ]]; then
	LS_ARGS=`all-but-last-elements $@`
	shift $(($#-2))
fi

NUM_FILES=${2:-5}

ls -lth $LS_ARGS $1 | tail -n+2 |  head -$NUM_FILES
