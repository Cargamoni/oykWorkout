# 3 Temel Komutlar, Kullanıcı ve Grup Yönetimi

### 1. Kullanıcı Kavramı                                                         (PFE101 Unite 3 P:18..25)
- ##### 3.1.1 Kullanıcı Kontrol Dosyalarının Yapıları ("/etc/passwd", "/etc/shadow", "/etc/group")
	- Shadow neden okuyamayız, bağıra bağıra root.

### 2. "root" Kullanıcısı, Özel Tanımlı Kullanıcılar                             (PFE101 Unite 3 P:19)
- Parolanın önemi, root kullanıcısının önemi. Neden root bırakılmamalı ve neden root olarak kullanılmamalı bir işletim sistemi.

### 3. Temel Komutlar                                                            (PFE101 Unite4)
- ##### 3.1 touch, echo, cp, mv, rmdir, rm, file, mkdir, tail, head
      - örnekler/02gnuSys-touch.md
      - file komutunun önemi ve dosyaların uzantılarıyla bir alakasının olması.
      - tail -f ile ilgili bilgilendirme loglamada verilecek.
      - echo giriş çıkış birimlerinde detaylı anlatılacak. 

### 4. Dosyaların İncelenmesi ve Düzenlenmesi                               (PFE101 Unite9)
- ##### 3.4.1 vi, nano, less, more                                        (PFE101 Unite9)
	- vim, nano konularını anlatmam gerekiyor, giriş çıkış kaydetme yeterli. Bunların anlatılmasının üzerine kullaıncı oluşturma mevzularına girilecek. Grup oluşturulma mevuzlarına girilecek. 

### 5. Kullanıcı İşlemleri (oluşturma, silme, kabuk atama, kimlik değişimi)      (PFE101 Unite 2)
- Uygulama `örnekler/03gnuSys-user.md`


- ##### 5.1 Kullanıcı Bilgi Değişikliği (passwd, finger, chsh, chfn)               (PFE101 Unite 2 P:20.21)
- ##### 5.2 Kullanıcı Bilgilerinin Gözlemi (w, who, whoami, id, users, last)       (PFE101 Unite 2 P:20.21)

- id'nin özelliklerini araştırmalarını sağla. -u özellikle. /etc/skell unutma.

- which, whatis, apropos

### 6. Grup Kavramı                                                              (PFE101 Unite 3 P:20)
- ##### 6.1 Grup Dosyalarının Yapıları ("/etc/group", "/etc/gshadow", vs.)         (PFE101 Unite 3)

### 7. Grup İşlemleri (gruba ekleme-çıkarma, grup ekleme-silme, vs.)             (PFE101 Unite 3 P:25)
- Buraya bir örnek Hazırlanacak

### 8. su ve sudo
- ##### 8.1 `ps` aktif olan süreçler ve kabukları gösterebilirsin.
- Konu sonu uygulaması

### 9. Dosya Sahiplikleri ve İzinleri (Yeri Şüpheli, Günün Başında ve Yukarıdakilerin anlatılmış olmalı.)
- ##### 9.1 Dosya ve Dizin Erişimi (PFE101 Unite4)
- ##### 9.2 Dosya Dosya ve Dizin Erişim Denetimi (PFE101 Unite5)