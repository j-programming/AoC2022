#!/usr/bin/env bash

max=0
file="input.txt"

while read -r line; do
    found=0
    length=${#line}
    half_length=$((length/2))
    a=${line:0:$half_length}
    b=${line:$half_length:$length}
     
    #echo "$a $b"

    for ((i = 0 ; i < half_length ; i++)); do
        for ((j = 0 ; j < half_length ; j++)); do
            if [[ ${line:i:1} == "${line:$((half_length+j)):1}" ]]; then
                found=1
                #echo ${line:i:1} == ${line:$((half_length+j)):1}
                letter=${line:i:1}
            fi
            if [[ $found -eq 1 ]]; then
                break
            fi
        done
        if [[ $found -eq 1 ]]; then
            break
        fi
    done

    # Lowercase item types a through z have priorities 1 through 26.
    # Uppercase item types A through Z have priorities 27 through 52.
    ascii=$(printf '%d\n' "'$letter")
    if [[ $ascii -ge 97 ]]; then
        max=$((max + ascii-96))
    else
        max=$((max + ascii-38))
    fi

done <$file 

echo $max