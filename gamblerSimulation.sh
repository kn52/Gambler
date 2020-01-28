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
				echo "$cash"
			else
				cash=$(( $cash - $BETS ))
				echo "$cash"
			fi
		done
		if (( $cash > 100 ))
		then
 			win=$(( $win + 50))
		else
			lose=$(( $lose + 50))
		fi
	done
	echo -e "Total winning cash: $win \nTotal losing cash: $lose"
		
}
echo "Welcome  to Gambler problem"
gambler
