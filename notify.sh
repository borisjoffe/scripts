#!/bin/bash

[[ $DISPLAY ]] && xmessage -center "$@" || wall "$@"
