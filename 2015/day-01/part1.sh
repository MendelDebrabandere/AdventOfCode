#!/usr/bin/env bash

inputfile="$1"

currfloor=0

while read -r char ; do

	if [[ $char == '(' ]]; then
		(( currfloor += 1 ))
	elif [[ $char == ')' ]]; then
		(( currfloor -= 1 ))
	fi

done < <(fold -b1 "$inputfile" )

echo $currfloor
