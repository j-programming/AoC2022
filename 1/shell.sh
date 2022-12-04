#!/usr/bin/env bash

max=0
file="input.txt"
temp_max=0

while read -r line; do   
    if [[ -z "$line" ]]; then
        echo $temp_max >> out.txt
        temp_max=0
    else
        temp_max=$((temp_max + line))
    fi
    
done <$file 

sort -rn out.txt | head -n 3 > sorted.txt
rm out.txt

temp_max=0
while read -r line; do  
    temp_max=$((temp_max + line))
done < sorted.txt

rm sorted.txt

echo $temp_max