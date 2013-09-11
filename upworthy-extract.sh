#!/bin/bash

#echo $@
#curl -s $1
curl -s $1 |grep youtube | sed 's/embed\//watch\?v=/'| sed -n 's/.*\(youtube.com.*\)?.*/http:\/\/\1/p' |head -1
