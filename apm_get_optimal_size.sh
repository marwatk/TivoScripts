#!/bin/bash

device=$1
partnum=$2

type=`./apm_get_partition_type.sh $device $partnum`
actual=`./apm_get_partition_size.sh $device $partnum`

if [ $type == "MFS" ]
then
    mod=$(($actual % 1024))
    optimal=$(($actual - $mod))
    printf "%i" $optimal
else
    if [ $type == "Image" -a $actual -eq 1 ]
    then
        printf "%i" 8
    else
        printf "%i" $actual
    fi
fi


