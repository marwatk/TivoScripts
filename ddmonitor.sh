#!/bin/bash

while [ true ]; do
	killall -USR1 dd 2>/dev/null
	sleep 1
done
