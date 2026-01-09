#!/usr/bin/env bash

rm ./lib-pure-math.txt
SRC_DIR="${1:-./src}"
OUTPUT_FILE="${2:-lib-pure-math.txt}"

find "$SRC_DIR" -type f | while read file; do
    filename=$(basename "$file")
    name_no_ext="${filename%.*}"
    
    [[ "$name_no_ext" == "$filename" ]] && name_no_ext="$filename"
    awk -v name="$name_no_ext" '
    {
        print $0 "$" name
    }' "$file" >> "$OUTPUT_FILE"
done