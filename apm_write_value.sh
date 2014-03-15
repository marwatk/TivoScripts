#!/bin/bash

#read bytes of a file
blocksize=512

device=$1
partnum=$2
offset=$3
length=$4
value=$5

let hexlength=$length*2

hex=`printf "%0${hexlength}X" $value`
let blockstart=$blocksize*$partnum
let valuestart=$blockstart+$offset

echo $hex | xxd -r -p | dd of=$device bs=1 seek=$valuestart count=$length conv=notrunc 2>/dev/null

