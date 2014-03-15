#!/bin/bash

#Assumes partition block count == data block count

device=$1
partnum=$2

./apm_read_value.sh $device $partnum 12 4


