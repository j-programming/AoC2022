#!/usr/bin/env bash

points=0
file="input.txt"

# A for Rock, B for Paper, and C for Scissors

#X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"

# 1 for Rock, 2 for Paper, and 3 for Scissors
# 0 if you lost, 3 if the round was a draw, and 6 if you won).

while read -r line; do   
    a=$(echo "$line" | cut -c 1-1) 
    b=$(echo "$line" | cut -c 3-3)
    
    case "$b" in
        "X") #loose
            case "$a" in
                "A")
                    #choose Scissors
                    points=$((points +3))
                ;;
                "B")
                    #choose Rock
                    points=$((points +1))
                ;;
                "C")
                    #choose Paper
                    points=$((points +2))
                ;;
            esac
        ;;
        "Y") #draw
            points=$((points +3))
            case "$a" in
                "A")
                    #choose Rock
                    points=$((points +1))
                ;;
                "B")
                    #choose Paper
                    points=$((points +2))
                ;;
                "C")
                    #choose Scissors
                    points=$((points +3))
                ;;
            esac
        ;;
        "Z") #win
            points=$((points +6))
            case "$a" in
                "A")
                    #choose Paper
                    points=$((points +2))
                ;;
                "B")
                    #choose Scissors
                    points=$((points +3))
                ;;
                "C")
                    #choose Rock
                    points=$((points +1))
                ;;
            esac
        ;;
    esac
    
done <$file 

echo $points