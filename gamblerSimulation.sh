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
	local win=0
	local lose=0
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
}
add()
{
	for (( i=2;i<=20;i++ ))
	do
		gamblerDict[$i]=$(( ${gamblerDict[$i]} + ${gamblerDict[$((i-1))]} ))
	done
        echo "Days: ${!gamblerDict[@]}"	
	echo "Amount: ${gamblerDict[@]}"
}
gamblerLuck()
{
	add
	local luckindex=1
	local uluckindex=1
	local luck=${gamblerDict[1]}
	local uluck=${gamblerDict[1]}
	for (( i=2;i<=20;i++ ))
	do
		if (( ${gamblerDict[$i]} > $luck ))
		then		
			luck=${gamblerDict[$i]}
			luckindex=$i
		elif (( ${gamblerDict[$i]} < $uluck ))
		then
			uluck=${gamblerDict[$i]}
			uluckindex=$i
		fi
	done
        echo "Luckiest Day: $luckindex"	
	echo "Unluckiest Day: $uluckindex"
}

echo "Welcome  to Gambler problem"
gambler
gamblerLuck
