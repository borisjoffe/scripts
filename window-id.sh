#!/bin/bash

windows-on-active-desktop.sh | row.sh $1 | awk '{print $1}'
