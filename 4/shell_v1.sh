#!/usr/bin/env bash

max=0
file="input.txt"

while read -r line; do
    # a=$(echo "$line" | cut -c 1-3) 
    # b=$(echo "$line" | cut -c 4-6)
    # echo $a $b
    break=0
    IFS='-,'
    read -ra arr <<< "$line"

    #1st contains 2nd
    if [[ ${arr[0]} -le ${arr[2]} ]]; then
        if [[ ${arr[1]} -ge ${arr[3]} ]]; then
            max=$((max +1))
            break=1
            #echo "1st cont 2nd" $line
        fi
    fi

    #2nd contains 1st
    if [[ $break -ne 1 && ${arr[2]} -le ${arr[0]} ]]; then
        if [[ ${arr[3]} -ge ${arr[1]} ]]; then
            max=$((max +1))
            #echo "2nd cont 1st" $line
        fi
    fi

done <$file 

echo $max