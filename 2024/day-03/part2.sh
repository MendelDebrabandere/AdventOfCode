#!/usr/bin/env bash

inputfile="$1"


mulstring=$( grep -Eo "(do\(\)|don't\(\)|mul\([0-9]{1,3},[0-9]{1,3}\))" "$inputfile" )


totalVal=0

llDo=true

while read -r line; do
	
	echo "$line"
	
	if [[ $line == 'do()' ]]; then
		llDo=true
	elif [[ $llDo == 'true' && $line =~ mul\(([0-9]+),([0-9]+)\) ]]; then
		echo "$line"
		echo $(( BASH_REMATCH[1] * BASH_REMATCH[2] ))
		(( totalVal += BASH_REMATCH[1] * BASH_REMATCH[2] ))
	else
		llDo=false		
	fi
	



done <<< "$mulstring"


echo $totalVal
