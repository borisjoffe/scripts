#!/bin/bash

windows-on-active-desktop.sh | tail -1 | awk '{print $1}'
