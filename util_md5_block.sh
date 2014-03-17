#!/bin/bash

device=$1
block=$2

dd if=$device bs=512 count=1 skip=$block 2>/dev/null | md5sum -b | cut -b 1-31 | tr -d \\n

