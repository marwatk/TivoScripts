#!/bin/bash

#read bytes of a file
blocksize=512

device=$1
partnum=$2
offset=$3
length=$4

let blockstart=$blocksize*$partnum
let valuestart=$blockstart+$offset

dd if=$device bs=1 skip=$valuestart count=$length 2>/dev/null

