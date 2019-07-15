# 11 Temel TCP/IP Bilgisi ve Ağ Yönetimi

# 1. Ağ Nedir?

- Ağ, iki veya daha fazla bilgisayarın kablolu ya da kablosuz iletişim araçları üzerinden yazılım ve donanım bileşenleri ile birlikte bağlanarak meydana getirilen sistem olarak tanımlanabilir.  

### 2. Temel Ağ Bilgisi

##### Ağların Gelişimi ve Ağ Teknolojileri 

- Ana Makine (MainFrame) Modeli: Ağ kavramı ilk olarak Ana Makine (MainFrame) teknolojisi ile ortaya çıkmıştır. Ana makinenin kendi işlemcisi (CPU), sabit diski (harddisk), ve bunları kumanda etmek için bir ekranı ve klavyesi ve de terminallere bağlı seri portları vardı. Bu aptal terminaller (dumb terminal) sadece ekran ve klavyeden oluşurdu, yani bir deyişle pasif makinelerdi. Terminallerin yerel bir disk alanları da olmadığı için bilgiyi ana makine üzerinde saklarlardı. Tüm yük anamakinenin üzerindeydi ve bu yüzden çok pahalıydı. En büyük dezavantajı tabii ki güvenilir olmaması, yani ana makinede çıkacak bir sorunun tüm sistemi etkilemesi, terminallerin kendi başlarına işlem yapabilme kaabiliyetlerinin olmaması idi. Bu önemli sorunhalen çok popüler olan İstemci/Sunucu (Client/Server) modelinin doğmasına yol açtı.  

- İstemci / Sunucu (Client/ Server) Modeli: İstemci/Sunucu modeli ile pasif terminaller yerine kendi başlarına işlemler yapabilen ve kendi sabit disklerinde programlar saklayabilen makineler geldi. Böylece her istemci kendi başlarına belirli işlemleri yerine getirebilmekte, yetersiz durumda kaldıklarında ise o işe özelleşmiş olan sunuculara başvurmakta idiler. Örneğin her istemcide ofis uygulamaları, masa üstü yayıncılık, oyun programları kullanılması buna rağmen veri tabanı ya da web gibi uygulamalarda bir sunucuya erişilmesi gibi.  

- Eşlenik Ağ (Peer to Peer) Modeli: İstemci/Sunucu modelinin gelişmesi ve yaygınlaşması ile birlikte istemcilerin daha ön plana çıktığı, özelleşmişsunuculara ihtiyaç duyulmayan ağ örnekleri de ortaya çıkmaya başladı. Bu ağlarda makineler yaklaşık özelliklerde idi ve işleyiş olarak birbirlerine üstünlük sağlamıyorlardı.

##### Ağ Çalışma Prensipleri 

- Temel olarak ağlarda iki tip çalışma prensibi vardır:  

1. Yayın (Broadcast): Ağa atılan bir paketin her bilgisayara gönderilmesi. 

2. Noktadan noktaya (Point to Point): Ağa atılan bir paketin özel bir noktaya iletilmesi.  Ağların çalışma prensipi genelde yayın tarzındadır. Buna rağmen İnternet omurgası noktadan noktaya çalışmaktadır. 

##### Büyüklüklerine Göre Ağlar 

- LAN (Local Area Network) Yerel Alan Ağı: Kurulabilecek en küçük çaplı ağ olmakla birlikte büyüklükleri bir oda veya bir binayla sınırlı kalmayıp 1 km'ye kadar çıkabilmektedir. Örneğin küçük ve orta dereceli kurumların ağları.  

- WAN (Wide Area Network) Geniş Alan Ağı: Aralarında 1 km'den fazla mesafe olan LAN ların birleşmeleriyle meydana gelirler. Türkiye'deki en meşhur WAN'lardan biri Turnet (Türkiye iç omurgası), bir diğeri Ulaknet'tir (Üniversiteler arası ağ).  

- MAN (Metropolitan Area Network) Metropol Alan Ağı: WAN'ların şehir bazında ya da şehirler arası birleştirilmeleriyle oluşur, fakat günümüzde MAN kavramı kullanılmamakta, yerine WAN terimi tercih edilmektedir

#### 2.1. OSI Katmanları

Her teknojik üründe olduğu gibi ağlarda da standartları belirleyen bir kuruluş vardır. Bu kurum ISO (International Standards Organization) olarak bilinir ve ağ haberleşmesinde 7 katmandan oluşan OSI (Open System Interconnection) açık sistemler arası bağlantı kurallarını belirlemiştir. Bir ağ oluşturmak için fiziksel gereksinimlerin dışında, cihazların haberleşebilmeleri için ortak bir anlaşma biçimine yani bir takım protokollere ihtiyaç duyulur. Her protokolün çalıştığı katman yaptığı işe göre değişmektedir. Bu bahsedilen katmanlar şu şekilde sıralanmaktadır

![OSI](resimler/11gnuSys-osi.jpg)

    7 Uygulama / Application  
    6 Sunum / Presentation  
    5 Oturum / Session 
    4 Taşıma / Transport 
    3 Ağ / Network 
    2 Veri iletim / Data Link 
    1 Fiziksel / Physical  
 
 - Uygulama katmanı kullanıcıya en yakın olan ve programla iletişimini sağlayan katman, fiziksel katman ise en uzak olan ve kablodaki veri transferini içeren katmandır. Bir veri demeti, programın uygulama katmanından fiziksel katmana kadar çeşitli işlemlerden geçip (enkapsüle edilip), kablo üzerinden ağa ve oradan da diğer bilgisayarlara ulaşıp tam tersi işleme tabi tutularak, uygulama katmanına çıkarak diğer kullanıcılara iletilir. İnternette ve ağ uygulamalarında yaygın olarak kullanılan TCP/IP protokolünün uygulanmasında ise 6 ve 5 numaralı katmanlar uygulama katmanının içine dahil edilir ve sonuç olarak ortaya melez (hybrid) bir yapı ortaya çıkar.


     TCP / IP Modeli:  				Melez (Hybrid) Model (OSI & TCP/IP)
     7 Uygulama / Application  
						
									5 Uygulama / Application
     4 Taşıma / Transport			4 Taşıma / Transport  
     3 Ağ / Network 				3 Ağ / Network
     2 Veri iletim / Data Link 		2 Veri iletim / Data Link
     1 Fiziksel / Physical  		1 Fiziksel / Physical
 
- Ortaya çıkan bu melez model bundan sonraki anlatımların temelini oluşturacak ve her katman detaylarıyla ayrı başlıklar altında incelenecektir. 							

    

### 3. Ağ Protokolleri

- Verinin ağa bırakılması ile başlayıp, paketlenmesi, iletiliş yolunun belirlenmesi ve iletilmesi olaylarının tamamını denetleyen kuralar bütününe ağ protokolü denilmektedir. Veri, hedef bilgisayara iletildiğinde, o an o bilgisayarda olan veri ile yeni gönderilen verinin aynı olup olmaması durumunu da denetlemek ağ protokolünün görevleri arasındadır.

#### 3.2. TCP, UDP, ICMP, SMTP

- TCP, IP katmanının üzerinde çalışan ve kullanıcılarına (HTTP, SMTP, vb) paket kayıplarına karşı güvenli bir iletim ortamı sunan bağlantı temelli (connection oriented) yani iki partinin de bağlantıyı başlatıp birbirinin sağlığını gözlemlediği bir protokoldür.

- İki parti arasında TCP bağlantısı 3-Way Handshake adı verilen bir proses ile başlar. 3-Way Handshake ile kurulan TCP bağlantısının parametreleri belirlenir.

![TCP-IP](resimler/11gnuSys-tcpwireshark.jpg)


### 4. TCP/IP Protokolü

- İnternet ağ mimarisi, katmanlı bir yapıya sahiptir. Eğer uygulama katmanını saymaz isek temelde 4 katmanlı bir yapıya sahip olan TCP/IP Mimarisi günümüzün temel ağ protokolü halini almıştır. Her katmanda gerçekleştirilecek işin protokoller tarafından paylaşıldığı bu sistem, aslına bakıldığında TCP ve IP dediğimiz iki ana katmandan ve altındaki 4 katmandan oluşmaktadır. Fakat iki ana protokol birlikte çalıştığından TCP/IP diye bilinmektedir.

- Bu mimaride, kullanıcının kullandığı programlar ve işletim sisteminin arka planda yürüttüğü programlar uygulama katmanı içerisinde, uygulama programları olarak adlandırılırlar. Uygulama katmanlarının altında bulunan katmanlar ise iletişimden sorumludurlar. İletişim katmanında yapılacak işlemler sırasında her katman bir altındaki katmanın işini yapmasını beklemektedir.

#### TCP/IP Katmanları

![TCP-IP](resimler/11gnuSys-tcpip.jpg)

##### Uygulama Katmanı

- Bu katman İnternet uygulamalarının paketler yardımı ile birbiri arasında iletişim kurmalarını sağlar. Bu paketlere message adı verilir.Bu katmanda çok sayıda protokol yer alır bunlardan bazıları HTTP , SMTP , FTP , DNS bu protokollerin ne yaptıklarını inceleyelim.
    
1. HTTP (Hypertext Transfer Protocol)

- Türkçe de Köprü Metni Aktarım Protokolü olarak da geçen HTTP Web sunucusu ile Tarayıcının birbirleri ile haberleşmek için kullandıkları bir dildir. Bu dil kullanıcı ile sunucu arasındaki iletim tarzını ve güvenliğini belirler. TCP bağlantısını kullanır. TCP bağlantısını kullanmaktaki en önemli etkenlerden biri realiable olmasıdır. Realiable veriyi sırasıyla ve hatasız bir şekilde ulaştırmayı sağlar. Bu sayede veri kaybı olmaz ve sistem durmadan istek atıp onay almak zorunda kalmaz.

- Bir web sayfasının açılması için gerekli URL 4 kısımdan oluşur protocol://hostname:port/path-and-file-name

        Protocol
        Hostname
        Port
        Path and File Name

Bunlar girildikten sonra siteye istek yollanır ve ulaşma işlemi başarıyla gerçekleşir.

2. SMTP (Simple Mail Transfer Protocol)

- Basit Posta Aktarım Protokolü bir postanın aktarma işlemini gerçekleştiren protokoldür. TCP üzerinden reliable olarak işlemini gerçekleştirmektedir. Çünkü eposta sunucularında unreliable bir bağlantı kullanmak kayıplara yol açacaktır. SMTP ile sunucuya posta iletildikten sonra karşıdaki kişinin bu mesajı alması için POP3 devreye girer. POP3 mesajı sunucudan silerek sisteme yükler ve yeni mesaj olarak saklar.

3. FTP  (File Transfer Protokol)

- İnternet ortamındaki veri aktarımını sağlayan bilgisayarlar arasındaki dosya aktarımını yöneten protokoldür. Bu protokol iki bağlantılı yöntemi kullanır. Öncelikle kullanıcı ile sunucu arasında kullanıcının kendini doğrulaması için “Control TCP” bağlantısı gerçekleştirilir. Bu aşama başarılı bir şekilde gerçekleştirilir ise ikinci aşama olan “Data TCP” yani dosya aktarma işleminin gerçekleştirileceği bağlantı kurulur.
        Control TCP – 21 Numaralı Port
        Data TCP – 20 Numaralı Port

4. DNS (Domain Name Servis)

- İnternet’teki her cihazın iletişim kurması için farklı IP adresleri vardır. DNS IP adresini hostname çevirmeye yada tersi işlemleri yapmaya yarar bu sayede her siteye girmek için IP adresi ezberlemek yerine daha akılda kalan isimleri ezberleriz. Bir kullanıcı “www.ekremcankok.com” sitesine tıkladığı zaman öncelikle IP adresi elde edilir ve bu IP adresi istemciye oradan da sunucuya aktarılır. böylelikle siteye bağlantımız gerçekleştirilir. DNS sunucuları hiyerarşik bir yapıda dağınık olarak bulunur çok fazla sunucu dağınık durumdadır. Bir sonraki yazımda DNS ve Uygulama Katmanın da ortaya çıkabilecek güvenlik zaafiyetlerine daha detaylı bir şekilde değineceğim.

##### Transport Katmanı

- Transport katmanı bir üst katman olan application katmanından aldığı mesajın uygulamalar arasında iletilmesini sağlar. Bu katmanda TCP ve UDP olmak üzere 2 adet iletim protokolü mevcuttur.

- TCP kullanıcılarına veriyi göndermeyi garanti eder. Reliable yani veriyi kayıpsız yollama desteği sunar bunun yanında veriyi sıralı olarak yollayabiliriz fakat bunları yaparken routerlar da bir hız kaybı meydana gelir.

- UDP ise veriyi göndermeyi garantilemez unreliable olarak çalışır. Veri kaybının sorun yaratmadığı ve genel olarak hızın ön planda olduğu yerlerde kullanılır.(Video , Online oyunlar) bazı protokollerde sadece UDP tabanlı çalışmaktadır (DNS , SNMP , RIP , DHCP)

##### Network Katmanı

- Bu katman paketleri bir cihazdan diğerine iletmekle sorumludur. Transport katmanından alınan veriyi düzenleyerek kimden geldiğini ve kime gideceğini belirtir yani Ip Headerlarını ekler ve gönderir. Bu katman IP ve ICMP protokollerini barındırır. Bu katmanda tüm bileşenlerin IP yönlendirme protokolünü çalıştırması zorunludur. Bu katman da gönderilen paketlere “datagram” adı verilir.

##### Physical Katmanı

- Bu katman da tanımlı bir protokol bulunmamaktadır. Bu katman da iletişim bitler ile sağlanır ve iletişimin fiziksel ortamı ile ilgilenmektedir. Bura da fiziksel olarak bit akışını sağlayan Ethernat kartı NIC(Network Interface Card)’ler üzerinde bulunan protokoller çalışır bu sayede kablolar yada dalgalarla iletim sağlanır.


#### 4.1. IP adresi, Ağ, Ağ Maskesi, Ağ Geçidi, Broadcast
#### 4.2. Alt Ağ Adresi Bulma İşlemleri / Subnetting


###5 GNU/Linux Sistemlerde Ağ Yönetimi
#### 5.1. ip, ifconfig, route, traceroute, ping, whois, telnet, netstat, netcat, mtr, ethtool, tcpdump
#### 5.2. Ağ Ayarlarının Yönetimi
##### 5.2.1. /etc/network/interfaces, /etc/sysconfig/network-scripts
##### 5.2.2 NetworkManager
##### 5.2.3 DHCP

NAT
https://www.youtube.com/watch?v=QBqPzHEDzvo

DHCP
https://www.youtube.com/watch?v=e6-TaH5bkjo

TCP/IP
https://www.youtube.com/watch?v=F27PLin3TV0

TCP vs UDP
https://www.youtube.com/watch?v=uwoD5YsGACg

