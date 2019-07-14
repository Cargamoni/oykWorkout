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
 
 Uygulama katmanı kullanıcıya en yakın olan ve programla iletişimini sağlayan katman, fiziksel katman ise en uzak olan ve kablodaki veri transferini içeren katmandır. Bir veri demeti, programın uygulama katmanından fiziksel katmana kadar çeşitli işlemlerden geçip (enkapsüle edilip), kablo üzerinden ağa ve oradan da diğer bilgisayarlara ulaşıp tam tersi işleme tabi tutularak, uygulama katmanına çıkarak diğer kullanıcılara iletilir. İnternette ve ağ uygulamalarında yaygın olarak kullanılan TCP/IP protokolünün uygulanmasında ise 6 ve 5 numaralı katmanlar uygulama katmanının içine dahil edilir ve sonuç olarak ortaya melez (hybrid) bir yapı ortaya çıkar.

 TCP / IP Modeli:  7 Uygulama / Application  ------ ------ 4 Taşıma / Transport  3 Ağ / Network 2 Veri iletim / Data Link 1 Fiziksel / Physical  Melez (Hybrid) Model (OSI & TCP/IP)Melez (Hybrid) Model (OSI & TCP/IP)Melez (Hybrid) Model (OSI & TCP/IP)Melez (Hybrid) Model (OSI & TCP/IP)  5 Uygulama / Application  4 Taşıma / Transport  3 Ağ / Network 2 Veri iletim / Data Link 1 Fiziksel / Physical  Ortaya çıkan bu melez model bundan sonraki anlatımların temelini oluşturacak ve her katman detaylarıyla ayrı başlıklar altında incelenecektir. Bu modele göre katmanlarda çalışan bazı protokol örnekleri ise şöyledir:  5 HTTP,TELNET,SMTP, IRC 4 TCP 3 IP 2 PPP 1 BNC  5 CNC 4 SPX  3 IPX  2 Ethernet 1 UTP

### 3. Ağ Protokolleri
#### 3.2. TCP, UDP, ICMP


### 4. TCP/IP Protokolü
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

