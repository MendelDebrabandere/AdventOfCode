#!/usr/bin/env bash

inputfile=$1

cat "$inputfile"

# init the 2 arrays of data
array1=()
array2=()

mapfile -t array1 < <(cut -d ' ' -f 1 "$inputfile")
mapfile -t array2 < <(cut -d ' ' -f 4 "$inputfile")
echo "${array1[@]}"
echo "${array2[@]}"



distanceSum=0

while [[ ${#array1[@]} -gt 0 ]]; do
	
	# reset lowestitems
	lowestItemIdx1=-1
	lowestItemIdx2=-1
	lowestItem1=99999999999999
	lowestItem2=99999999999999


	# debug print array
	echo "${array1[@]}"
	echo "${array2[@]}"

	# get the lowest value item in each array
	for (( idx = 0; idx < ${#array1[@]}; ++idx )); do
		if [[ ${array1[$idx]} -le $lowestItem1 ]]; then
			lowestItem1=${array1[$idx]}
			lowestItemIdx1=$idx
		fi
		if [[ ${array2[$idx]} -le $lowestItem2 ]]; then
			lowestItem2=${array2[$idx]}
			lowestItemIdx2=$idx
		fi
	done

	# add difference of values to the sum
	(( distanceSum += (lowestItem1 - lowestItem2) < 0 ? -(lowestItem1 - lowestItem2) : (lowestItem1 - lowestItem2) ))

	
	# debug output
	echo lowest item from arr1: "$lowestItem1"
	echo lowest item from arr2: "$lowestItem2"

	echo distance sum: $distanceSum

	# remove those elemets from their arrays
	unset "array1[$lowestItemIdx1]"
	unset "array2[$lowestItemIdx2]"

    # Rebuild the arrays without the unset elements
    array1=("${array1[@]}")
    array2=("${array2[@]}")
done




