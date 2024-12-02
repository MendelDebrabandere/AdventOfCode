#!/usr/bin/env bash

inputfile="$1"

totalSqFeet=0

while read -r line ; do

	width=$(cut -d 'x' -f 1 <<< "$line")
	length=$(cut -d 'x' -f 2 <<< "$line")
	height=$(cut -d 'x' -f 3 <<< "$line")	

    area1=$(( width * length ))
    area2=$(( length * height ))
    area3=$(( height * width ))	

	smallestArea=$area1
    if (( area2 < area1 )); then
        smallestArea=$area2
    fi

    if (( area3 < smallestArea )); then
        smallestArea=$area3
    fi

	(( totalSqFeet += 2 * area1 + 2 * area2 + 2 * area3 + smallestArea ))	

done < "$inputfile"

echo $totalSqFeet













