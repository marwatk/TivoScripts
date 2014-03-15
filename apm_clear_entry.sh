#!/bin/bash

#zero's out the partition entry (does not update partition count)

blocksize=512

device=$1
partnum=$2

dd if=/dev/zero of=$device bs=$blocksize seek=$partnum count=1 conv=notrunc 2>/dev/null 

