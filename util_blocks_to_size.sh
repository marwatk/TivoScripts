#!/bin/bash

blocks=$1

bytes=$(($blocks * 512))

#DD uses base 10 conversions

if [ $bytes -gt 1000000000000 ]; then
    printf "%.1fTB" `echo "$bytes/1000000000000" | bc`
    exit 0
fi

if [ $bytes -gt 1000000000 ]; then
    printf "%.1fGB" `echo "$bytes/1000000000" | bc`
    exit 0
fi

if [ $bytes -gt 1000000 ]; then
    printf "%.1fMB" `echo "$bytes/1000000" | bc`
    exit 0
fi

if [ $bytes -gt 1000 ]; then
    printf "%.1fKB" `echo "$bytes/1000" | bc`
    exit 0
fi

printf "%iB" $bytes

