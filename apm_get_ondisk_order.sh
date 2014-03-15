#!/bin/bash

device=$1
partnum=$2

numpartitions=`./apm_get_partition_count.sh $device`
firstblock=`./apm_get_first_block_number.sh $device $partnum`

position=1

for (( i=1; i<=$numpartitions; i++ ))
do
    if [ $i -ne $partnum ]
    then
        tfirstblock=`./apm_get_first_block_number.sh $device $i`
        if [ $tfirstblock -lt $firstblock ]
        then
            position=$((position+1))
        fi
    fi
done
printf "%i" $position


