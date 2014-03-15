#!/bin/bash

#zero's out the partition entry (does not update partition count)

blocksize=512

device=$1
sourcepart=$2
destpart=$3

dd if=$device of=$device bs=$blocksize skip=$sourcepart seek=$destpart count=1 conv=notrunc 2>/dev/null 

