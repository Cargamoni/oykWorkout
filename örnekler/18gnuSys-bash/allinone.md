#!/bin/bash

read x
let "x=$x+5"
echo $x

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
read q
case $q in 
	[qQ])
		echo "Güle Güle"
		exit 0
		;;
	[Cc][Ii][Kk])
		echo "Güle Güle"
		exit 0
		;;
	
	*)
		echo $q
		$0
		;;
esac

#!/bin/bash

kelimeler="mahmut ayşe hatice emel"

for isim in $kelimeler
do
	echo $isim
done

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


#!/bin/bash

echo $1

x=15
$0 x



#!/bin/bash

factorial()
{
    if [ $1 -le 1 ]
    then
        echo 1
    else
        last=$(factorial $[$1-1])
        echo $(($1 * last))
    fi
}
factorial $1

#!/bin/bash

function fAdi()
{
	echo "$1, Bir komut giriniz : "
}
fAdi $USER
read komut
$komut

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



#!/bin/bash

for i  in {a..zz}
do 
	echo $i
done

#!/bin/bash
x=258
let "x=x%8"
if [ $x == 5 ]
then
	echo "Bölümünden kalan 5"
elif [ $x == 2 ]
then
	echo "Bölümünden kalan 2"
else
	echo "Bölünmüyor"
fi

#Katar Karşılaştırma için operatörler
# Karakter Katarı = birden fazla karakterin bir araya gelmesiyle oluşan karakter bütünüdür.
# -n katar (katarın boyu 0 değil ise doğrudur)
# -z katar (katarın boyu 0 ise doğrudur)
# katar (katarın boyu 0 değil ise doğrudur)
# katar1 == katar2 (katarlar eşit ise doğrudur)
# katar1 != katar2 (katarlar birbirinden farklı ise doğrudur)
# katar1 < katar2 (katar1 katar2 'den küçük ise doğrudur)
# katar1 > katar2 (katar1 katar2 'den büyük ise doğrudur)

# sayi1 -eq sayi2 (sayilar eşit ise doğrudur)
# s1 -ne s2 (sayılar eşit değil ise doğrudur)
# s1 -gt s2 (s1 s2'den büyük ise doğrudur)
# s1 -lt s2 (s1 s2'den küçük is doğrudur)
# s1 -ge s2 (s1 s2'den büyük veya eşit ise doğrudur)
# s1 -le s2 (s1 s2'den küçük veya eşit ise doğrudur)

# ifade1 -a ifade2 (ifade1 ve ifade2 ise doğrudur)
# ifade1 -o ifade2 (ifade1 veya ifade2 ise doğrudur)
# !ifade1 (ifade1 değil ise doğrudur)
