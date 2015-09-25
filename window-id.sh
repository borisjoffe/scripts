#!/bin/bash

windows-on-active-desktop.sh | row $1 | awk '{print $1}'
