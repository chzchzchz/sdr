#!/bin/bash

if [ -z "$SHOWOPTS" ]; then
	SHOWOPTS="s=2048x800:mode=separate"
fi

if [ -z "$FMT" ]; then
	FMT="-f u8"
fi

ffmpeg $FMT -ar 2048000 -ac 2 -i $INPUT  -lavfi showspectrumpic="$SHOWOPTS" $OUTPUT
