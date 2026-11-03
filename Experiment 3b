#!/bin/bash
for file in "$@"
do
    if [ -f "$file" ]
    then
        mv "$file" "$(echo "$file" | tr '[:lower:]' '[:upper:]')"
        echo "$file Changed"
    else
        echo "$file does not exist"
    fi
done
