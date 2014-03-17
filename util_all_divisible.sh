#!/bin/bash

divisor=$1

while [ "$1" != "" ]
do
    numerator=$1
    mod=$(($numerator % $divisor))
    shift
    if [ $mod != 0 ]; then
        printf "0"
        exit 0
    fi
done
printf "1"
exit 1
