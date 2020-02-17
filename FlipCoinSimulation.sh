#!/bin/bash -x

#DISPLAYING WELCOME MESSAGE
echo "Welcome To Flip Coin Simulation"

#DECLEARING DICTIONARY
declare -A flipResult

#CONSTANT
numberOfCoins=2;

#VARIABLES
flipTimes=0;
side=0;
index=0;

#TAKING USER INPUT OF NUMBER OF TIMES
read -p "Enter The Number Of Times You Want To Flip A Coin " flipTimes

#GENERATING VALUE AND STORING IN DICTIONARY
function flip() {
	if [[ $flipTimes -gt 0 ]]
	then
		for (( i=1; i<=flipTimes; i++ ))
		do
			side=""
			for(( index=1; index<=$numberOfCoins; index++ ))
			do
				if [ $((RANDOM%2)) -eq 0 ]
				then
					side+=H
				else
					side+=T
				fi
			done
			flipResult[$side]=$((${flipResult[$side]}+1))
		done
	else
		echo "Enter Value Greater Than Zero"
	fi
}

#CALLING FUNCTION
flip $(( $flipTimes ))

#USING LOOP TO CALCULATE PERCENTAGE
for key in ${!flipResult[@]}
do
	flipResult[$key]=`echo  "scale=2; ${flipResult[$key]}*100/$flipTimes" | bc`
done

#DISPLAYING VALUES AND KEYS
echo ${flipResult[@]}
echo ${!flipResult[@]}
