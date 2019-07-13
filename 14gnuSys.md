# 14 Yedekleme, Arşivleme ve Sıkıştırma

##### Yedekleme Nedir ?
- Gereğinde kullanılmak için fazladan bulundurulan, ayrılmış olan kişisel bilgilerin korunmasıdır. Bu bilgiler bizim en önemli yatırımımız. Bir verinin kaybolması bizim için büyük bir Risk'tir. Bu da bilginin değerini arttırmaktadır.

- Veri kayıplarının;
        %78'i Donanım/Sistem Arızası
        %11'i Kullanıcı Hatası
        %7'si Yazılım Arızası
        %3'ü  Virüsler.
        %1'i  Doğal Felaketler
        Bu durumlardan herhangi biri ile karşılaşma olasılığımız ise %19.

##### Yedekleme Kavramları
1. Tam Yedekleme: Dosyalar her yedekleme işlemi için tekrar ve tam olarak yedeğe eklenir. Geri yükleme için tam yedeği kullanmak yeterlidir.
2. Arttırımsal Yedekleme: Sadece son Tam Yedekleme işleminden sonra değişen dosyalar yedeklenir. Geri yükleme için Tam Yedek ve alınan Arttırımsal yedek yeterlidir.
3. Farksal Yedekleme: Alınan Tam Yedeğin üstüne sadece son Tam yada Farksal Yedekleme işleminden sonra değişen dosyalar yedeklenir. Geri yükleme için Tam Yedek ve alınan Tüm Farksal yedekler yeterlidir.

##### Yedekleme Stratejileri
- Amaç: Felaket durumunda minimum veri, zaman ve para kaybı.
- Öncelikler Neler ? Neler Yedeklenmeli ? Hangi Servisler Çalışıyor ? Neler Gereksiz ? Değişken Dosyalar ? Örneğin /proc dizini.
- Ne sıkılıkla yedek alınmalı ? Her saat başı, Günlük, Ayda bir
- Yedekler nasıl alınmalı ? Otomatik, Yarı-Otomatik, El ile
- Yedekler nereye alınmalı ? Sabit Disk, Cd, DVD, Teyp, git kağıda yaz.

Örnek Strateji
- Çalışan Servisler: Apache ve MySQL
> /boot -> Her Ay'ın İlk Günü Tam Yedek
> /etc -> Her Ay'ın İlk Günü Tam Yedek, Her çarşamba Arttırımsal yedek
> /home -> Her Pazar Tam Yedek, Her Gün Farksal yedek
> /var -> Her Çarşamba Tam Yedek, /var/www -> Her Gün Tam Yedek -> Saat başı SQL [mysqldump] olarak yedek.

- Etiketleme Seviyeleri

    Seviye 0: Aylık Yedekler
    Seviye 3: Haftalık yedekler
    Seviye 5: Günlük Yedekler

- Böylece günlük yedekler sadece haftanın başından beri olan değişiklikleri, haftalık yedekler başından beri olan değişiklikleri, haftalık yedekler ise ay başından beri olan değişiklikleri saklar.

### 1. Arşivleme (GNU Tar)                                                 (PFE101 Unite6)
### 2. Sıkıştırma Yöntemleri ve Farkları (gzip, xz, bzip2, zip, rar)       (PFE101 Unite6)
### 3. rsync (ssh üzerinden) ile dizin eşitlenmesi                         17gnuSys.md

### 4. Yedekleme yazılımlarının tantılması (Bacula, rdiff-backup, vs)

##### Bacula Nedir?
- Önce Bacula nedir ile başlayalım. Bacula network tabanlı, açık kaynaklı yedekleme yazılımıdır. (http://www.bacula.org) Çok geniş bir yelpazede farklı ortamlara yedek alabilir ve yedekten geri dönüş işlemi gerçekleştirilebilir. Kolay bir yönetim arayüzü olduğu gibi konsol üzerinden de komutlar aracılığı ile backup/restore prosedürü, aktif işler vs. yönetilebilir.

###### Bacula Nasıl Çalışır?
- Network tabanlı olması sebebiyle sunucu/istemci mimarisi üzerine kurulmuştur. Bacula sunucusu yedek alma prosedürünü ve yedek alınan ortamı yönetir. Bacula Server, üzerindeki veya başka bir sunucudaki veritabanı üzerine backup kayıtlarını katalog olarak kaydeder. Bu sayede de dosya/gün/saat bazında geri dönüşü kolaylaştırır. Veritabanı olarak MySQL, PostgreSQL veya SQLLite kullanılabilir. Sunucu tarafında Linux, FreeBSD, Solaris ve Open Solaris kullanılabilir. (Windows sunucu çalışması devam ediyormuş)

- İstemci kısmında sadece backup'ın aktarılacağı sunucuyla bağlantıyı sağlamak için küçük bir uygulama çalıştırılır. İstemci yazılımı daha geniş bir desteğe sahip. Linux'tan, Windows'a, Mac'a kadar hemen hemen tüm işletim sistemlerinin yedeğini bacula sayesinde alınabilir. Sunucu ve istemci tarafına uyumlu işletim sistemleri için daha ayrıntılı listeyi bu linkte inceleyebilirsiniz: http://www.bacula.org/en/dev-manual/main/main/Supported_Operating_Systems.html

###### Bacula'yı Anlayalım
- Bacula için çalışan temel 3 servis vardır. Bunlar;
1. Bacula Director Deamon (bacula-dir): Bacula sunucu üzerinde çalışan, yedekleme yapısını, zamanlamasını, nereye yedek alınacağı, hangi istemcilerden yedek alınacağı, istemcilerin kimlik denetlemeleri gibi aslında tüm backup sürecini yöneten servistir. 9101 portundan çalışır.
2. Bacula Storage Deamon (bacula-sd): Bacula'nın yedeklerin alınacağı ortamını düzenleyen servisidir. Bu servis sayesinde directory ile storage farklı sunuculardan hizmet verebilir. 9102 portunu kullanır.
3. Bacula File Deamon (bacula-fd): İstemci tarafında çalışan servisidir. Director, istemciye (linux, windows, mac veya diğerleri) bu servis ile ulaşır. 9103 portunu kullanır. (Olası firewall v.s. ayarlarında düzenlenmelidir.)

- Ayrıca 2 tane kavramdan bahsetmek gerek;
1. Bacula Catalog (Database): Yedekleme işleminin kayıt altına alındığı veritabanıdır. Katalogta, kayıt alınan dosyalar, dosyaların yetkileri vs. bilgileri, volume'lerin (doğru sözcüğü bulamadım malesef) kullanım oranları, çalışan işlemler gibi tüm bilgiler kaydedilir.
2. Bacula Console: Bacula Director ile bağlantıyı sağlayan uygulamadır. Konsol tabanlı veya QT tabanlı grafik arayüzü veya web tabanlı arayüzü vardır.

##### Rdiff-Backup Nedir?

Genel olarak bahsedecek olursak Rdiff-Backup bir dizinden başka bir dizine yedekleme yapmaktadır. Elbette arada fark varsa onları yedekliyor ve sadece yeni olan dosyaları yedeklenecek olan dizinin içine alıyor. İşin güzel tarafı ise hedefteki bir dizinde dosya kaybolmuşsa veya yanlışlıkla silinmiş ise; yedeklediğiniz dizinde silinen dosyayı veya dosyaları oldukça kolay bir şekilde tekrar oluşturabiliyorsunuz.

Bunların yanı sıra daha ilgi çeken bir diğer özelliği ise SSH’yi de kapsaması. Bu sayede ağ üzerinden yedekleme yapabilir ya da Restore (düzeltme) işlemini gerçekleştirebilirsiniz. Başka bir önemli nokta ise düzeltme işlemi yapılırken; sembolik bağlantılar, aygıt dosyaları ve bunlara ait bütün dosyaları aynen yedeklediğiniz gibi tekrar oluşturabilirsiniz.

http://www.banadersanlat.com/rdiff-backup-ile-linux-yedegi-alma/