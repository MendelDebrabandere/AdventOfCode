#!/usr/bin/env bash

inputfile="$1"


mulstring=$( grep -Eo 'mul\(([0-9]){1,3},([0-9]){1,3}\)' "$inputfile" | sed -E 's/mul\(([0-9]{1,3}),([0-9]{1,3})\)/\1*\2/g' )


mulstring=$( echo "$mulstring" |  tr ' ' '+' )


output=$(( mulstring ))


echo $output
