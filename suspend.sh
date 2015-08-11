#!/bin/bash
xautolock -detectsleep -locker slock -locknow; sleep 4 && sudo systemctl suspend
