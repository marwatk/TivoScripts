#!/bin/bash

blocks=$1

bytes=$(($blocks * 512))

if [ $bytes -gt 1099511627776 ]; then
    printf "%.1fTB" `echo "$bytes/1099511627776" | bc`
    exit 0
fi

if [ $bytes -gt 1073741824 ]; then
    printf "%.1fGB" `echo "$bytes/1073741824" | bc`
    exit 0
fi

if [ $bytes -gt 1048576 ]; then
    printf "%.1fMB" `echo "$bytes/1048576" | bc`
    exit 0
fi

if [ $bytes -gt 1024 ]; then
    printf "%.1fKB" `echo "$bytes/1024" | bc`
    exit 0
fi

printf "%iB" $bytes

