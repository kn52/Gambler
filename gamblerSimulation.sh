#!/bin/bash

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
	percentage
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
	echo "Resign Cash of the day: $cash"
		
}
echo "Welcome  to Gambler problem"
gambler
