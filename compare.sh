#!/bin/sh
# Compares baserom-power.gbc and telepower.gbc

# create baserom.txt if necessary
if [ -z "$1" ]; then
	rom=power
else
	rom=$1
fi

if [ ! -f baserom-${rom}.txt ]; then
	hexdump -Cv baserom-${rom}.gbc > baserom-${rom}.txt
fi

hexdump -Cv tele${rom}.gbc > tele${rom}.txt

diff -u baserom-${rom}.txt tele${rom}.txt | less
