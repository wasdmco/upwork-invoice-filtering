#!/bin/bash

# Check if a single argument was provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 prefix"
    exit 1
fi

# Assign the argument to a variable
prefix="$1"

# Loop over files in the current directory
for file in "$prefix"*; do
    # Extract the file extension
    extension="${file##*.}"

    # Construct the new file name without the prefix
    new_name="${file#$prefix}"

    # Rename the file
    mv "$file" "$new_name"
done
