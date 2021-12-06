#!/usr/bin/env bash

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
	while read line; do 
		array+=("$line");
	done < $1
}

part_two () {
	input=$(cat $1);
	oxygen="";
	co2="";
	i=0;
	while [ $i -lt 12 ]; do
		count_total=$(grep "^${oxygen}" input | wc -l);
		if [ $count_total = 1 ]; then
			oxygen=$(grep "^${oxygen}" input);
			break ;
		fi
		count_1=$(grep "^"${oxygen}1"" input | wc -l);
		count_0=$(($count_total - $count_1));
		((i++));
 		if [ $count_1 -lt $count_0 ]; then
 			oxygen+="0";
 		else
 			oxygen+="1";
		fi
	done
	i=0;
	while [ $i -lt 12 ]; do
		count_total=$(grep "^${co2}" input | wc -l);
		if [ $count_total = 1 ]; then
			co2=$(grep "^${co2}" input);
			break ;
		fi
		count_1=$(grep "^"${co2}1"" input | wc -l);
		count_0=$(($count_total - $count_1));
		((i++));
 		if [ $count_1 -lt $count_0 ]; then
 			co2+="1";
 		else
 			co2+="0";
		fi
 	done
	printf "Oxygen Value : %i\n" "$((2#$oxygen))"
	printf "CO2 Value : %i\n" "$((2#$co2))"
	printf "Life support rating : %i\n" $((2#$oxygen * 2#$co2))
	# YES FINALLY FUCK YOU DAY 3 PART 2
}

read -p "Insert file name : " filename
read -p "part_1 or part_2 : " part

if [ $part = 'part_1' ]; then
	part_one $filename;
elif [ $part = 'part_2' ]; then
	part_two $filename;
else
	echo "Expecting either Part_1 or Part_2";
fi