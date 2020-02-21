#!/bin/bash -x

echo "*************************Gambler Simulation*************************"

# CONSTANT
WIN=1
CASH=100
MINIMUM=$(($CASH*50/100))
MAXIMUM=$(($CASH*150/100))
DAYS=20

# VARIABLE
sum=0

# FOR 20 DAYS
for (( days=1; days<=DAYS; days++ ))
do
	stake=$CASH
	
	# GAMBLER FOR 50% WIN/LOSS
	while (( $stake>$MINIMUM && $stake<$MAXIMUM ))
	do

		# TO GET RANDOM NUMBER
		random=$((RANDOM%2))
	
		# TO GET WIN/LOSS
		if [ $random -eq $WIN ]
		then
			((stake++))
			((winCount++))
		else
			((stake--))
			((lossCount++))
		fi
		amount=$(($stake-$CASH))
	done

		# STORING THE VALUES
		sum=$(($amount + $sum))
		store1[days]=$stake
		store2[days]=$winCount
		store3[days]=$lossCount
		store4[days]=$amount
		store5[days]=$sum
done
	echo "Daily Amount:      "${store4[@]}
	echo "Daily Stake key:   "${!store1[@]}
	echo "Daily Stake value: "${store1[@]}
	echo "Total:             "${store5[@]}
