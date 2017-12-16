#!/bin/bash

set -e

MAXIFACE=2
#MHZ_MIN=599000000
MHZ_MIN=30000000
MHZ_MAX=1750000000
SDRPATH=/mnt/hive/sdr/`date +%Y-%m-%d-%H:%M:%S`
mkdir -p "$SDRPATH"

function record {
	idx="$1"
	for freq in `seq $MHZ_MIN 1000000 $MHZ_MAX`; do
		./record.sh $idx $freq
	done
}

mkdir -p $SDRPATH
sdrpids=""
for i in `seq 0 $MAXIFACE`; do
	./record.sh $i &
	sdrpids="$sdrpids $!"
	sleep ${REC_SECONDS}s
done

wait $sdrpids

sleep 1d
exit 0
