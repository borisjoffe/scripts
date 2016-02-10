#!/bin/bash

# 2 min
SLEEPTIME=30
# for debugging
#SLEEPTIME=10

dropbox-cli start
sleep 15
echo "syncing"

until [[ `dropbox-cli status` == "Up to date" ]]; do
	echo -n "*"
	sleep $SLEEPTIME;
done

echo -e "\n\ndropbox done syncing. stopping dropbox..."
dropbox-cli stop

