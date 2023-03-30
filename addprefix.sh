#!/bin/bash

# Script generated by ChatGPT on 2023-03-30

if [ -z "$1" ]; then
    echo "Usage: $0 match [prefix]"
    echo "Search for PDF files containing the match string and rename them with the prefix (default: match)"
    exit 1
fi

match="$1"
prefix="${2:-$match}"

for file in *.pdf; do
    if pdf2txt "$file" | grep -q "$match"; then
        newname="${prefix}_$file"
        mv "$file" "$newname"
        echo "Renaming $file to $newname"
    else
        echo "Skipping $file"
    fi
done
