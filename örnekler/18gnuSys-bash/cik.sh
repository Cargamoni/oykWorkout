#!/bin/bash

read x
if [ $x == "q" ]
then
	exit 0
elif [ $x == "cik" ]
then
	exit 0
else
	echo $x
	$0
fi
