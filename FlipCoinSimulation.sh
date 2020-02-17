#!/bin/bash -x

#DISPLAYING WELCOME MESSAGE
echo "Welcome To Flip Coin Simulation"

#DECLEARING DICTIONARY
declare -A flipResult

#VARIABLES
flipTimes=0;
side=0;
index=0;
numberOfCoins=0;

#TAKING USER INPUT OF NUMBER OF TIMES
read -p "Enter The Number Of Times You Want To Flip A Coin " flipTimes
read -p "Enter The Number of Coins You Want To Flip " numberOfCoins

#GENERATING VALUE AND STORING IN DICTIONARY
function flipCoin() {
	if [[ $flipTimes -gt 0 && $numberOfCoins -gt 0 ]]
	then
		for (( i=1; i<=flipTimes; i++ ))
		do
			side=""
			for (( index=1; index<=$numberOfCoins; index++ ))
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
flipCoin

#USING LOOP TO CALCULATE PERCENTAGE
for i in ${!flipResult[@]}
do
	flipResult[$i]=`echo  "scale=2; ${flipResult[$i]}*100/$flipTimes" | bc`
done

#SORTING THE DICTIONARY AND SHOWING WINNING COMBINATION
echo " Winning Combination Is : "
for i in ${!flipResult[@]}
do
	echo "$i ${flipResult[$i]}"
done | sort -k2 -rn | head -1
