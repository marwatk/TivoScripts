#!/bin/bash

source=$1
source_pos=$2
dest=$3
dest_pos=$4
size=$5

#runs every 30 second forcing dd to output status
./ddmonitor.sh 
disown $!

echo "dd if=$source of=$dest seek=$dest_pos skip=$source_pos bs=512 count=$size conv=notrunc"
dd if=$source of=$dest seek=$dest_pos skip=$source_pos bs=512 count=$size conv=notrunc 2>&1 | grep --line-buffered -v records | ./ddprint.sh
printf "\nComplete\n"
killall ddmonitor.sh > /dev/null 2>&1

#TODO: I can't figure out how to make ddrescue copy to different locations

