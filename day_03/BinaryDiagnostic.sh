#!/usr/bin/env bash

#reading data from the user
# read -p 'Enter a : ' a
# read -p 'Enter b : ' b
#   
# bitwiseAND=$(( a&b ))
# echo Bitwise AND of a and b is $bitwiseAND
#   
# bitwiseOR=$(( a|b ))
# echo Bitwise OR of a and b is $bitwiseOR
#   
# bitwiseXOR=$(( a^b ))
# echo Bitwise XOR of a and b is $bitwiseXOR
#   
# bitiwiseComplement=$(( ~a ))
# echo Bitwise Compliment of a is $bitiwiseComplement
#   
# leftshift=$(( a<<1 ))
# echo Left Shift of a is $leftshift
#   
# rightshift=$(( b>>1 ))
# echo Right Shift of b is $rightshift

part_one () {
	i=0;
	gamma=0;
	epsilon=0;
	while [ $i -lt 12 ];
	do
		count_0=0;
		count_1=0;
		while read line;
		do 
			if [ ${line:$i:1} = "0" ];
			then
				((count_0++));
			else
				((count_1++));
			fi
		done < $1
		if [ $count_0 -lt $count_1 ];
		then
			((gamma++));
		fi
		if [ $count_1 -lt $count_0 ];
		then
			((epsilon++));
		fi
		if [ $i -lt 11 ];
		then
			gamma=$((gamma<<1));
			epsilon=$((epsilon<<1));
		fi
		((i++));
	done
	printf "Gamma: %i\n" $gamma
	printf "Epsilon: %i\n" $epsilon
	printf "Result: %i\n" $(($gamma * $epsilon))
}

put_in_array () {
	local -n arr=$1
	while read line; do 
		arr+=("$line");
	done < $2
}

get_oxygen () {
	local -n to_remove_=$1;
	count_0=0;
	count_1=0;
	for value in $2; do
		printf "debug %s" ${value:$3:1}
		if [ '${value:$3:1}' = '0' ]; then
			((count_0++));
		else
			((count_1++));
		fi
	done
	printf "%i %i\n" $count_0 $count_1
	if [ $count_0 -lt $count_1 ]; then
		to_remove_="0";
	else
		to_remove_="1";
	fi 
}

part_two () {
	i=0;
	oxygen=0;
	co2=0;
	local array;
	local to_remove;
	put_in_array array $1;
	while [ $i -lt 12 ]; do
		j=0;
		get_oxygen to_remove $array $i;
		printf "%s\n" $to_remove
		for value in array; do 
			if [ '${value:$i:1}' = $to_remove ]; then
				unset 'array[$j]';
			fi
			((j++));
		done
		if [ ${#array[@]} -eq 1 ]; then
			break ;
		fi
		((i++));
	done
	printf "%i %s\n" ${#array[@]} $array;
}
#	printf "%i %s\n" ${#array[@]} $array;
#	while [ $i -lt 12 ];
#	do

	
#		((i++));
#	done

read -p "Insert file name : " filename
read -p "part_1 or part_2 : " part

if [ $part = 'part_1' ];
then
	part_one $filename;
elif [ $part = 'part_2' ];
then
	part_two $filename;
else
	echo "Expecting either Part_1 or Part_2";
fi

#while read character
#do 
#echo $character
#done < $1

# 100110110100

# 011001001011
# 110010010110