#!/bin/bash

mkdir -p chan/
for a in chan/*.out; do
	echo making $a into FIFO
	rm $a
	mkfifo $a
done

for a in chan/*.out; do
	( cat $a | multimon-ng -a FLEX - >>$a.txt ) &
done

wait