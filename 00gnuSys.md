# GNU/Linux Sistem Yönetimi 1. Düzey Eğitimi
## Anlatım Sırası ve Konular

Eğitim iki haftaya yayılmış olarak temelde iki bölümde ele alınmaktadır.  "Temel TCP/IP Bilgisi ve Ağ Yönetimi" konusu ayıraç görevi görmektedir. İlk 9 günde bu konu ve önceki tüm konular tamamlanmış olunmalıdır.

Bu bölümlemeye dikkat edildiği sürece, konuların sıralaması eğitmenlerin kendilerine bırakılmaktadır.

Yine burada belirtilen tüm konular işlendiği ve 2. düzey konularına geçilmediği sürece müfredatta olmayan ek konuların anlatılması da mümkündür (çekirdek ve modülleri, lvm, systemd unit'i yazılması, vs).

### 1 Özgür Yazılım Felsefesi ve Temel Kavramlar
* 1.1 Yazılımın özgürlüğü kavramı                                               (PFE101 Unite 1)
* 1.2 Yazılım lisansları                                                        (PFE101 Unite 1)
* 1.3 Özgür yazılım vs açık kaynak                                              (PFE101 Unite 1)
* 1.4 Özgür programlama dilleri                                                  01gnuSys.md
* 1.5 İşletim sistemi kavramı ve yapısı                                          (PFE101 Unite 1)
* 1.6 Çekirdek tanımı                                                            (PFE101 Unite 1)
* 1.7 Özgür yazılımların tarihçesi ve felsefesi (Revolution OS)                  01gnuSys.md
* 1.8 Özgür yazılımların sağladığı kazanımlar                                    01gnuSys.md
* 1.9 Özgür yazılımların kullanım alanları                                       01gnuSys.md
* 1.10 Dağıtımlar ve Dağıtım Seçimi                                              (PFE101 Unite 1)
    1.10.1 GNU/Linux, FreeBSD, OpenBSD ve özel mülkiyet UNIX işletim sistemleri  (PFE101 Unite 1)
    1.10.2 Debian Ailesi                                                         (PFE101 Unite 1)
    1.10.3 RedHat Ailesi                                                         (PFE101 Unite 1)
    1.10.4 Özelleşmiş Dağıtımlar (pfSense, FreeNAS vs)                           01gnuSys.md
    1.10.5 Diğer Dağıtımlar (SuSE, Arch, Gentoo, vs)                             01gnuSys.md
    

### 2 Baby Steps ve GNU/Linux İşletim Sisteminin Yapısı
* 2.1 Kabuk Kavramı                                                             (PFE101 Unite8)
* 2.2 Yardım Almak (man, info, help, Google :P)                                 (PFE101 Unite8)
* 2.3 Kabukta İlk Adımlar (whoami, pwd, cd, ls, cat)                            02gnuSys.md
    2.3.1 Seçenekler, çift ve tek tire                                          02gnuSys.md    
    2.3.2 Parametre ve argümanlar                                               02gnuSys.md
* 2.4 Açılış Sistemi                                                            (PFE101 Unite 2)
* 2.5 Dosya Sistemlerinin Tanıtılması                                           (PFE101 Unite 2)
* 2.6 Dosya ve Dizin Hiyerarşisi                                                (PFE101 Unite 2)
* 2.7 Dosya Türleri (Dizin, Soket, vs)                                          (PFE101 Unite4)
* 2.8 Sembolik bağ tanım                                                        (PFE101 Unite6) 
* 2.9 Mutlak Yol, Bağıl Yol Kavramları


### 3 Temel Komutlar, Kullanıcı ve Grup Yönetimi
* 3.1 Kullanıcı Kavramı                                                         (PFE101 Unite 2)
    3.1.1 Kullanıcı Kontrol Dosyalarının Yapıları ("/etc/passwd",                (PFE101 Unite 2)
    "/etc/shadow", "/etc/group")                                                (PFE101 Unite 2)
* 3.2 "root" Kullanıcısı, Özel Tanımlı Kullanıcılar ve "sudo"                   (PFE101 Unite 3)
* 3.3 Temel Komutlar                                                            (PFE101 Unite4)
    3.3.1 touch, echo, cp, mv, rmdir, rm, file, mkdir, tail, head
* 3.4 Dosyaların İncelenmesi ve Düzenlenmesi                               (PFE101 Unite9)
    3.4.1 vi, nano, less, more
* 3.5 Kullanıcı İşlemleri (oluşturma, silme, kabuk atama, kimlik değişimi)      (PFE101 Unite 2)
    3.5.1 Kullanıcı Bilgi Değişikliği (passwd, finger, chsh, chfn)               (PFE101 Unite 2)
    3.5.2 Kullanıcı Bilgilerinin Gözlemi (w, who, whoami, id, users, last)       (PFE101 Unite 2)
* 3.6 Grup Kavramı                                                              (PFE101 Unite 3)
    3.6.1 Grup Dosyalarının Yapıları ("/etc/group", "/etc/gshadow", vs.)         (PFE101 Unite 3)
* 3.7 Grup İşlemleri (gruba ekleme-çıkarma, grup ekleme-silme, vs.)             (PFE101 Unite 3)
* 3.8 su ve sudo
* 3.9 Dosya Sahiplikleri ve İzinleri (Yeri Şüpheli, Günün Başında ve Yukarıdakilerin anlatılmış olmalı.)
    3.9.1 Dosya ve Dizin Erişimi                                                (PFE101 Unite4)
    3.9.2 Dosya Dosya ve Dizin Erişim Denetimi                                  (PFE101 Unite5)


### 4 Kabuk, Özellikleri ve Temel Komutların Devamı
* 4.1 Bourne-Again SHell (Bash)                                              (PFE101 Unite8)
* 4.2 Uçbirimde yön bulma                                                    (PFE101 Unite8)
    4.2.1 Sık Kullanılan Kısa Yollar                                         (PFE101 Unite8)
    4.2.2 Geçmiş                                                             (PFE101 Unite8)
* 4.3 Çevresel Değişkenler (Giriş Seviyesi)                                     (PFE101 Unite8)
* 4.4 Standart Girdi/Çıktı (IO)                                                 (PFE101 Unite7)
* 4.5 Özel karakterler                                                          (PFE101 Unite4)
* 4.6 Mantıksal Operatorler                                                     (PFE101 Unite4)
* 4.7 Takma Ad (Alias)                                                          (PFE101 Unite8)
* 4.8 Girdi/Çıktının Yönlendirilmesi                                            (PFE101 Unite7)
    4.8.1 pipe, tee, grep
* 4.9 Dosya içerik arama işlemleri                                            (PFE101 Unite7)
    4.9.1 find, locate                                                        (PFE101 Unite4)
* 4.10 Temel Komutlar
    4.10.1 grep, wc, sort, which, du, df, wget, curl                   (PFE101 Unite9)
* 4.11 Sembolik bağ kullanım                                                  (PFE101 Unite6) 
* 4.12 İçerik Manipülasyonları 
    4.12.1 sed--, awk--, tr, vi, cut, split(gelişmiş)                         (PFE101 Unite12)
* 4.13 Donanım Bilgisi Toplama (dmidecode, lscpu, lspci, lsusb)             (PFE201 Unite11)

### 5 Süreçler ve Servisler
* 5.1 Süreç Kavramı                                                             (PFE101 Unite10)
* 5.2 Süreç Durumlarının Açıklaması                                             (PFE101 Unite10)
* 5.3 Süreçlerin Yönetimi (öldürme, durdurma, jobs, fg-bg, vs.)                 (PFE101 Unite10)
    5.3.1 ps, top, htop Çıktılarının İncelenmesi                                 (PFE101 Unite10)
    5.3.2 Sinyaller                                                              (PFE101 Unite14)
* 5.4 Servis Kavramı                                                            (PFE101 Unite14)
* 5.5 Systemd ve SysV sistemleri                                                (PFE101 Unite14)


### 6 Zamanlanmış Görevler
* 6.1 cron                                                                   (PFE201 Unite8)
* 6.2 systemd-timer                                                          (PFE201 Unite3)

### 7 Paket Yönetim Sistemi
* 7.1 Temel Kavramlar (Paket, Depo, Paket Yöneticisi)                           (PFE201 Unite7)
* 7.2 Dağıtımların Paket Yöneticileri ve Araçları (apt/deb, yum/rpm, pacman,    (PFE201 Unite7)
      zypper/rpm, vs.)                                                          (PFE201 Unite7)
* 7.3 Temel İşlemler (kurma, kaldırma, güncelleme, arama, detaylı               (PFE201 Unite7)
      paket inceleme, vs.)                                                      (PFE201 Unite7)
* 7.4 Yükseltme, Eski Sürüme İndirme (downgrade) ve Otomatik Güncelleme         (PFE201 Unite7)
* 7.5 Benzer Sistemler (maven, composer, rvm, pip, nuget, vs.)                  Hakimim
* 7.6 Önbellek (cache, yerel indeks) Yönetimi                                   07gnuSys.md
* 7.7 DEB/APT - YUM/RPM  farklılıkları                                          (PFE201 Unite7)
* 7.8 Yeni Paket Depolarının Eklenmesi (Debian)                                 07gnuSys.md
* 7.9 Bir Depodaki Belli Paketlerin Kullanılma(ma)sı ve Güncellenmemesi(exclude)07gnuSys.md
* 7.10 Paket Yöneticileri ve Ayar Dosyaları                                     07gnuSys.md
* 7.11 Paket Yönetimi Geçmişi Yönetimi ve İşlem Geri Alma                       07gnuSys.md
* 7.12 Paket Yöneticisi Kullanılarak Bir Programın Kaynak Kodunun İndirilmesi   07gnuSys.md
* 7.13 Delta kavramı                                                            07gnuSys.md


### 8 Sistem Kayıtları
* 8.1 Log Kavramı                                                               (PFE201 Unite9)
    8.1.1 syslog, rsyslog                                                        (PFE201 Unite9)
* 8.2 /var/log İncelemesi                                                       (PFE201 Unite9)
* 8.3 logger Aracının Kullanımı, İncelenmesi                                    Sorulacak
* 8.4 systemd-journald Kullanımı, Farkları                                      (PFE201 Unite3)

### 9 Depolama Aygıtlarının Yönetimi
* 9.1 GNU/Linux Sistemlerde Disk Yönetimi                               (PFE101 Unite6 - PFE201 Unite4)
    9.1.1 Disk bölümleme (fdisk, parted vb. )                                 (PFE101 Unite6 - PFE201 Unite4)
    9.1.2 Bir Dosya Sistemi Kullanılarak Diskin Formatlanması (mkfs)          (PFE101 Unite6 - PFE201 Unite4)
    9.1.3 Dosya sisteminin kontrolü ve düzeltilmesi (fsck)                    (PFE101 Unite6 - PFE201 Unite4)
* 9.2 Mount (Bindirme) İşlemleri                                             (PFE101 Unite6 - PFE201 Unite4)
    9.2.1 Mount Parametreleri                                                 (PFE101 Unite6 - PFE201 Unite4)
    9.2.2 /etc/fstab Açıklaması                                               (PFE101 Unite6 - PFE201 Unite4)
* 9.3 Hard link ve inode (ln, stat)                                          (PFE101 Unite6 - PFE201 Unite4)
* 9.4 Bir sürecin kullandığı bir dosyanın silinmesi ya da çalıştırılan Dosyanın Silinmesi
  değiştirilmesi


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
* 12.2 dig, nslookup, host
* 12.3 DNS kayıtlarının incelenmesi (A, MX, CNAME, NS, AAAA)
* 12.4 Birincil (master) ve ikincil (slave) DNS kavramı.
    12.4.1 Yetkili (authorative)
    12.4.2 Özyinelemeli (recursive) sorgu
* 12.5 SOA kaydı (TTL, Refresh, Retry, Expire, Minimum)


### 13 Güvenli Uzaktan Erişim
* 13.1 SSH'a Giriş                                                              13gnuSys.md
    13.1.1 Doğrulama yöntemleri (parola, anahtar, vs.)                          13gnuSys.md
    13.1.2 Şifreleme yöntemleri (simetrik - asimetrik)                          13gnuSys.md
* 13.2 sshd servisi ve ayarları                                                 13gnuSys.md
* 13.3 Parolasız güvenli erişim                                                 13gnuSys.md
* 13.4 ssh uzaktan komut çalıştırma                                             13gnuSys.md
* 13.5 scp ile dosyaların güvenli bir şekilde kopyalanması                      13gnuSys.md
* 13.6 sftp ile güvenli FTP benzeri dosya aktarma erişimi                       13gnuSys.md
* 13.7 ssh ile SOCKS vekil (proxy) sunucu                                       13gnuSys.md
* 13.8 ssh ile tünelleme ve ters tünelleme                                      13gnuSys.md
* 13.9 ssh-agent ile anahtar taşıma                                             13gnuSys.md
* 13.10 ssh ile X11 tünelleme                                                   13gnuSys.md
* 13.11 ssh istemcisinin ~/.config dosyasının yapılandırılması                  13gnuSys.md


### 14 Yedekleme, Arşivleme ve Sıkıştırma
* 14.1 Arşivleme (GNU Tar)                                                 (PFE101 Unite6)
* 14.2 Sıkıştırma Yöntemleri ve Farkları (gzip, xz, bzip2, zip, rar)       (PFE101 Unite6)
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
* 16.1 İlişkisel veritabanı modeli                                              Bilgiye Sahibim
    16.1.1 Veritabanı, tablo, kolon, satır kavramı                               Bilgiye Sahibim
    16.1.2 Birincil anahtar, yabancı anahtar                                     Bilgiye Sahibim
    16.1.3 Örnek uygulama veritabanı tasarımı (5-6 tabloyu aşmayacak)            Bilgiye Sahibim
* 16.2 SQL'e Giriş (SELECT, INSERT, UPDATE, DELETE sorguları)                   Bilgiye Sahibim
* 16.3 İlişkisel olmayan veritabanları tanıtımı                                 Araştırılacak

### 17 Apache/PHP/MySQL Kurulumu ve Örnek Bir Uygulamanın Koşturulması
* 17.1 Apache/PHP/MySQL'in paket yöneticisinden kurulumu                        17gnuSys.md
* 17.2 phpMyAdmin web arayüzünün kurulumu                                       17gnuSys.md
* 17.3 Wordpress'in meşhur 5 dakikada kurulumu                                  17gnuSys.md
    17.3.1 MySQL'de kullanıcı oluşturulması                                     17gnuSys.md
    17.3.2 Apache'de gerekli ayarların düzenlenmesi (AllowOverride, vs)         17gnuSys.md
* 17.4 Kendi sunucunuza kurabileceğiniz yaygın uygulamalar                      17gnuSys.md
  (https://github.com/Kickball/awesome-selfhosted)                              17gnuSys.md

### 18 Bash Betik (Script) Yazımına Giriş
* 18.1 Değişken (global / yerel)                                                (PFE101 Unite13)
* 18.2 Temel kontrol yapıları (if, for, while, ve case) ve karşılaştırma        (PFE101 Unite13)
    operatörleri                                                                (PFE101 Unite13)
* 18.3 Komut satırından parametre alınması                                      (PFE101 Unite13)
* 18.4 Betik dönüş (return) kodları ve ona göre işlem yapılması                 (PFE101 Unite13)
* 18.5 Sık kullanılan çevresel değişkenler (tarih, kullanıcı, vs)               (PFE101 Unite13)
