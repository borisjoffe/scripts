#!/bin/bash

# 2 min
SLEEPTIME=30
# for debugging
#SLEEPTIME=10

dropbox-cli start
backup-important > /dev/null
sleep 15
echo "backing up and syncing"

until [[ `dropbox-cli status` == "Up to date" ]]; do
	echo -n "*"
	sleep $SLEEPTIME;
	backup-important > /dev/null
done

echo -e "\n\ndropbox done syncing. stopping dropbox..."
dropbox-cli stop

