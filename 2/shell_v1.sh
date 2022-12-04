#!/usr/bin/env bash

points=0
file="input.txt"

# A for Rock, B for Paper, and C for Scissors
# X for Rock, Y for Paper, and Z for Scissors


# 1 for Rock, 2 for Paper, and 3 for Scissors
# 0 if you lost, 3 if the round was a draw, and 6 if you won).

while read -r line; do   
    a=$(echo "$line" | cut -c 1-1) 
    b=$(echo "$line" | cut -c 3-3)
    
    case "$b" in
        "X")
            points=$((points +1))
            case "$a" in
                "A")
                    points=$((points +3))
                ;;
                "C")
                    points=$((points +6))
                ;;
            esac
        ;;
        "Y")
            points=$((points +2))
            case "$a" in
                "A")
                    points=$((points +6))
                ;;
                "B")
                    points=$((points +3))
                ;;
            esac
        ;;
        "Z")
            points=$((points +3))
            case "$a" in
                "B")
                    points=$((points +6))
                ;;
                "C")
                    points=$((points +3))
                ;;
            esac
        ;;
    esac
    
done <$file 

echo $points