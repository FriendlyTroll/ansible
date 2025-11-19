#!/bin/bash
# src: https://github.com/lobau/nautilus-scripts/blob/main/scripts/Asset%20convertion/PNG%20%E2%86%92%20JPG
while [ $# -gt 0 ]; do
	picture=$1
	png_file=`echo "$picture" | sed 's/\.\w*$/.png/'`
	/usr/bin/mogrify -format jpg "$png_file"
	shift
done
