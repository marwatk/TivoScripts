#!/bin/bash

device=$1
partnum=$2
first_block_number=$3

./apm_write_value.sh $device $partnum 8 4 $first_block_number


