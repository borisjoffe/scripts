#!/bin/bash

# 2 min
SLEEPTIME=30
# for debugging
#SLEEPTIME=10

dropbox-cli start
backup-important > /dev/null
sleep 15

until [[ `dropbox-cli status` == "Up to date" ]]; do
	echo "dropbox not synced....backing up and syncing"
	sleep $SLEEPTIME;
	backup-important > /dev/null
done

echo -e "\ndropbox done syncing. stopping dropbox..."
dropbox-cli stop

