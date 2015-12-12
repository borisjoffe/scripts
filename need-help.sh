#!/bin/bash

# Usage: need-help.sh $@
# Example: need-help.sh $@ && echo "USAGE: some-command arg1 [arg2]" && exit

[[ ($1 == "-h") || ($1 == "help") || ($1 =~ "-help") ]] && exit 0 || exit 1
