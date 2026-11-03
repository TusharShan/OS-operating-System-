#!/bin/bash

if [ "$#" -ne 3 ]
then
    echo "Usage: $0 filename start_line end_line"
fi

file="$1"
start="$2"
end="$3"

sed -n "${start},${end}p" "$file"
