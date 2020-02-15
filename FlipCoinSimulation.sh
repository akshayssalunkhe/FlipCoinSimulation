#!/bin/bash -x

#DISPLAYING WELCOME MESSAGE
echo "Welcome To Flip Coin Simulation"

#VARIABLES
result=0;

#GENERATING VALUE USING RANDOM
result=$(( RANDOM%2 ))

#CHECKING CONDITION
if [ $result -eq 0 ]
then
	echo "It's a Head"
else
	echo "It's a Tail"
fi
