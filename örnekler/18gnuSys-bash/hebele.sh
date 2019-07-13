#!/bin/bash
x=258
let "x=$x%8"
echo $x
if [ $x -eq 2 ]
then
	echo "8'e bölümünden kalan 2"
elif [ $x -eq 5 ]
then
	echo "8'e bölümünden kalan 5"
else
	echo "ne 2 ne 5"
fi

