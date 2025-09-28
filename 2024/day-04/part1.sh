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


check_dir() {
    local r=$1 c=$2 dr=$3 dc=$4
    local word="XMAS"
    for ((i=0; i<${#word}; i++)); do
        nr=$((r + dr*i))
        nc=$((c + dc*i))
        # Bounds check
        if ((nr < 0 || nr >= rows || nc < 0 || nc >= cols)); then
            return 1
        fi
        if [[ ${grid[$nr,$nc]} != "${word:i:1}" ]]; then
            return 1
        fi
    done
    return 0
}

count=0
for ((r=0; r<rows; r++)); do
    for ((c=0; c<cols; c++)); do
        if [[ ${grid[$r,$c]} = "X" ]]; then
            # 8 directions: (dr,dc)
            for dr in -1 0 1; do
                for dc in -1 0 1; do
                    # skip 0,0 (no movement)
                    [[ $dr == 0 && $dc == 0 ]] && continue
                    if check_dir "$r" "$c" "$dr" "$dc"; then
                        ((count += 1))
                    fi
                done
            done
        fi
    done
done

echo $count







