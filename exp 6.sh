#!/bin/bash
for arg in "$@"
do
        tr '[:lower:]' '[:upper:]' <  "$arg" > temp
        mv temp "$arg"
        echo "$arg converted to uppercase"
done 
