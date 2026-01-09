#!/usr/bin/env bash

SRC="${1:-./src}"
OUT="${2:-lib-pure-math.txt}"

if [[ -f "$OUT" ]]; then 
    rm -f "$OUT"
fi

find "$SRC" -type f | while read file; do
    fn=$(basename "$file")
    nn="${fn%.txt}"
    awk -v name="$nn" '
    {
        print $0 "$" name
    }' "$file" >> "$OUT"
done
