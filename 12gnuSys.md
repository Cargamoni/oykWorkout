# 12 DNS (Domain Name System) Teknolojisine Giriş
### 1. DNS sisteminin çalışması

- Bilgisayarlar birbirleri ile iletişime geçebilmek için, birbirlerinin sahip oldukları IP adreslerine ihtiyaç duyarlar. Bir kullanıcının kendi bilgisayarı ile başka bilgisayarlarla iletişime geçebilmesi için, iletişime geçeceği makinaların IP adreslerini bilmesi gerekecektir. İletişime geçilecek tüm bilgisayarların nümerik olan IP adresi değerlerini akılda tutması zor olduğundan dolayı, alan adı sistemi olarak adlandırılan DNS (Domain Name System-Alan Adı Sistemi) protokolü ortaya çıkmıştır. Bu protokol sayesinde DNS sunucuları aralarında haberleşebilirler ve varsayılan olarak 53 numaralı port DNS protokolü tarafından kullanılır

- DNS, kullanıcıların web sitesi alan adına istek göndermesi ile çalışmaya başlar. Web sitelerine ulaşmak için kullanılan alan adları ve bu alan adlarının temsil ettiği IP adresleri DNS Server adı verilen sunucularda tutulmaktadır. Tarayıcı ile DNS sunucusuna bağlanılır ve alan adının temsil ettiği IP adresi bulunarak bu adrese istek gönderilir. Peki DNS sunucuları tarafından IP adresine nasıl ulaşılır?

##### 1.1 Ağaç yapısı (tr -> org -> linux -> kamp)

- DNS sisteminde, root nokta (.) ile gösterilir. Veritabanı üzerindeki her bir alt nokta “domain”; bu domainden kollara ayrılan her bir parça ise “subdomain” olarak adlandırılır.
Bir alan adı en alttan root’a gelecek şekilde gösterilir. Resim 1 incelendiğinde kök sunucudan itibaren başlayarak, hiyerarşik yapı sırasıyla aşağı doğru .com, piyadistramin ve alt olacak şekilde sıralanmıştır. Bu düğümlerin her biri DNS sunucusunda birer dizindir. Bu dosyaların adları en alttan en üste ilerlenecek şekilde birleştirilerek okunur. Resim 1’ de gösterilen yapıya göre, yukarıdan aşağı, sırasıyla .com, piyadistramin ve alt olarak sıralanmış bu dizinler alt.piyadistramin.com olarak okunur ve bu isme FQDN (Fully Qualified Domain Name- Tam Nitelikli Alan Adı)denir.

    1. Yazısal adresi, sayısal adrese dönüştürür
    2. Sayısal adres için, yazısal adrese çevirir (Reverse DNS)
    3. Dns Exchanger Announce

![DNS](resimler/12gnuSys-dns.jpg)

- DNS sistemi ile bütünleşik çalışan bir sistem mevcuttur alan adları whois veri tabanı. abc.com alan adını satın alalım. Yazman servisi diyor ki, abc.com u internette bulundurabilmen için bunu aktif bir DNS sunucusunda bulundurmanız gerekir. Bu yüzden bir Hosting firmasından, alan adınızı barındırması için yer talep etmeniz gerekir. Para Ltd. ye gidip benim bir domainim var bunu barındırın lütfen diyorsunuz ve bizde barındırma hizmeti veriyoruz. Hosting firmasının yetkilisi, barındırma sunuculularımın adresi ns1.hede.net ve ns2.hede.net ana dns sunucu hizmetlerini gidip yazman servislerine kaydet, yani domain aldığınız yere bildir. Godaddy vs vs gidip, dns yönlendirmelerini yapyıyorum.

- Resolver mekanizması çalışır. Recursive sorgulama yapar. Her DNS'in bir cache'i var. Belli bir zaman hafızasında tutuyor. Kök sunucular (Root DNS Server) ip adresi öğreniliyor. O zamana kadar gezilen tüm sunucularda abc.com'un ip adresi her birinin cache belleğine yazılıyor.

- Bilgisayar (abc.vom) - ISP - Root Server - TLD (Top Level Domain Server) .com - Authorative Name Server -> abc.com = 22.11.33.44

- DNS Hiyerarşisi

       	- DNS Hiyerarşisi aşağıdaki katmanlardan oluşur.
        1) Root Level
        2) Top Level Domains
        3) Second Level Domains
        4) Sub-Domain
        5) Host

###### DNS Root Level

1) Kurumsal hiyerarşi :  com, .net, .org.
2) Coğrafi Hiyerarşi : .tr .de .uk, .fr, .pe.

Root DNS sunucuları 12 farklı kurum tarafından yönetilir.
1) Verisign
2) University of Southern California
3) Cogent
4) University of Maryland
5) NASA AMES Research Center
6) Internet Systems Consortium
7) US Department of Defense
8) US Army Research Lab
9) Netnod
10) RIPE
11) ICANN
12) WIDE

Kurumsal Hiyerarşi

    Domain        Tanımı
    com         : Ticari kurum
    edu         : Eğitim kurumları
    gov         : Devlet kurumları
    mil         : Ordu grupları
    net         : Geniş ağ destek merkezleri
    org         : Kar amacı gütmeyen kuruluşlar
    int         : International organizasyonlar

https://www.youtube.com/watch?v=2ZUxoi7YNgs
https://www.youtube.com/watch?v=mpQZVYPuDGU

https://medium.com/@ramin_karimhani/dns-domain-name-system-nedi%CC%87r-ve-nasil-%C3%A7ali%C5%9Fir-465513138670

##### 1.2 Alan adı çözümleme (nsswitch, /etc/hosts, /etc/resolv.conf)

- DNS protokolünün en çok kullanıldığı işlem alan adı çözümlemesidir. Yazının devamında da bahsedeceğim işlemler de dahil olmak üzere DNS en çok, alan adı bilinen bir alanın IP adresini bulmak amacıyla kullanılır. Peki bu işlem nasıl gerçekleştirilir?

![DNS](resimler/12gnuSys-dns3.png)

1. Kullanıcı, istemci bilgisayarından alan adına bir istek gönderir. Eğer istemci, daha önce alan adına istek göndermişse, bu alan adı ve alan adına ait IP adresi istemci bilgisayarda bulunan DNS ön belleğine kayıt olmuştur. IP çözümeleme işlemi için öncelikle DNS ön belleğine bakılır. Eğer ön bellekte kayıt varsa ve DNS sunucusu tarafından belirlenen TTL(time-to-live) süresi dolmamışsa, IP adresi alınır ve istek o IP adresine gönderilir. Bunun için dig komutunu kullanacağız. Ama şimdi değil.

2. Eğer ön bellekte alan adına ait IP adresi bulunamazsa ya da IP adresi bulunur ama TTL süresi dolmuşsa, istemci /etc/hosts konumunda bulunan hosts dosyasına bakar veya systemd tarafından yönetilen reseolver'ın dosyaları incelenir /etc/resolv.conf dosyasına bakar, alan adına ait IP adresi bu dosyada var ise, o IP adresine istek gönderilir.

3. Eğer istemci bilgisayar, hosts dosyasında da istediği bilgiyi bulamazsa isteği DNS sunucusuna yönlendirilir.

4. DNS sunucusu isteği, kendisinde IP adresi kayıtlı olan (Forward address) root sunucusuna yönlendirir (Bu DNS sunucuları ISP(Internet Service Provider-Internet Servis Sağlayıcı) olarak adlandırılan kuruluşlarda bulunmaktadır).

5. Root sunucusu gelen bu isteği TLD sunucularına yönlendirir.

6. TLD sunucuları isteği, uygun olan SLD sunucularına yönlendirir. (Doğru sunucu bulunana kadar sunucular aralarında haberleşir.) .

8. Doğru host bilgisayar bulunduktan sonra IP adresi bilgisi DNS sunucusu aracılığı ile istemciye döndürülür.

- Ters DNS Çözümlemesi, DNS çözümlemesinin tersi işlemi olan, IP adresinden alan adı bulma işlemini gerçekleştirir. Peki bu işlem nasıl gerçekleştirilir? Mantığı alan adı çözümlemeye benzer ama dikkat edilmesi gereken durumlar vardır.

- IP adresleri alan adları gibi birbirine bağımlı değildir. Örneğin; ahmetcanirdem.com alan adı, piyadistramin.com alan adının bir alt alanıdır ve birbirine bağımlıdır. Ama 10.10.10.10 IP adresi ile 10.10.10.11 IP adresi ile birbirine alan adı açısından bağımlı değildir. Yani 10.10.10.10 IP adresi a.com adlı adresi temsil ederken, 10.10.10.11 IP adresi çok daha farklı olan b.com adlı adresi temsil edebilir. Durum böyle olunca, mantıken bir alan adının IP adresinin bulunması tüm IP adreslerinin incelenmesini gerektirir ve bu ömre bedel bir işlemdir. Fakat bu sorun ARPA tarafından, alan adlarında olduğu gibi IP adreslerinin de hiyerarşik bir yapı alması ile çözülmüştür.

![DNS](resimler/12gnuSys-dns4.png)

- .arpa adlı bir alan eklenmiştir. Bu alanın alt alanı olarak da in-addr eklenmiştir. IP adresleri bulunacağı zaman tıpkı alan adlarının bulunduğu gibi arpa adından başlayarak aşağı doğru ilerler. Bu yapıya göre IP adreslerine ulaşılıp alan adların bulunması işlemi kolaylaştırılmıştır. Dikkat edilmesi gereken başka bir durum ise IP adreslerinin hiyerarşiye göre .in-addr.arpa adıyla FQDN gibi isimlendirilmesi işlemidir. Resimde görülen IP 190.15.20.120 iken, hiyerarşiye göre 120.20.15.190.in-addr.arpa olarak adlandırılır.

- Ne olursa olsun, NSS kodu kullanıcının isteklerini yerine getirmelidir. /etc/nsswitch.conf dosyası bu sebeple vardır. Bu dosyada her veritabanı için arama sürecinin nasıl çalışacağı ile ilgili bir belirtim vardır. Dosyanın içeriği şöyle birşeydir:

        # /etc/nsswitch.conf
        #
        # Name Service Switch configuration file.
        #

        passwd:     db files nis
        shadow:     files
        group:      db files nis

        hosts:      files nisplus nis dns
        networks:   nisplus [NOTFOUND=return] files

        ethers:     nisplus [NOTFOUND=return] db files
        protocols:  nisplus [NOTFOUND=return] db files
        rpc:        nisplus [NOTFOUND=return] db files
        services:   nisplus [NOTFOUND=return] db files

- İlk sütunda veritabanının ismi bulunur. Satırın kalanında arama sürecinin nasıl çalışacağı belirtilir. Belirttiğiniz yolun her veritabanı için ayrı olduğunu unutmayın. Bu, eski yöntemle, bir tekparça gerçekleme ile yapılamaz.
Her veritabanı için yapılandırma belirtimi iki farklı öğe içerebilir:

        files, db veya nis gibi bir hizmet belirtimi.
        [NOTFOUND=return] gibi arama sonucuna verilen tepki. 

### 2. dig, nslookup, host

##### Dig
- Dig(domain information groper)Linux sistemlerde DNS kayıtlarına bakmak için kullanılır. DNS adreslerine bakmak istediğiniz siteyi dig komutu ile aratma yapmanız mümkün ve sitede kullanılan tüm DNS kayıtları karşınıza çıkacaktır.Kullanım kolaylığından dolayı dig komutunu çoğu kişi kullanmaktadır.

dig <siteadi> olarak kullanıldığında size domaine bağlı olan A Kaydını göstermektedir.

`dig para.com.tr`

dig <siteadi> -t NS olarak kullanıldığı zaman NS kayıtlarını listelemektedir.

`dig para.com.tr -t NS`

dig <siteadi> -t MX olarak kullanıldığı zaman MX kayıtlarını listelemektedir.

`dig para.com.tr -t MX`

dig <siteadi> -t txt olarak kullanıldığı zaman TXT kayıtlarını listelemektedir.

`dig para.com.tr -t TXT`

dig -x <ipadresi> +short olarak kullanıldığı zaman eskiden kullanılan kayıtları listelemektedir. Bir nevi kazı işlemi yapar. Reverse DNS

`dig -x 85.10.220.65 +short`

dig <dns adresi> <siteadi> -t <aratmak istediğiniz kayıt tipi> şeklindeki aramalarda /etc/resolv.conf da kayıtlı dns yi kullanmadan bilgi almanızı sağlar.

`dig 8.8.8.8 para.com.tr -t MX `

dig <siteadi>+nocomments +noquestion +noauthority +noadditional +nostats

    +nocomments bilgileri kapatır
    +noauthority yetki alanını kapatır
    +noadditional ek bölümleri kapatır
    +nostats istatistikleri kapatır.

Bunlarla uğraşmak istemiyorsanız size uzun geliyorsa

dig <siteadi> +noall +answer komutunu kullanarak +noall yani yukarıda yazılanların kapatılması işlemi cevap içinde + answer yazıyoruz.

`dig para.com.tr +noall +answer`

Belirtilen txt dosyasından dig komutu ile toplu dns kayıt sorgulama işlemlerinde aşağıdaki parametreleri kullanabilirsiniz.

`cat  kayitlar1.txt`

Oluşturulan txt kaydının sorgulanma işlemi, dig -f <dosya adi>  +noall +answer

`dig -f kayit1.txt -t MX +noall +answer`

Olarak kullanıldığında txt dosyasındaki MX kayıtlarını tek tek bakarak komut dizininde size listeleyecektir.

##### Nslookup
- NSlookup komutu, bir adresin TCP/IP numarasını bulmasını sağlar. Nslookup bilgisayara yüklü TCP/IP protokolü ile birlikte gelen bir araçtır. Domain adları ve ip adresleri ile ilgili çeşitli sorgular yapmanıza yardımcı olur. Windows’ta komut satırı üzerinden çalıştırılan bu araç bazı web sitelerinden online olarak da kullanılabilmektedir. Nslookup komutunu kullanarak bir web sitesi veya serverın çeşitli network durumlarını sorgulayabilirsiniz. Örneklerle inceleyecek olursak;

1. Aşağıdaki komut para.com.tr ‘in IP ‘sini sorgular;

`nslookup para.com.tr`

2. Aşağıdaki komut para.com.tr ‘in mail servisini sorgular;

`nslookup -query=mx para.com.tr`

3. Aşağıdaki komut para.com.tr ‘in nameserverlarını sorgular;

`nslookup -type=ns para.com.tr`

4. Aşağıdaki komut para.com.tr ‘in SOA kaydını sorgular;

`nslookup -type=soa para.com.tr`

5. Aşağıdaki komut para.com.tr ‘in yukarıdaki komutların teker teker yaptığı işi tek seferde yapar ve çoklu sorgulama yapar;

`nslookup -type=any google.com`

##### Host
- Linux network komutlarından biri olan host, basit ve önemli bir komut satırı aracıdır. Host komutu ile IP adresinden domain name(alan adı) ve domain name’den IP adresine ulaşabiliriz. 

Genelde aşağıdaki amaçlar için kullanılır:

1. Bir hostun IP adresini bulmak veya tersini yapmak.
2. DNS adı araması gerçekleştirmek.
3. NS(Name Server) ve MX(Mail Exchanger) adları gibi çeşitli DNS kaynak kayıtlarını listelemek ve doğrulamak.
4. ISS DNS sunucusunu ve internet bağlantısını doğrulamak.
5. Spam ve kara listeye alınan kayıtları doğrulamak.
6. DNS sunucusu sorunlarını doğrulamak ve sorun gidermek.

        Usage: host [-aCdilrTvVw] [-c class] [-N ndots] [-t type] [-W time]
                    [-R number] [-m flag] hostname [server]
            -a is equivalent to -v -t ANY
            -c specifies query class for non-IN data
            -C compares SOA records on authoritative nameservers
            -d is equivalent to -v
            -i IP6.INT reverse lookups
            -l lists all hosts in a domain, using AXFR
            -m set memory debugging flag (trace|record|usage)
            -N changes the number of dots allowed before root lookup is done
            -r disables recursive processing
            -R specifies number of retries for UDP packets
            -s a SERVFAIL response should stop query
            -t specifies the query type
            -T enables TCP/IP mode
            -v enables verbose output
            -V print version number and exit
            -w specifies to wait forever for a reply
            -W specifies how long to wait for a reply
            -4 use IPv4 query transport only
            -6 use IPv6 query transport only

-a – -v -t ANY değerine eşdeğerdir
-c – IN (İnternet) olmayan veriler için sorgu sınıfı belirtir
-C – Yetkili ad sunucularındaki SOA kayıtlarını karşılaştırır.
-d – –v ile eşdeğerdir
-l AXFR’yi(zone transfer) kullanarak bir alandaki tüm ana makineleri(host) listeler
-i IP6.INT geriye doğru arama
-N kök araması yapılmadan önce izin verilen noktaların sayısını değiştirir. (Varsayılan değer, /etc/resolv.conf dosyasındaki ndots deyimini kullanarak tanımlanan değerdir veya ndots ifadesi yoksa 1 değeridir.)
-r özyinelemeli işlemeyi devre dışı bırakır
-R UDP paketleri için yeniden deneme sayısını belirtir. (Sayı, ana makinenin cevaplanmayan bir sorguyu kaç kez tekrarlayacağını belirtir. Varsayılan yeniden deneme sayısı 1’dir. Rakam negatif veya sıfırsa, yeniden deneme sayısı varsayılan olarak 1 olur.)
-s SERVFAIL yanıtı sorguyu durdurmalı
-t -t seçeneği sorgu türünü seçmek için kullanılır (CNAME, NS, SOA, SIG, KEY, AXFR vb) gibi herhangi bir tanınan sorgu türü olabilir. Hiçbir sorgu türü belirtilmediğinde, ana makine uygun bir sorgu türünü otomatik olarak seçer. Varsayılan olarak A kaydı arar.)
-T TCP / IP modunu etkinleştirir.(Varsayılan olarak, ana bilgisayar, sorgular yaparken UDP’yi kullanır. -T seçeneği, ad sunucusunu sorgularken bir TCP bağlantısı kullanmayı sağlar. )
-v ayrıntılı çıktı sağlar
-w bir yanıt için sonsuza dek beklemeyi belirtir.
-W cevap beklemek ne kadar süreceğini belirtir
-4 yalnızca IPv4 sorgu nakli kullan
-6 yalnızca IPv6 sorgu nakli kullan
-m bellek hata ayıklama bayrağını ayarla
-V sürüm numarasını yazdır ve çık

`host <domainname>`

`host <IP_adresi>`

`host -t query Hostname|IPAddress`

- `host -t` sorgu tipi ve Hostname veya IP adresini yazarak sorgu yapabiliriz. Ayrıca aşağıaki gibi `host -t` yazıp tab tab yaparak hangi sorgu türlerini görüntüleyebileceğimize bakabiliriz.

E-posta sunucusunun ana makine adlarını bize gösterir. 

`host -t MX <domainname>`

`host -n -t MX <domainname>`

- Buradaki 10, 20, 30 gibi değerler ile öncelikler ile ilk olarak hangi sunucuların deneneceğini gösterir . En düşük değer en yüksek önceliği alır. Örneğin google.com örneginde posta ilk olarak 10 değerini alan aspmx.l.google.com. sunucusuna iletilir. Eğer buraya ulaşmazsa 20 değerini alan alt1.aspmx.l.google.com. sunucusuna iletilir. Eğer aynı önceliği alan iki farklı sunucu varsa rastgele biri seçilir ve ona gönderilir.


NS kayıtları, alan adları için, geçerli sunucu isimlerini belirlemeyi sağlar.

`host -t NS <domainname>`

- Genel olarak kullanıcılar Hosting aldıkları firmaların NS adreslerini kullanırlar, yani alan adlarını o adreslere yönlendirirler. Örneğin google.com kendi ismiyle görünürken, acemipenguenler.com kullanılan hosting firması nedeniyle alastyr.com ismiyle görünmektedir.

`host [options] IPAddress | Hostname [DNS-Server-Name-Here]`

-Peki hangi zamanlarda NS sorgusu kullanırız?
    - Bir web sitesinin sahiplerine ulaşamıyorsak Name Server ile sorgulatıp hosting şirketine ulaşabiliriz Hosting şirketleri de sitenin bilgilerini paylaşmayabilirler ama onlar aracılığıyla iletişime geçebiliriz. Adli süreçlerde illegal olmayan sitelerin hosting şirketlerine ulaşmak için NS sorgulama kullanılır.
 

Öncelikle host komutunda S harfini yazıp tab tab yazarak Sle başlayan hangi tipte komutlar olabileceğini gördük ve burdan SOA komutunu aşağıdaki syntax biçiminde çalıştırıyoruz.

`host -t SOA <domainname>`

Bu işlemi `host -C <domainname>` komutuyla da gerçekleştirebiliriz.

Bu komutla domain TXT kayıtlarını görebiliriz. Tanımlayıcı metini gösterir. Bilgi sağlamak içindir. 255 karaktere kadar saklayabiliriz.

`host -t TXT <domainname>`

`host -a <domainname>` komutuyla domain kayıtları hakkında ayrıntılı bilgileri görüntüleyebiliriz. Buradaki -a’yı all kelimesinin kısaltması olarak düşünebiliriz.

- Burada görüldüğü üzere 4 tane kısım vardır. Bunlar google.com için Query:1, Answer:11, Authority:0, Additional:0 olarak gözükmektedir.

        Question Selection
        Answer Selection
        Authority Selection
        Aditional Selection

Bu komutla MX, NS, SOA, IPv4, Ipv6 vs gibi bütün bilgileri -a parametresini kullanarak görebilmekteyiz. -a komutuna benzeyen bir diğer option ise -d komutudur. Onunla da bu işlemleri gerçekleştirebiliriz.

Alias takma ad anlamına gelmektedir. Bir makinaya verilen isimler birden fazla ise bu isimleri belirtirken kullanılır. CNAME kaydı kullanmadaki esas amaç, tek bir host kaydını değiştirerek ona bağlı çalışan Alias kayıtlarını bir seferde güncelleyebilmektir.

`host -t CNAME ibm.com`

IPv4 görüntülensin ve kullanılsın istiyorsak bu komutu kullanabiliriz.

`host -4 <domainname>`

`host -4 www.debian.org`

IPv6 görüntülensin ve kullanılsın istiyorsak bu komutu kullanabiliriz. Fakat günümüzde henüz IPv6 teknolojisine tam olarak geçilmediği için hata ekranı görebilirsiniz.Bu, IPv6 etkin ad sunucularınızın çalışıp çalışmadığını test etmek için yararlıdır.

`host -6 <domainname>`

`host -6 www.debian.org`

### 3. DNS kayıtlarının incelenmesi (A, MX, CNAME, NS, AAAA)
##### NS
NS kaydı siteninizin nameserver adreslerinin belirtildiği kayıtlardır. tr.dnsflare.com ve eu.dnsflare.com nameserver adreslerini kullanan bir domainin DNS kayıtlarında, ana domain için NS türü kullanılarak her 2 adres tanımlanmalıdır. Bu kayıtlar siteniz için standart olarak tr.dnsflare.com ve eu.dnsflare.com olarak tanımlı gelmektedir. Bu kayıtları silmeniz halinde siteniz DNS kaynaklı performans sorunları yaşayabilir.

NS kayıtlarını yanlışlıkla silerseniz; DNS Türü olarak NS seçerek DNS Kaydı alanına ana domain adresini, NS türünde olmak üzere ilk DNS kaydı alanına tr.dnsflare.com, oluşturacağınız 2. DNS kaydına eu.dnsflare.com ve 3. DNS kaydına us.dnsflare.com yazarak gerekli kayıtları oluşturmuş olacaksınız. RFC standartlarına göre 2 farklı DNS sunucusu kullanılması yeterli olmakla birlikte SlmHosting olarak sizlere 3 farklı kıtada konumlanmış DNS sunucularla hizmet vermekteyiz.


##### A
A kaydı girdiğiniz kaydın hangi IP adresine yönlendirileceğini belirtir. Örneğin satis.domain.com için oluşturacağınız A kaydına 185.85.205.1 IP adresi girerseniz; satis.domain.com sitesine girmek isteyen bir ziyaretçi 185.85.205.1 IP adresinin kayıtlı olduğu sunucuya yönlendirilir.

A kaydı değeri yazılırken bir IP adresi yazılmak zorundadır.


##### AAAA
AAAA kaydı A kaydı ile aynı şekilde çalışır. Tek farkı AAAA kaydının IPv6 türündeki IP adresleri için kullanılmasıdır. IPv6 yeni bir IP adresi formatıdır ve gün geçtikçe kullanımı artmaktadır. 185.85.205.1 şeklindeki yaygın olarak kullanılan IP adresler IPv4 olarak bilinmektedir.

AAAA kaydı değeri yazılırken bir IPv6 adresi yazılmak zorundadır.

##### CNAME
CNAME kaydı A kaydına benzer şekilde çalışır. Farkı şudur: A kaydında istek IP adresine yönlendiriliyorken CNAME kayıtları bir domaine yönlendirilmek zorundadır. Örneğin satis.domain.com için oluşturacağınız CNAME kaydına domain.com domain adresi girerseniz; satis.domain.com sitesine girmek isteyen bir ziyaretçi domain.com adresinin A kaydı hangi IP adresine gidiyorsa satis.domain.com da aynı IP adresine yönlendirilir.

Domainin kendisi ve alt domain olan satis adresi aynı sunucudan ve aynı IP adresinden yayınlanıyorsa CNAME kaydı kullanılabilir.

CNAME kaydı değeri yazılırken bir domain veya alt domain adresi yazılmak zorundadır.

##### MX
MX kaydı İngilizce Mail Exchanger yani Posta Çözümleyici'nin kısaltılmış halidir. Sunucular kendi aralarında DNS aracılığıyla haberleşirken, admin@domain.com adresine gönderilen bir e-postanın hangi sunucuya teslim edileceğini MX kaydına bakarak tespit ederler. Gönderen sunucusu admin@domain.com'a gönderilen bir e-posta için domain.com'un MX kaydına bakar.

siparis@satis.domain.com gibi bir alt domaine mail gönderilirse satis.domain.com için bir MX kaydı bulunmalıdır.

Bir domainin hem kendisi, hem de alt domainleri için ayrı ayrı MX kayıtları girilebilir. domain.com ve satis.domain.com için ayrı ayrı MX kayıtlarının bulunması bir karışıklığa neden olmaz. Önemli olan her birinin MX kayıtlarının doğru düzenlenmiş olmasıdır.

MX kaydında IP adresi kullanılamaz. MX kaydı domain veya alt domain adresi olarak yazılmak zorundadır.

##### TXT
TXT kaydı genel bir kullanıma sahiptir. Genellikle makineler arası haberleşmede doğrulama amaçlı kullanılan bir kayıt türüdür. En yaygın kullanımına e-posta gönderimlerinde rastlanmaktadır. Bir posta sunucusu e-posta aldığında göndericinin SPF kaydını kontrol ederek e-postanın gönderildiği sunucu bu domain için e-posta göndermeye yetkili midir, yoksa değil midir diye kontrol edebilir. Eğer yetkili bir sunucu olarak görmezse gelen e-postayı spam kutusuna gönderir. Domaininiz için SPF kaydı oluşturmak istediğinizde TXT türünü seçmelisiniz. DNS değerine ise şuna benzer bir kayıt girebilirsiniz:

v=spf1 mx a ptr ip4:185.85.205.51 ~all

##### SRV
SRV kaydı Microsoft sistemleri tarafından kullanılan bir kayıt türüdür. LDAP, Kerberoros gibi servislerin sunulduğu sunucunun tespit edilmesinde bu kayıtlara ihtiyaç duyulmaktadır.

### 4. Birincil (master) ve ikincil (slave) DNS kavramı.
- Master yani Birincil DNS sunucu yetkili olduğu bölge ile ilgili bilgileri kendi üzerinde bulunan bölge dosyasından (zone file) alır. O bölgede bulunan bilgisayarlara DNS sunucu adresi olarak Birincil DNS sunucu dresi verilir. Böylece alan adı çözümlenmesi yapan istemci bilgisayarlar Birincil DNS sunucuya başvururlar, isme karşılık IP adresi bilgisini ondan alır.

- Eğer ağda birden fazla bilgisayar varsa bütün bilgisayarlar tek bir DNS sunuculara gitmesi sonucunda alan adı çözümleme performansı etkilenir. Slave yani ikincil DNS sunucunun bilgilerini bulunduğu DNS sunucusundan alması "bölge bilgisi aktarımı" (zone transfer) zone transfer olarak adlandırılır. İkincil DNS sunucu hem yük dağıtımı yapmamızı hem de bir arıza durumunda sistemin ayakta kalmasını (alan adı çözümlemesine devam etmenizi) sağlar.

#### 4.1 Yetkili (authorative)
- Bir alan hakkında bilgi bulunduran sunucudur. Mesela ktu.edu.tr alanının MX, NS, A (Bunlar, Resource Record, Özkaynak Kaydı olarak bilinir) kayıtlarının tutulduğu isim sunucusudur. 

- Bir sorgu nasıl yapılır. Mesela http://www.ktu.edu.tr/ adresinin IPv4 karşılığı nedir? Bunun için çözümleyici ya da sizin bilgisayarınız Internet'te birkaç yetkili isim sunucusunu gezmek zorundadır. İlk başta " . " sunucularından  tr TLD'si için yetkili isim sunucu IP'si bulunur. Bunun IP'si (ki bu IP'nin makina ismi ülkemiz için ns1.metu.edu.tr ya da ns2.metu.edu.tr'dir) alındıktan sonra bu yetkili isim sunucuya "edu.tr." i barındıran yetkili isim sunucu IP'si sorulacak ve bu işlem böylece devam edecektir ve sonuç olarak 193.140.1.1 adresini sizin makinanız ya da /etc/resolv.conf dosyanızda bulunan çözümleyicinin ktu.edu.tr'nin yetkili isim sunucusundan aldığı bilgilere göre belleğinde belli bir müddet tutacaktır. Bu süreye TTL (time to live - yaşam süresi) denir. Bu süre boyunca çözümleyici gerekli bilgileri belleğinde saklayacaktır. DjbDNS için aksi belirtilmezse bu süre 42 dakikadır. Kurulacak göre bu süre 5 saniye de yapılabilir.


#### 4.2 Özyinelemeli (recursive) sorgu
- DNS sunucuları, alan adları ve IP adreslerine ulaşmak için DNS sunucularına sorguda bulunur. DNS sunucuları diğer DNS sunucularına iki çeşit sorgu yapar:

1. Özyinelemeli (recursive) Sorgu
    - DNS sunucularının aynı ağda bulunduğu yerel DNS sunucularına yaptığı sorgu tipidir. Bu sorgu türü yerel ağda bulunan DNS sunucularına özyinelemeli olarak gönderilir. Eğer sonuç bulunamazsa istemciye olumsuz dönüş yapılır.

2. Tekrarlamalı (iterative) SORGU
    - DNS sunucuların kendi aralarında yaptıkları sorgulara tekrarlamalı (iterative) sorgu denir. İstemcinin DNS sunucuya ulaşmak istediği IP adresini sorduğunda DNS sunucu bu IP adresini biliyorsa cevap verir. Eğer DNS sunucu istemcinin istediği isim çözümlemesini kendi veritabanından yerelde bulunan diğer DNS sunuculardan IP adresini ister. Bu işlemi istenilen IP adresini bulana kadar sürdürür. Eğer cevap bulamazsa isteği DNS sunucularına yönlendirir. Bu yönlendirme DNS sunucularında Forward olarak DNS sunucularının kayıt edilmesi ile yapılır.

### 5. SOA kaydı (TTL, Refresh, Retry, Expire, Minimum)
- Tüm bölgelerdeki ilk kayıttır. Bir DNS sunucusunun sahip olduğu zone’nun kaydını tutar. SOA kayıtları aşağıdaki parametrelerde tutulur.

    Serial Number:Seri numarası değerini tutar. Zone transferleri bu numaraya bakılarak yapılır.
    Refresh Interval:Secondary Zone DNS sunucusunda, zone bilgisinin yenilenmesi gereken süre belirtilir.
    Retry İnterval: Bir şekilde tamamlanamamış zone yenileme denemesinden sonra beklenen süredir.
    Expiration: Zone bilgisinin yenilemediği durumlarda, secondary zone’nun yetkilerinin sonlanması için gereken süredir.
    Minimum TTL: İkincil sunucunun zone dosyasını önbellekte tutma süresidir