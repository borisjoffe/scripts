#!/bin/bash
sudo echo "Suspending..." # to ask for sudo password immediately
xautolock -detectsleep -locker slock -locknow; sleep 2 && sudo systemctl suspend
