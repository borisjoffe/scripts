#!/bin/bash

if [[ $# > 2 ]]; then
	LS_ARGS=$1
	shift
fi

NUM_FILES=${2:-5}

ls -lth $LS_ARGS $1 | tail -n+2 |  head -$NUM_FILES
