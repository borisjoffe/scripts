#!/bin/bash
# Deps: need-help.sh

# Usage: usage.sh "usage message" $@
# Example: usage.sh "some-command arg1 [arg2]" $@ && exit

set -u

usageText=$1
shift
need-help.sh $@ && echo -e "USAGE: $usageText" && exit
