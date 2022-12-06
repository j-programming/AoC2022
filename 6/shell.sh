#!/usr/bin/env bash

file="input.txt"

#1 First occurrence of 4 unique characters
while read -r line; do
  
  for ((i = 3 ; i < ${#line} ; i++)); do
    if ! echo "${line:$((i-3)):4}" | grep -q '\(.\).*\1' ; then
      echo ${line:$((i-3)):4} >> result1.txt
      echo $((i+1)) >> result1.txt
    fi
  done
done <$file 

#2 First occurrence of 14 unique characters
while read -r line; do
  
  for ((i = 13 ; i < ${#line} ; i++)); do
    if ! echo "${line:$((i-13)):14}" | grep -q '\(.\).*\1' ; then
      echo ${line:$((i-13)):14} >> result2.txt
      echo $((i+1)) >> result2.txt
    fi
  done
done <$file 