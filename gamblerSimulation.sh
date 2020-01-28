#!/bin/bash

declare -A gamblerDict
readonly STAKE=100
readonly BETS=1

percentage()
{
	percent=$(($STAKE * 50 / 100 ))
	min=$(($STAKE - $percent))
	max=$(($STAKE + $percent))
}

gambler()
{
	win=0
	lose=0
	percentage
	for (( i=1;i<=20;i++ ))
 	do
		cash=$STAKE
		while (( $cash > $min  && $cash < $max )) 
		do
			if [ $((RANDOM%2)) == 1 ]
			then
				cash=$(( $cash + $BETS))
			else
				cash=$(( $cash - $BETS ))
			fi
		done
		gamblerDict[$i]=$(($cash-$STAKE))
	done
	echo "Days: ${!gamblerDict[@]}"
	echo "Amount: ${gamblerDict[@]}"
		
}
echo "Welcome  to Gambler problem"
gambler
