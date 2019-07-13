#!/bin/bash
x=$1
case $x in 
	[1])
		echo "x = 1"
	;;
	[2])
		echo "x = 2"
	;;
	*)
	echo "yanlış değer girdiniz"
	exit 0
	;;
esac
$0 `read x`
