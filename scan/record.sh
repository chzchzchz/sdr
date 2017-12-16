#!/bin/bash

SAMP_RATE=2048000
REC_SECONDS=40
#SDRPATH=/mnt/hive/sdr/`date +%Y-%m-%d-%H:%M:%S`
#GAIN="-g  BB_gain=10,IF_gain=45,RF_gain=45"
#COMPRESS="gzip -"
COMPRESS="pigz -p 2 -"

IDX="$1"
FREQ="$2"

t=`date +%Y-%m-%d-%H:%M:%S`
echo ====================$(date) "idx=${idx}" "freq=${freq}"======================
echo ===================================
rtl_sdr -d $IDX $GAIN -f $FREQ -s $SAMP_RATE -n $((1 + SAMP_RATE * REC_SECONDS)) - | $COMPRESS >"${SDRPATH}/${freq}-${t}.${idx}.sdr.gz"
echo ====================================
