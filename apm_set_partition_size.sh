#!/bin/bash

device=$1
partnum=$2
size=$3

#partition block count
./apm_write_value.sh $device $partnum 12 4 $size

#data block count
./apm_write_value.sh $device $partnum 84 4 $size


