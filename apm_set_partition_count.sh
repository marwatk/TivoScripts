#!/bin/bash

device=$1
partitioncount=$2

for(( i=1; i<=$partitioncount; i++ )) 
    do
        ./apm_write_value.sh $device $i 4 4 $partitioncount  
    done

