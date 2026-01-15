#!/bin/bash

set -euo pipefail

: "${SHOW_UP:?SHOW_UP is not set}"

# source .envrc # Use env variables instead

mkdir -p Player-Data
PARTY0_INPUT=Player-Data/Input-P0-0
PARTY1_INPUT=Player-Data/Input-P1-0

echo "" > $PARTY0_INPUT
echo "" > $PARTY1_INPUT

for (( i=1; i<=$SHOW_UP; i++ ))
do 
    B=$(($RANDOM % 2))
    echo "$B " >> $PARTY0_INPUT
    echo "$B " >> $PARTY0_INPUT
    echo "$((1 - $B)) " >> $PARTY1_INPUT
done
