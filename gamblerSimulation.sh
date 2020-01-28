#!/bin/bash

declare -A gamblerDict
readonly STAKE=100
readonly BETS=1

percentage()
{
	percent=$(($STAKE * 50 / 100 ))
}

gambler()
{
	percentage
	for (( i=1;i<=20;i++ ))
 	do
		cash=$STAKE
		while (( $cash > $(($STAKE - $percent))  && $cash < $(($STAKE + $percent)) )) 
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
	local luck=${gamblerDict[1]}
	local luckIndex=$i
	for (( i=2;i<=20;i++ ))
	do
		if (( ${gamblerDict[$i]} > $luck ))
		then		
			luck=${gamblerDict[$i]}
			luckIndex=$i
		fi
	done
	echo "Luckiest Day: $luckIndex"	 
	for (( i=2;i<=20;i++ ))
	do
		if (( ${gamblerDict[$i]} < $luck ))
		then		
			luck=${gamblerDict[$i]}
			luckIndex=$i
		fi
	done  	
	echo "Unluckiest Day: $luckIndex"

}
gamblerChance()
{
	months=1
	while (( ${gamblerDict[20]} > 0))
	do	
		((months++))
		gambler
		gamblerLuck
	done
	echo "Gambler  Play for $((months+1)) months"
}

echo "Welcome  to Gambler problem"
gambler
gamblerLuck
gamblerChance

