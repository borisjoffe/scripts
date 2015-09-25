#!/bin/bash

wmctrl -l | awk '$2 == '$($HOME/bin/active-desktop.sh)
