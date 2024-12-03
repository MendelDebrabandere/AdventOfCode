#!/usr/bin/env bash

inputfile=$1

# init the 2 arrays of data
array1=()
array2=()

mapfile -t array1 < <(cut -d ' ' -f 1 "$inputfile" | sort)
mapfile -t array2 < <(cut -d ' ' -f 4 "$inputfile" | sort)


distanceSum=0

for (( idx = 0 ; idx < ${#array1[@]} ; ++idx )); do

	(( distanceSum += (array1[idx] - array2[idx]) < 0 ? -(array1[idx] - array2[idx]) : (array1[idx] - array2[idx]) ))

done
	
echo distance sum: $distanceSum





