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

# FUNCTION FOR GAMBLER
function getGambler(){
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

# TO FIND LUCKIEST
for k in ${!store5[@]}
do
	echo $k 'Day_is_Luckiest' ${store5[$k]}
done | sort -rn -k3 | head -1

# TO FIND UNLUCKIEST
for k in ${!store5[@]}
do
	echo $k 'Day_is_Unluckiest' ${store5[$k]}
done | sort -rn -k3 | tail -1

# TO CONTINUE IF WON
if(($sum>$CASH))
then
	echo "You Won and continue play"
	getGambler
else
	echo "You Lose"
fi
}

# CALLING FUNCTION
getGambler
