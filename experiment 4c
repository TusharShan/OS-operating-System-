#!/bin/bash

if [ "$#" -lt 2 ]
then
    echo "Need atleast two arguments"
fi

word="$1"
shift

for file in "$@"
do
    if [ -f "$file" ]
    then
        sed -i "/$word/d" "$file"
        echo "Deleted lines containing '$word' from $file"
    else
        echo "$file does not exist."
    fi
done
