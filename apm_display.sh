#!/bin/bash

device=$1

numpartitions=`./apm_get_partition_count.sh $device`

echo "Part      First      Actual     Optimal Disk                                 "
echo "Num       Block        Size        Size Order              Type          Name"


for (( i=1; i<=$numpartitions; i++ ))
do
    first_block=`./apm_get_first_block_number.sh $device $i`
    name=`./apm_get_partition_name.sh $device $i`
    type=`./apm_get_partition_type.sh $device $i`
    size=`./apm_get_partition_size.sh $device $i`
    optimal=`./apm_get_optimal_size.sh $device $i`
    position=`./apm_get_ondisk_order.sh $device $i`
    printf "%02i  % 11i % 11i % 11i %02i % 20s %s\n" $i $first_block $size $optimal $position $type "$name" 
done
