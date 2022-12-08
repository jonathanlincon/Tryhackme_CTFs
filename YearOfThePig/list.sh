#!/bin/bash

initial_file='words.txt'
n=1
for i in {10..99};do
	while read line;do
		echo $line$i
		n=$((n+1))
	done < $initial_file
done