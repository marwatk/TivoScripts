#!/bin/bash

source=$1
source_pos=$2
dest=$3
dest_pos=$4
size=$5

block_size=512

#runs every second forcing dd to output status
./ddmonitor.sh &
disown $!

echo "  dd if=$source of=$dest seek=$dest_pos skip=$source_pos bs=512 count=$size conv=notrunc"

dd if=$source of=$dest seek=$dest_pos skip=$source_pos bs=$block_size count=$size conv=notrunc 2>&1 | grep --line-buffered -v records | ./ddprint.sh
printf "\nComplete\n"
killall ddmonitor.sh > /dev/null 2>&1


