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



similarityScore=0



for item1 in "${array1[@]}"; do 
	
	echo checking similarity of: "$item1"
	
	equalsForItem1=0
	
	for item2 in "${array2[@]}"; do
		if [[ $item1 -eq $item2 ]]; then
			(( equalsForItem1 += 1 ))
		fi
	done

	echo "$item1" has "$equalsForItem1" equal items in the second array
	(( similarityScore += equalsForItem1 * item1 ))

done


echo $similarityScore

