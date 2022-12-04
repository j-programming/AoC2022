#!/usr/bin/env bash

max=0
file="input.txt"

while read -r first_line; read -r second_line; read -r third_line; do

    #either iterate each character in 3-deep for loop or check which char is present in all 3 lines
    #65-122
    for ((i = 65 ; i <= 122 ; i++)); do
        char=$(printf "\x$(printf %x $i)")
        if [[ "$first_line" == *"$char"* && "$second_line" == *"$char"*  && "$third_line" == *"$char"*  ]]; then
            letter=$char
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