#!/bin/bash -x

#DISPLAYING WELCOME MESSAGE
echo "Welcome To Flip Coin Simulation"

#DECLEARING DICTIONARY
declare -A flipResult

#VARIABLES
result=0;
flipTimes=0;
countHead=0;
countTail=0;
percentageHead=0;
percentagetail=0;

#TAKING USER INPUT OF NUMBER OF TIMES
read -p "Enter The Number Of Times You Want To Flip A Coin" flipTimes

#GENERATING VALUE AND STORING IN DICTIONARY
for(( index=1; index<=flipTimes; index++ ))
do
	result=$(( RANDOM%2 ))
	if [ $result -eq 0 ]
	then
		flipResult[head]=$((++countHead))
	else
		flipResult[tail]=$((++countTail))
	fi
done

#CALCULATING PERCENTAGE OF HEAD AND TAIL
percentageHead=`echo "scale=2; ${flipResult[head]}/$flipTimes*100" | bc`
percentageTail=`echo "scale=2; ${flipResult[tail]}/$flipTimes*100" | bc`
