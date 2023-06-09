#!/bin/bash

# Script generated by ChatGPT on 2023-03-30

if [ -z "$1" ]; then
    echo "Usage: $0 match [prefix]"
    echo "Search for PDF files containing the match string and rename them with the prefix (default: match)"
    exit 1
fi

match="$1"
prefix="${2:-$match}"

# Use find to get a list of PDF files, and pass them to parallel
find . -maxdepth 1 -name 'T*.pdf' -print0 |
  parallel -0 -j "$(nproc)" "
    if pdf2txt {} | grep -q '$match'; then
        # Remove the "./" prefix from the file name
        newname=\"${prefix}_\$(${SED-sed} -e 's#^\./##' <<< '{}')\"
        mv {} \"\$newname\"
        echo \"Renaming {} to '\$newname'\"
    else
        echo 'Skipping {}'
    fi
  "
