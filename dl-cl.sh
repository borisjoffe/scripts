#!/bin/bash

myfile="housing.csv"
skiplines=18
urlFile=$1
doWget=$2

lines=$(wc -l $myfile | awk '{ print $1 }')
lines=$(($lines-1-$skiplines))
cat housing.csv | awk '{ print $1 }' |tail -n $lines > $urlFile
if [ $lines -eq 0 ]
then
	echo "No new URLs to add"
else
	cat $urlFile
fi

# rate limit 100kb/s 	--limit-rate=100k
# recursively retrieve to depth 1		-r -l 1
# wait 0.5 to 1.5 seconds between resources 		-w 1
# span hosts	-H
# convert links in files to be viewable in html viewer 	-k
# no host directories 	-nH

if [ "dl" == "$doWget" ]
then
	echo -e "\n\nDownloading..."
	wget --limit-rate=100k -r -l 1 -w 1 --random-wait -H -k -nH -p -i $urlFile
fi
