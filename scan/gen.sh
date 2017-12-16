#!/bin/bash
freq="$1"
SDRPATH=/mnt/hive/sdr/

for a in ${SDRPATH}/2017-*/"${freq}"*; do
	outname=`basename "$a"`.png
	outpath="${SDRPATH}/png/${outname}"
	if [ -e "$outpath" ]; then
		echo skipping $outpath
		continue
	fi
	tmpfile=`basename "$a"`.tmp
	zcat $a >"$tmpfile" &
	docker run -u `id -u`  --rm  -v `pwd`:/sdr/ -e INPUT=/sdr/"$tmpfile" -e OUTPUT=/sdr/"$outname" -e SHOWOPTS="s=960x4000:mode=combined:color=rainbow:scale=sqrt"  -t sdr-ffmpeg:latest  /run.sh
	rm "$tmpfile"
	mv $outname "$outpath"
done