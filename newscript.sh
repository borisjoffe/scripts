#!/bin/bash

set -ueo pipefail

read -r -d '' USAGE << EOM || true
$(basename $0) ...ARGS
EOM
usage.sh "$USAGE" $@ && exit
#[ $# -lt 1 ] && $0 --help && exit

#requires SOME_PROGRAM || exit
#requires-file SOME_FILE || exit

newScriptFilename="${0%/*}/$1"
head -n-3 "$0" > "$newScriptFilename"  # create a copy of this template to start a new script
chmod u+x "$newScriptFilename"
