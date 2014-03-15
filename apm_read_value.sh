#!/bin/bash

#read bytes of a file
blocksize=512

device=$1
partnum=$2
offset=$3
length=$4

let blockstart=$blocksize*$partnum
let valuestart=$blockstart+$offset

hex=`(dd status=noxfer if=$device bs=1 skip=$valuestart count=$length 2>/dev/null) | xxd -p -u`
dec=$((16#$hex))
echo $dec

