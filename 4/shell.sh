#!/usr/bin/env bash

max=0
file="input.txt"

while read -r line; do
    # a=$(echo "$line" | cut -c 1-3) 
    # b=$(echo "$line" | cut -c 4-6)
    # echo $a $b
    IFS='-,'
    read -ra arr <<< "$line"

    #1st overlap 2nd
    if [[ (${arr[0]} -le ${arr[2]} && ${arr[1]} -ge ${arr[2]}) || (${arr[2]} -le ${arr[0]} && ${arr[3]} -ge ${arr[0]}) || ${arr[1]} -eq ${arr[2]} ]]; then
        max=$((max +1))
        echo "overlap" $line
    fi

done <$file 

echo $max