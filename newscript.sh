#!/bin/bash

set -ueo pipefail

read -r -d '' USAGE << EOM || true
$(basename $0) ...ARGS
EOM
usage.sh "$USAGE" $@ && exit

#requires
#requires-file
