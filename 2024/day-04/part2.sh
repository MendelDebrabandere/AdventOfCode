#!/usr/bin/env bash
set -euo pipefail

declare -A grid

row=0
while read -r line; do
    # split line into characters
    cols=${#line}
    for ((col=0; col<${#line}; col++)); do
        grid[$row,$col]="${line:col:1}"
    done
    ((row += 1))
done < input.txt

rows=$row


check_xmas() {
    local r=$1 c=$2
    local r_up=$((r-1)) r_dn=$((r+1))
    local c_lt=$((c-1)) c_rt=$((c+1))

    # ensure the A has a full X around it
    ((r_up >= 0 && r_dn < rows && c_lt >= 0 && c_rt < cols)) || return 1

    # collect the 4 corner letters
    local ul=${grid[$r_up,$c_lt]}
    local ur=${grid[$r_up,$c_rt]}
    local dl=${grid[$r_dn,$c_lt]}
    local dr=${grid[$r_dn,$c_rt]}

    # valid X-MAS patterns: M/S on each diagonal in either order
    if [[ ( $ul == M && $dr == S || $ul == S && $dr == M ) &&
          ( $ur == M && $dl == S || $ur == S && $dl == M ) ]]; then
        return 0    # success
    fi
    return 1
}

count=0
for ((r=0; r<rows; r++)); do
    for ((c=0; c<cols; c++)); do
        if [[ ${grid[$r,$c]} = "A" ]]; then
            check_xmas "$r" "$c" && ((count += 1))
        fi
    done
done

echo $count







