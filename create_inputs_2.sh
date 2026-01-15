#!/bin/bash

set -euo pipefail

: "${NUM_RECIPIENTS:?NUM_RECIPIENTS is not set}"

# source .envrc # Use env variables instead

mkdir -p Player-Data
PARTY0_INPUT=Player-Data/Input-P0-0
# PARTY1_INPUT=MP-SPDZ/Player-Data/Input-P1-0

echo "" > $PARTY0_INPUT
# echo "" > $PARTY1_INPUT

echo "Generating private boolean attribute"
for (( i=1; i<=$NUM_RECIPIENTS; i++ ))
do 
    B=$(($RANDOM % 2))
    echo "$B " >> $PARTY0_INPUT
    # echo "$((1 - $B)) " >> $PARTY1_INPUT
done

INFO_LEN=10
echo "Generating private information attribute of length $INFO_LEN"
for (( i=1; i<=$NUM_RECIPIENTS; i++ ))
do 
    for (( j=1; j<=$INFO_LEN; j++ ))
    do 
        N=$(($RANDOM % 10))
        echo "$N " >> $PARTY0_INPUT
        # echo "$((1 - $B)) " >> $PARTY1_INPUT
    done
done
