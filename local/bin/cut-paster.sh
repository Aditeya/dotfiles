#!/bin/sh

sleep 1
while read LINE
do
	xdotool type "$LINE"
	xdotool key "Return"
	sleep 3
done < $1
