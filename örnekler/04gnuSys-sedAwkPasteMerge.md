"Sed" bir çeşit veri düzenleme editörüdür. "Sed" ile uygulanan değişiklikler orjinal dosya üzerinde herhangi bir değişikliğe neden olmaz. Zira düzenlemelerin bir dosyaya yazılması komutu kullanılmadığı takdirde. Siz bir dosya içeriğini değiştirerek ekranda gösterdikten sonra çıkış yaptığınız zaman değişiklikler kaybolur.

"sed" kelime silme, değiştirme vb.. işlemleri uygulayarak bir çıktı üretir. Önceki konularda görmüş olduğumuz komutların daha kısa ve sade bir şekilde uygulanmasını sağlamaktadır. Daha fazla ayrıntı için "sed" man sayfasına bakabilirsiniz.("man sed" komutu ile.)

Bu dersimizde önceki dersimizde işlediğimiz "sed" komutuna benzer bir komut olan "awk" programlama dilini işleyeceğiz. "Awk" bir veri düzenleme editörüdür. "Awk" hakkında daha geniş bilgiye "man awk" komutu ile ulaşabilirsiniz.


ad;soyad;yas
Mahmut;Kamuran;44
Deliha;Jamorji;55
Kerimcan;Dursun;11
Mehmed;Sultan;66
Kamil;Zumzum;35

`awk -F';' '{ print $2 }' veri`

`cat veri | awk -F';' '{ print $2 }`

İster datayı direk olarak dosyadan okuyarak isterseniz de direk olarak borulama ile beraber içerisine aktararak işlemler gerçekleştirilebilir.

AWK sütunlar mantığı ile çalışır, en güzel örneği de burada gösterilmektedir.

`awk -F';' '{ print $2 "," $3 } veri`

Burada -F ayırma operatörü olarak çalışmaktadır cut için -d ne ise burada awk için de -F aynı görevi görmektedir. Siz burada ikinci ve üçüncü sütunlar üzeirnde işlem yapmaktasınız.

`cut -d ';' f2,3 veri`

Awk bir programlama dili olarak geçmektedir, ve metinler üzerinde işlem yapmanızı sağlamaktadır.

`awk -F';' 'BEGIN { sum = 0 } { sum += $3 } END { print sum }' veri`

Ayırıcı ile ayırdığıımz sütunlardan bahsetmiştik, ' içerisindeki BEGIN ile beraber değişken ataması yapılıp her bir $3 yani 3. sütundaki veri eklenerek bu değişken içerisine atılmaktadır. END ile beraber ise bu ekleme işleminin bittiği gösterilir. en sonunda da print sum ile beraber toplanan eri ekrana yazılır.

awk ile bir metin dosyasının bazı satırları satır numaralarına göre veya içeriklerine göre filtrelenebilir.

`awk ' NR > 1 ' data-with-title`

`awk ' NR > 1 && NR <= 3' data-with-title`

`awk -F';' '$3 > 50' veri`

sed'in en yoğun kullanımı bir kalıba (pattern) uyan metinleri değiştirmektir. Aşağıdaki örnekte csv dosyasında bulunan ; (noktalı virgül) karakterleri , (virgül) karakteri ile değiştirilmiştir.

`sed -i 's/;/,/g' veri`

-i opsiyonu ile beraber outputa basmadan dosya içerisinde değişikilik yapılabilmektedir. In place editing anlamındadır.

`sed '/^A.*/d' veri`

`sed '/^A.*/!d veri`

Yukarıda A ile başlayan satırlar kaldırılmaktadır. Aynı zamanda ikinci satırda a ile başlamayanlar kaldırılmaktadır.

`sed '1d' data-with-title`

`sed '1d;4,$d' data-with-title`


Translate karakter dönüşümü yaptığını söylemiştik

`tr a-Z A-Z < veri`

`tr ';' ',' < veri`

Cut'da awk'a benzer

`cut -d ';' -f1,2 data`

paste de satır birleştirmek için kullanılır.

`cat <(seq 1 3)`

`paste -d ';' <(seq 1 3) data`