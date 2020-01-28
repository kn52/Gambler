#!/bin/bash

readonly STAKE=100
readonly BETS=1

winLose()
{
	if [ $((RANDOM%2)) == 1 ]
	then
        	echo "Win"
	else
        	echo "Lose"
	fi

}

echo "Welcome  to Gambler problem"
winLose
