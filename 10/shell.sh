#!/usr/bin/env bash

file="input.txt"

IFS=' '

cycle=0
x=1
sum=0
while read -ra line; do

  cycle=$((cycle+1))
  echo "cycle $cycle: x=$x op=${line[0]} arg=op=${line[1]}" 
  case $cycle in
    20)
      temp=$((x*cycle))
      sum=$((sum+temp))
    ;;
    60)
      temp=$((x*cycle))
      sum=$((sum+temp))
    ;;
    100)
      temp=$((x*cycle))
      sum=$((sum+temp))
    ;;
    140)
      temp=$((x*cycle))
      sum=$((sum+temp))
    ;;
    180)
      temp=$((x*cycle))
      sum=$((sum+temp))
    ;;
    220)
      temp=$((x*cycle))
      sum=$((sum+temp))
    ;;

  esac

  case ${line[0]} in
    "noop")
    ;;
    "addx")
      
      cycle=$((cycle+1))
        case $cycle in
        20)
          temp=$((x*cycle))
          sum=$((sum+temp))
        ;;
        60)
          temp=$((x*cycle))
          sum=$((sum+temp))
        ;;
        100)
          temp=$((x*cycle))
          sum=$((sum+temp))
        ;;
        140)
          temp=$((x*cycle))
          sum=$((sum+temp))
        ;;
        180)
          temp=$((x*cycle))
          sum=$((sum+temp))
        ;;
        220)
          temp=$((x*cycle))
          sum=$((sum+temp))
        ;;

      esac
      x=$(($x+${line[1]}))

    ;;

  esac


done <$file 

echo $cycle
echo $x
echo $sum