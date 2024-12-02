#!/usr/bin/env bash

inputfile="$1"

currfloor=0
index=0

while read -r char ; do

	(( index += 1 ))

	if [[ $char == '(' ]]; then
		(( currfloor += 1 ))
	elif [[ $char == ')' ]]; then
		(( currfloor -= 1 ))
	fi

	if (( currfloor == -1 )); then
		echo $index
		break
	fi
		

done < <(fold -b1 "$inputfile" )


