#!/bin/sh
# Compares baserom-power.gbc and telepower.gbc

# create baserom.txt if necessary
if [ ! -f baserom.txt ]; then
	hexdump -C baserom-power.gbc > baserom.txt
fi

hexdump -C telepower.gbc > telepower.txt

diff -u baserom.txt telepower.txt | less
