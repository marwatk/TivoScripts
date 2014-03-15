#!/bin/bash

device=$1
partnum=$2

./apm_read_string.sh $device $partnum 16 32


