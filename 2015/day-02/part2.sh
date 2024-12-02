#!/usr/bin/env bash

inputfile="$1"

totalSqFeet=0

while read -r line ; do

	width=$(cut -d 'x' -f 1 <<< "$line")
	length=$(cut -d 'x' -f 2 <<< "$line")
	height=$(cut -d 'x' -f 3 <<< "$line")	
	
	perimeter1=$(( 2 * (width + length) ))
	perimeter2=$(( 2 * (length + height) ))
	perimeter3=$(( 2 * (height + width) ))	

    if (( perimeter1 <= perimeter2 )); then
        smallPer=$perimeter1
	else
		smallPer=$perimeter2
    fi

	if (( smallPer <= perimeter3 )); then
		smallestPer=$smallPer
	else
		smallestPer=$perimeter3
	fi
	
	(( totalSqFeet += smallestPer + width * length * height ))

done < "$inputfile"

echo $totalSqFeet













