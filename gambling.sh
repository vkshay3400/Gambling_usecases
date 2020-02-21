#!/bin/bash -x

echo "*************************Gambler Simulation*************************"

# VARIABLE
stake=100

# CONSTANT
MINIMUM=$(( $stake*50/100 ))
MAXIMUM=$(( $stake*150/100 ))

# TO GET RANDOM NUMBER
random=$((RANDOM%2))

# BET A GAMBLER TO GET WIN OR LOSS
if (( $random == 1 ))
then
	((stake++))
	((winCount++))
else
	((stake--))
	((lossCount++))
fi
