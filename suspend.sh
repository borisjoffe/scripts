#!/bin/bash
echo "Suspending..."
xautolock -locknow
sleep 2
systemctl suspend
