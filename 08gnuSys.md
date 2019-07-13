# 8 Sistem Kayıtları

### 1. Log Kavramı (PFE201 Unite9 P:75..84)

- UNIX sistemleri ve üzerlerinde çalışan süreçler durum raporu, uyarı ve hata iletilerini sistem kayıt sunucusuna gönderirler. Sistem kayıt sunucusu, kendisine gelen sistem günlüğüne ekleme
istemlerini alarak günlük dosyasına ekler. Sistem yöneticisi hata ve durum takibini sistem günlüğü dosyalarından yararlanarak yapar. Sistem kayıtlarının tutulabilmesi için “syslogd” sürecinin çalışıyor olması gerekmektedir. Sistem günlüğüne eklenen kayıtlar hizmet türü ve hizmet önceliği bilgileri
ile eklenir.

- ###### 1.1 syslog, rsyslog (PFE201 Unite9)

### 2. /var/log İncelemesi (PFE201 Unite9)
    - örnekler/08gnuSys-tail.md

### 3. logger Aracının Kullanımı, İncelenmesi

### 4. systemd-journald Kullanımı, Farkları (PFE201 Unite3)