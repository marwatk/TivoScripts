#!/bin/bash

source=$1
dest=$2
shift
shift

echo "$source => $dest"

#todo confirm source and dest disks

copy_cmd="./ddfast.sh"

./apm_copy_apm.sh $source $dest
first_block=1

cmd_count=0

while [ "$1" != "" ]; do
    partnum=$1
    shift
    optimal_size=`./apm_get_optimal_size.sh $source $partnum`
    ./apm_set_first_block_number.sh $dest $partnum $first_block
    ./apm_set_partition_size.sh $dest $partnum $optimal_size
    source_start=`./apm_get_first_block_number.sh $source $partnum`
    if [ $partnum != 1 ]; then #We already copied the apm
        dd_cmds[$cmd_count]="$copy_cmd $source $source_start $dest $first_block $optimal_size"
        human_size=`./util_blocks_to_size.sh $optimal_size`
        dd_txt[$cmd_count]="Copying partition $partnum with size $human_size"
        cmd_count=$(($cmd_count + 1))
    fi
    first_block=$(($first_block + $optimal_size))
done
echo "====================="
echo "Source APM Structure:"
echo "====================="
./apm_display.sh $source

echo ""
echo ""
echo "=========================="
echo "Destination APM Structure:"
echo "=========================="
./apm_display.sh $dest


read -p "\nPress enter if everything looks correct.\n";

printf "About to run:\n"

for (( i=0; i<$cmd_count; i++ ))
do
    echo ${dd_cmds[$i]}
done

read -p "Press [enter] to continue..."
for (( i=0; i<$cmd_count; i++ ))
do
    echo ${dd_txt[$i]}
    ${dd_cmds[$i]}
done


