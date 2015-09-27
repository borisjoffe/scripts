#!/bin/bash

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
if [ -z $1 ]; then
    echo "USAGE: weather.sh <locationcode>"
    exit 0;
fi

# Feed website
# http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=08901

wget -q http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 -O - | awk \
'/Currently:/ {CurWeather=$0}
/[0-9] Forecast<\/title>/ {nr=NR+5}
NR==nr    {postIndx[++x]=$0}
# x>2    {exit}
END{
    split(CurWeather,tmp,"Currently: ")
    split(tmp[2],tmp1,"<")
    CurWeather=sprintf("%s",tmp1[1])
    sub(":",",",CurWeather)
    for(x in postIndx){
    split(postIndx[x],tmp,";|&")
    split(tmp[1],tmp,">")
    split(tmp[2],statement," C ") # substitute C for F if metric differs
    split(tmp[2],temp)
    forecast[++y]=sprintf("%d-%dC %-15s",temp[5],temp[2],statement[3])
    }
    printf("WEATHER:\nCurrently: %s\nToday: %s\nTomorrow: %s\n", CurWeather, forecast[1], forecast[2])
}'
