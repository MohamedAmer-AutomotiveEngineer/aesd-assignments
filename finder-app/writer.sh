#!/bin/bash

# Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; the second argument is a text string which will be written within this file, referred to below as writestr
writefile=$1
writestr=$2
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Usage: $0 <file> <string>"
    exit 1
fi

# Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.
mkdir -p "$(dirname "$writefile")"
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not create file $writefile."
    exit 1
fi
