#!/bin/bash

# Algoritma
# 1 Bir Değişken Tanımla
# 2 Ekrana Yazdır
# 3 Değişkeni 1 Arttır ve tekrara Yazdır
# 4 Değişken 1000 ise durdur değil ise 3'e dön
# 5 Bitir

x=1

echo "$x"
while [ $x -le 999 ]
do 
	((x++))
echo "$x"
done
