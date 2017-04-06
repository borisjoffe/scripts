#!/bin/bash

set -ueo pipefail

rsync_ignore='.rsyncignore'

read -r -d '' USAGE << EOM || true
$(basename $0) <standard rsync args>

Run rsync while excluding patterns from any "$rsync_ignore" files
in the current directory or any parent directory.
EOM
usage.sh "$USAGE" $@ && exit
[ $# -lt 1 ] && $0 --help && exit

requires rsync || exit
#requires-file SOME_FILE || exit


rsync_args=""

pathname=$(namei "$(realpath .)" | grep '^ d' | cut -c4-)
#pathname=( / home boris )  # for testing

abs_dir=
#echo $pathname

for dir in ${pathname[*]}; do
	#echo "dir - $dir"

	if [[ "/" == "$dir" ]]; then
		# initial top level directory
		abs_dir=""
	else
		abs_dir="$abs_dir/$dir"
		# echo "absdir - $abs_dir"
	fi

	#ignore=$(realpath --relative-to=. "$abs_dir/$rsync_ignore")
	ignore="$abs_dir/$rsync_ignore"
	#echo "ignore - $ignore"

	if [[ -f "$ignore" ]]; then
		: echo "Excluding patterns from $ignore"
		rsync_args+=" --exclude-from=$ignore"
	else
		: echo "file does not exist - $ignore"
	fi
done

DBG=${DBG-}
if [ -n "$DBG" ]; then
	rsync_args+=" --dry-run"
fi

echo rsync $rsync_args $@
rsync $rsync_args $@
