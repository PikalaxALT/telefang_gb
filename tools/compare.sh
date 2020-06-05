#!/bin/sh
# Compares baserom.gbc and telepower.gbc

# create baserom.txt if necessary
if [ ! -f baserom.txt ]; then
	hexdump -Cv baserom.gbc > baserom.txt
fi

hexdump -Cv telepower.gbc > telepower.txt

diff -u baserom.txt telepower.txt | less
