# 8 Sistem Kayıtları

### 1. Log Kavramı (PFE201 Unite9 P:75..84)

- UNIX sistemleri ve üzerlerinde çalışan süreçler durum raporu, uyarı ve hata iletilerini sistem kayıt sunucusuna gönderirler. Sistem kayıt sunucusu, kendisine gelen sistem günlüğüne ekleme
istemlerini alarak günlük dosyasına ekler. Sistem yöneticisi hata ve durum takibini sistem günlüğü dosyalarından yararlanarak yapar. Sistem kayıtlarının tutulabilmesi için “syslogd” sürecinin çalışıyor olması gerekmektedir. Sistem günlüğüne eklenen kayıtlar hizmet türü ve hizmet önceliği bilgileri ile eklenir.

- Bir sunucu kaydınıın (log dosyasının) yasal delil olarak kabul edilebilmesi için bi zaman damgası basması gerekmektedir. Aynı zamanda akredite bir kurum tarafından onaylanması gerekir. Ülkemizde bu işlere bakan birim Tübitak.

- ###### 1.1 syslog, rsyslog (PFE201 Unite9)

### 2. /var/log İncelemesi (PFE201 Unite9)
    - örnekler/08gnuSys-tail.md

### 3. logger Aracının Kullanımı, İncelenmesi
- Logger bize terminal, betikler veya başka bir dosyadan log girmemizi sağlayan güzel, kullanımı oldukça kolay bir araçtır. Nasıl çalıştığına gelecek olursak. Kolay demiştim kullanımı ne kadar kolay olduğunu beraber görelim.

`logger bu mesaj doğrudan loglara gidecek`

`tail -l /var/syslog`

- Bu kadar basit bir kullanımı mevcut. 

`logger \`who\`` ile bir program çıktısını loglara oyllayabilirsiniz.

`logger -f buDosya.txt` ile dosyadan loglara yollayabilirsiniz.

`grep logger /bin/calisirilaiblirDosya`

`logger "$0 `date` tarihinde tamamlandı"`

- Yukarıdaki şekilde bir programın tamamlanıp tamamlanmadığını kontrol edebilirsiniz. Yukarıdaki ikinci satır bir bash script içerisinde yer almaktadır.

`logger --size 10 1234567890123234446523421837462198376219836`

- Dosyanın tamamını çıktı olarak alıyorsanız, bu dosyada sınırlandırmalar yapabiliyorsunuz. Veya yukarıdaki gibi belli bir kısmını alaiblirsiniz. Bu özellik boşluk ile karşılaştığı zaman farklı şekilde çalışaibliyor. `logger --size 6 `date`` şeklinde yazdığınızda boşlukları birer satır olarak eklediğini görebilisiniz. Size ile beraber maksimum 1024byte yani 1Kb şeklinde varsayılan değere sahiptir.


`logger -e` ile boşlukları yok sayabilirsiniz.


### 4. systemd-journald Kullanımı, Farkları (PFE201 Unite3)

- Basit bir şekilde kullanımı ve log izlenimi `journalctl` ile beraber yapılabilir.

- `journalctl --utc` ile zaman damgasını utc zamanına göre çevirebilirsiniz.

- `journalctl -b` ile günlük olarak veya yakın zamanda sistemi yeniden başlattıysanız o zamandan itibaren olan journal girişlerini karşınıza getirir.

- journald ile beraber açılma zamanlarını da kontrol edebilirsiniz, bunun için `/etc/systemd/journald.conf` konfigürasyon dosyasını düzenlememiz gerekiyor. Storage bölümündeki yorum satırını kaldırdığımız zaman ve `persistent` olarak değiştirdiğimizde erişim kayıtlarını `journalctl --list-boots` ile beraber izleyebiliyoruz. Aynı zamanda `journalctl -b -l` ile beraber -l ile beraber son boot bölümünü -b bayrağı taşıyan logu getirebilirsiniz. -b özelliği ile beraber direk boot ID'yi de getirebilirsiniz.

- `journalctl --since` ile beraber belli bir zaman aralığında veya belirli tarihe göre listeleme yapabiliyoruz. `YYYY-MM-DD HH:MM:SS` formatında beli tarihe bakabiliyoruz.

`journalctl --since "2015-01-10 17:15:00"`

`journalctl --since "2015-01-10" --until "2015-01-11 03:00"`

`journalctl --since yesterday`

`journalctl --since 09:00 --until "1 hour ago"`

- Karşınıza getirilecek olan log kayıtlarını filitrelemek için -u özelliğini (option) kullanıyoruz. belli bir veya birden fazla sahibe ait logları karşımıza getirebilme gücüne sahip.

`journalctl -u nginx.service`

`journalctl -u nginx.service --since today`

`journalctl -u nginx.service -u php-fpm.service --since today`

- Belli bir gruba veya kullanıcıya ait olan bilginin getirilmesi için de jurnald bize kolaylık sağlıyor. Belli bir gruba ait veya dosyaya ait sahipliğin kimde olduğunu ve bunların hangi idye ait olduğunu öğrenmek için `id` kullanılabilir.

`journalctl _PID=8088`

`journalctl _UID=`id -u www-data` --since today`

- journalfileds ile ilgili man sayfalarını kontrol edebilirsiniz. journalctl bize hangi kullanıcıların veya grupların şuana kadar log kayıtlarının olduğunu göstermesini sağlayabiliyoruz.

`journalctl -F _GID`

- Belli bir path üzerindeki uygulamalar, birimler ile ilgili de flitreleme yapabiliyoruz. Bu bir çalıştırılabilir dosya ise bu çalıştırılabilir dosyaya ait olan sistem kayıtlarını gösterecektir.

`journalctl /bin/bash`

- Direk olarak kernel mesajlarını görmek için de kullanılabilir. Dmesg çıktısı bunu bize sağlamaktadır. Journald bizim için bunu da yapabiliyor.

`journalctl -k`

`journalctl -k -b -5` Burada da boot flagı taşıyan kayıtları getirir.


    0: emerg
    1: alert
    2: crit
    3: err
    4: warning
    5: notice
    6: info
    7: debug

- Bu düzene göre journald bize önceliğe göre sıralama yaparak sistem kayıtlarını getirmektedir. Sistem kayıtları bu sayede de flitrelenebilir.

`journalctl -p err -b`

- Sistem kayılarının önümüze gelen çıktısını de düzenleyebiliyoruz.

`journalctl --no-full`

`journalctl -a`

- Journald ile karşımıza logları getirmeye çalıştığımızda, pager denilen bir araç ile beraber daha okunabilir hale gelmesini sağlar. Tüm veriler yerine bir kısmını karşımıza getirir. Bu olmadan görmek istiyorsak

`journalctl --no-pager`

- Pek çok özelliğe sahip olan journald bizim için json içerisine de aktarma yapabiliyor. Aynı zamanda aşağıdaki bir takım çıkış formatını da desteklemektedir. Çıkış kanalını bu şekilde daha verimli şekilde kullanabiliyoruz.

        cat: Displays only the message field itself.
        export: A binary format suitable for transferring or backing up.
        json: Standard JSON with one entry per line.
        json-pretty: JSON formatted for better human-readability
        json-sse: JSON formatted output wrapped to make add server-sent event compatible
        short: The default syslog style output
        short-iso: The default format augmented to show ISO 8601 wallclock timestamps.
        short-monotonic: The default format with monotonic timestamps.
        short-precise: The default format with microsecond precision
        verbose: Shows every journal field available for the entry, including those usually hidden internally.

`journalctl -b -u nginx -o json`

`journalctl -b -u nginx -o json-pretty`

- Aynı tail'de yapabildiğimiz gibi -n ile beraber karşımıza gelecek logları sınırlandırabiliyoruz. Aynı `tail -f` de yapabildiğimiz gibi süregelen logları da sürekli akış halinde inceleyebiliyoruz.

`journalctl -n`

`journalctl -n 20`

`journalctl -f`

- Sistemdeki kayıt dosyaları istenmeyen boyutlara ulaşabilir. Bunun kontrol edilip, düzenli olarak yedeklenmeli veya çok zor durumda kalınırsa en eski kayıtlardan başlanaarak silinmelidir. Sistem kayıtlarının ne kadar olduğunu --disk-usage ile görebiliyoruz. Eski sistem kayıtlarını dilerseniz bir boyut belirterek, dilerseniz de zaman belirterek temizleyebilirsiniz.

`journalctl --disk-usage`

`sudo journalctl --vacuum-size=1G`

`sudo journalctl --vacuum-time=1years`

- Bu limitleri `/etc/systemd/journald.conf` içerisinden düzenleyebilirsiniz.


        SystemMaxUse=: Specifies the maximum disk space that can be used by the journal in persistent storage.
        SystemKeepFree=: Specifies the amount of space that the journal should leave free when adding journal entries to persistent storage.
        SystemMaxFileSize=: Controls how large individual journal files can grow to in persistent storage before being rotated.
        RuntimeMaxUse=: Specifies the maximum disk space that can be used in volatile storage (within the /run filesystem).
        RuntimeKeepFree=: Specifies the amount of space to be set aside for other uses when writing data to volatile storage (within the /run filesystem).
        RuntimeMaxFileSize=: Specifies the amount of space that an individual journal file can take up in volatile storage (within the /run filesystem) before being rotated.


https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs