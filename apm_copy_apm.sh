#!/bin/bash

source=$1
dest=$2

#Todo: confirm disks involved before proceeding

dd if=$source of=$dest bs=512 count=64 conv=notrunc


