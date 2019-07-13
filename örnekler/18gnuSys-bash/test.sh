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
