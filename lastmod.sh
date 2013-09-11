#!/bin/bash

if [ $2 ]; then
	ls -lth $1 |head -$2
else
	ls -lth $1 |head -5
fi

