#!/bin/bash

while read LINE; do
    printf "%s\r" "$LINE"
done
