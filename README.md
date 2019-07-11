# GNU/Linux Sistem Yönetimi 1. Düzey Eğitimi
## Anlatım Sırası ve Konular

Eğitim iki haftaya yayılmış olarak temelde iki bölümde ele alınmaktadır.  "Temel TCP/IP Bilgisi ve Ağ Yönetimi" konusu ayıraç görevi görmektedir. İlk 9 günde bu konu ve önceki tüm konular tamamlanmış olunmalıdır.

Bu bölümlemeye dikkat edildiği sürece, konuların sıralaması eğitmenlerin kendilerine bırakılmaktadır.

Yine burada belirtilen tüm konular işlendiği ve 2. düzey konularına geçilmediği sürece müfredatta olmayan ek konuların anlatılması da mümkündür (çekirdek ve modülleri, lvm, systemd unit'i yazılması, vs).

### 1 Özgür Yazılım Felsefesi ve Temel Kavramlar
* 1.1 Yazılımın özgürlüğü kavramı                                               
* 1.2 Yazılım lisansları                                                        
* 1.3 Özgür yazılım vs açık kaynak                                              
* 1.4 Özgür programlama dilleri                                                  
* 1.5 İşletim sistemi kavramı ve yapısı                                          
* 1.6 Çekirdek tanımı                                                            
* 1.7 Özgür yazılımların tarihçesi ve felsefesi (Revolution OS)                  
* 1.8 Özgür yazılımların sağladığı kazanımlar                                    
* 1.9 Özgür yazılımların kullanım alanları                                       
* 1.10 Dağıtımlar ve Dağıtım Seçimi                                              
    1.10.1 GNU/Linux, FreeBSD, OpenBSD ve özel mülkiyet UNIX işletim sistemleri  
    1.10.2 Debian Ailesi                                                         
    1.10.3 RedHat Ailesi                                                         
    1.10.4 Özelleşmiş Dağıtımlar (pfSense, FreeNAS vs)                           
    1.10.5 Diğer Dağıtımlar (SuSE, Arch, Gentoo, vs)                             
    

### 2 Baby Steps ve GNU/Linux İşletim Sisteminin Yapısı
* 2.1 Kabuk Kavramı                                                             
* 2.2 Yardım Almak (man, info, help, Google :P)                                 
* 2.3 Kabukta İlk Adımlar (whoami, pwd, cd, ls, cat)                            
    2.3.1 Seçenekler, çift ve tek tire                                              
    2.3.2 Parametre ve argümanlar                                               
* 2.4 Açılış Sistemi                                                            
* 2.5 Dosya Sistemlerinin Tanıtılması                                           
* 2.6 Dosya ve Dizin Hiyerarşisi                                                
* 2.7 Dosya Türleri (Dizin, Soket, vs)                                          
* 2.8 Sembolik bağ tanım                                                            
* 2.9 Mutlak Yol, Bağıl Yol Kavramları                                          


### 3 Temel Komutlar, Kullanıcı ve Grup Yönetimi
* 3.1 Kullanıcı Kavramı                                                         
    3.1.1 Kullanıcı Kontrol Dosyalarının Yapıları ("/etc/passwd",                
    "/etc/shadow", "/etc/group")                                                
* 3.2 "root" Kullanıcısı, Özel Tanımlı Kullanıcılar ve "sudo"                   
* 3.3 Temel Komutlar                                                            
    3.3.1 touch, echo, cp, mv, rmdir, rm, file, mkdir, tail, head
* 3.4 Dosyaların İncelenmesi ve Düzenlenmesi                               
    3.4.1 vi, nano, less, more
* 3.5 Kullanıcı İşlemleri (oluşturma, silme, kabuk atama, kimlik değişimi)      
    3.5.1 Kullanıcı Bilgi Değişikliği (passwd, finger, chsh, chfn)               
    3.5.2 Kullanıcı Bilgilerinin Gözlemi (w, who, whoami, id, users, last)       
* 3.6 Grup Kavramı                                                              
    3.6.1 Grup Dosyalarının Yapıları ("/etc/group", "/etc/gshadow", vs.)         
* 3.7 Grup İşlemleri (gruba ekleme-çıkarma, grup ekleme-silme, vs.)             
* 3.8 su ve sudo
* 3.9 Dosya Sahiplikleri ve İzinleri (Yeri Şüpheli, Günün Başında ve Yukarıdakilerin anlatılmış olmalı.)
    3.9.1 Dosya ve Dizin Erişimi                                                
    3.9.2 Dosya Dosya ve Dizin Erişim Denetimi                                  


### 4 Kabuk, Özellikleri ve Temel Komutların Devamı
* 4.1 Bourne-Again SHell (Bash)
* 4.2 Uçbirimde yön bulma
    4.2.1 Sık Kullanılan Kısa Yollar                                         
    4.2.2 Geçmiş                                                             
* 4.3 Çevresel Değişkenler (Giriş Seviyesi)                                     
* 4.4 Standart Girdi/Çıktı (IO)                                                 
* 4.5 Özel karakterler                                                          
* 4.6 Mantıksal Operatorler                                                     
* 4.7 Takma Ad (Alias)                                                          
* 4.8 Girdi/Çıktının Yönlendirilmesi                                            
    4.8.1 pipe, tee, grep
* 4.9 Dosya içerik arama işlemleri                                            
    4.9.1 find, locate                                                        
* 4.10 Temel Komutlar                               
    4.10.1 grep, wc, sort, which, du, df, wget, curl                   
* 4.11 Sembolik bağ kullanım                                                   
* 4.12 İçerik Manipülasyonları                                              
* 4.13 sed--, awk--, tr, vi, cut, split(gelişmiş)                         
* 4.14 Donanım Bilgisi Toplama (dmidecode, lscpu, lspci, lsusb)             

### 5 Süreçler ve Servisler
* 5.1 Süreç Kavramı                                                             
* 5.2 Süreç Durumlarının Açıklaması                                             
* 5.3 Süreçlerin Yönetimi (öldürme, durdurma, jobs, fg-bg, vs.)                 
    5.3.1 ps, top, htop Çıktılarının İncelenmesi                                 
    5.3.2 Sinyaller                                                              
* 5.4 Servis Kavramı                                                              
* 5.5 Systemd ve SysV sistemleri                                                


### 6 Zamanlanmış Görevler
* 6.1 cron                                                                   
* 6.2 systemd-timer                                                          

### 7 Paket Yönetim Sistemi
* 7.1 Temel Kavramlar (Paket, Depo, Paket Yöneticisi)                           
* 7.2 Dağıtımların Paket Yöneticileri ve Araçları (apt/deb, yum/rpm, pacman,    
      zypper/rpm, vs.)                                                          
* 7.3 Temel İşlemler (kurma, kaldırma, güncelleme, arama, detaylı               
      paket inceleme, vs.)                                                      
* 7.4 Yükseltme, Eski Sürüme İndirme (downgrade) ve Otomatik Güncelleme         
* 7.5 Benzer Sistemler (maven, composer, rvm, pip, nuget, vs.)                  
* 7.6 Önbellek (cache, yerel indeks) Yönetimi                                   
* 7.7 DEB/APT - YUM/RPM  farklılıkları                                          
* 7.8 Yeni Paket Depolarının Eklenmesi 
    7.8.1 Repo Ekleme (Debian)
* 7.9 Bir Depodaki Belli Paketlerin Kullanılma(ma)sı ve Güncellenmemesi         
      (exclude)
* 7.10 Paket Yöneticileri ve Ayar Dosyaları                                     
* 7.11 Paket Yönetimi Geçmişi Yönetimi ve İşlem Geri Alma                       
* 7.12 Paket Yöneticisi Kullanılarak Bir Programın Kaynak Kodunun İndirilmesi   
* 7.13 Delta kavramı                                                            


### 8 Sistem Kayıtları
* 8.1 Log Kavramı                                                               
    8.1.1 syslog, rsyslog                                                        
* 8.2 /var/log İncelemesi                                                       
* 8.3 logger Aracının Kullanımı, İncelenmesi                                    
* 8.4 systemd-journald Kullanımı, Farkları                                      

### 9 Depolama Aygıtlarının Yönetimi
* 9.1 GNU/Linux Sistemlerde Disk Yönetimi                                    
    9.1.1 Disk bölümleme (fdisk, parted vb. )                                 
    9.1.2 Bir Dosya Sistemi Kullanılarak Diskin Formatlanması (mkfs)          
    9.1.3 Dosya sisteminin kontrolü ve düzeltilmesi (fsck)                    
* 9.2 Mount (Bindirme) İşlemleri                                             
    9.2.1 Mount Parametreleri                                                 
    9.2.2 /etc/fstab Açıklaması                                               
* 9.3 Hard link ve inode (ln, stat)                                          
* 9.4 Bir sürecin kullandığı bir dosyanın silinmesi ya da Çalıştırılan Dosyanın Silinmesi değiştirilmesi.


### 10 Revolution OS
* 10.1 Eğer istediğim gibi giderse ödül olarak.


### 11 Temel TCP/IP Bilgisi ve Ağ Yönetimi
* 11.1 Ağ Nedir?
* 11.2 Temel Ağ Bilgisi
    11.2.1 OSI Katmanları
* 11.3 Ağ Protokolleri
    11.3.2 TCP, UDP, ICMP
* 11.4 TCP/IP Protokolü
    11.4.1 IP adresi, Ağ, Ağ Maskesi, Ağ Geçidi, Broadcast
    11.4.2 Alt Ağ Adresi Bulma İşlemleri / Subnetting
* 11.5 GNU/Linux Sistemlerde Ağ Yönetimi
    11.5.1 ip, ifconfig, route, traceroute, ping, whois, telnet, netstat, netcat, mtr, ethtool, tcpdump
    11.5.2 Ağ Ayarlarının Yönetimi
        11.5.2.1 /etc/network/interfaces, /etc/sysconfig/network-scripts
        11.5.2.2 NetworkManager
        11.5.2.3 DHCP


### 12 DNS Teknolojisine Giriş
* 12.1 DNS sisteminin çalışması
    12.1.1 Ağaç yapısı (tr -> org -> linux -> kamp)
    12.1.2 Alan adı çözümleme (nsswitch, /etc/hosts, /etc/resolv.conf)
    12.2 dig, nslookup, host
* 12.3 DNS kayıtlarının incelenmesi (A, MX, CNAME, NS, AAAA)
* 12.4 Birincil (master) ve ikincil (slave) DNS kavramı.
    12.4.1 Yetkili (authorative)
    12.4.2 Özyinelemeli (recursive) sorgu
* 12.5 SOA kaydı (TTL, Refresh, Retry, Expire, Minimum)


### 13 Güvenli Uzaktan Erişim
* 13.1 SSH'a Giriş                                                              
    13.1.1 Doğrulama yöntemleri (parola, anahtar, vs.)                           
    13.1.2 Şifreleme yöntemleri (simetrik - asimetrik)                           
* 13.2 sshd servisi ve ayarları                                                 
* 13.3 Parolasız güvenli erişim                                                 
* 13.4 ssh uzaktan komut çalıştırma                                             
* 13.5 scp ile dosyaların güvenli bir şekilde kopyalanması                      
* 13.6 sftp ile güvenli FTP benzeri dosya aktarma erişimi                       
* 13.7 ssh ile SOCKS vekil (proxy) sunucu                                       
* 13.8 ssh ile tünelleme ve ters tünelleme                                      
* 13.9 ssh-agent ile anahtar taşıma                                             
* 13.10 ssh ile X11 tünelleme                                                   
* 13.11 ssh istemcisinin ~/.config dosyasının yapılandırılması                  


### 14 Yedekleme, Arşivleme ve Sıkıştırma
* 14.1 Arşivleme (GNU Tar)                                                                      
* 14.2 Sıkıştırma Yöntemleri ve Farkları (gzip, xz, bzip2, zip, rar)       
* 14.3 rsync (ssh üzerinden) ile dizin eşitlenmesi
* 14.4 Yedekleme yazılımlarının tantılması (Bacula, rdiff-backup, vs)


### 15 Web Teknolojisine Giriş
* 15.1 HTTP Protokolü ve World-Wide-Web (WWW)
* 15.2 İstemci (Firefox, Chromium, vs) ve Sunucu (Apache, Nginx, vs) Yazılımları
* 15.3 İstemcide (HTML, CSS, vs) ve Sunucuda (PHP, Java EE, Ruby on Rails, vs) Çalışan Teknolojiler
* 15.4 Uygulama Sunucuları ve Web ile Bağlantılı Diğer Servisler
* 15.5 Bir Web Sayfasının Görüntülenmesi
* 15.6 İstemcinin ve Sunucunun Kısıtlamaları
* 15.7 GET, POST, Cookie ile Değişken Aktarımı
* 15.8 SSL ile Güvenli HTTP (TLS/SSL) ve SSL Sertifikası
* 15.9 HTTP Doğrulama
* 15.10 HTTP Durum Kodları

### 16 Veritabanı Servislerine Giriş
* 16.1 İlişkisel veritabanı modeli                                              
    16.1.1 Veritabanı, tablo, kolon, satır kavramı                               
    16.1.2 Birincil anahtar, yabancı anahtar                                     
    16.1.3 Örnek uygulama veritabanı tasarımı (5-6 tabloyu aşmayacak)            
* 16.2 SQL'e Giriş (SELECT, INSERT, UPDATE, DELETE sorguları)                   
* 16.3 İlişkisel olmayan veritabanları tanıtımı                                 

### 17 Apache/PHP/MySQL Kurulumu ve Örnek Bir Uygulamanın Koşturulması
* 17.1 Apache/PHP/MySQL'in paket yöneticisinden kurulumu                        
* 17.2 phpMyAdmin web arayüzünün kurulumu                                       
* 17.3 Wordpress'in meşhur 5 dakikada kurulumu                                  
    17.3.1 MySQL'de kullanıcı oluşturulması                                      
    17.3.2 Apache'de gerekli ayarların düzenlenmesi (AllowOverride, vs)          
* 17.4 Kendi sunucunuza kurabileceğiniz yaygın uygulamalar                      
  (https://github.com/Kickball/awesome-selfhosted)                              

### 18 Bash Betik (Script) Yazımına Giriş
* 18.1 Değişken (global / yerel)                                                
* 18.2 Temel kontrol yapıları (if, for, while, ve case) ve karşılaştırma        
    operatörleri                                                                
* 18.3 Komut satırından parametre alınması                                      
* 18.4 Betik dönüş (return) kodları ve ona göre işlem yapılması                 
* 18.5 Sık kullanılan çevresel değişkenler (tarih, kullanıcı, vs)               
