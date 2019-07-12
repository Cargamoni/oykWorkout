# 5 Süreçler ve Servisler

### 1. Süreç Kavramı (PFE101 Unite10 P:74)
- Süreç nedir, koşar mı koşmaz mı, nedreden çıkıyor bu süreçler. Programın başlangıcı ve bitişi arasında geçen zamana süreç denir. Kısacası bir programın koşma aralığıdır. Her programın bir PID'si vardır.

### 2. Süreç Durumlarının Açıklaması (PFE101 Unite10 P:75)
- Süreçlerin durumları mevcuttur. Bunlar R T P D I Z W N < > harfleriyle belirtilirler. Ps çıktısında buna örnek verilebilir.

*Bu harflerin anlamları.*
	
    R: Süreç işliyor.
    T: Süreç durmuş durumda.
    P: Süreç diske bir bilgi yüklemeyi bekliyor
    D: Süreç diskten bilgi yüklenmesini bekliyor
    I: Süreç 20 saniyeden daha uzun sürüyor
    Z: Süreç sonlandı süreç ölmedi (Zombie Defunct)
    W: Süreç diske aktarıldı (Swapped Out)
    >: Süreç kendisine verilen bellek limitini aşmış
    N: Süreç düşük öncelikle işletiliyor
    <: Süreç yüksek öncelikle işletiliyor
    

### 3. Süreçlerin Yönetimi (öldürme, durdurma, jobs, fg-bg, vs.) (PFE101 Unite10 P:79)

- ##### 3.1 ps, top, htop Çıktılarının İncelenmesi (PFE101 Unite10 P:76)
- ##### 3.2 Sinyaller (PFE101 Unite14 P:76)

### 4. Servis Kavramı (PFE101 Unite14 P:112 - PFE201 Unite02)

- Biraz ağır bir konu ancak değinilmesi gerekiyor. Servislerin çalışma düzeyleri önemli. init süreci , init ile süreç durdurma servis kontrolü. service ve systemd

### 5. Systemd ve SysV sistemleri (PFE101 Unite14 P:112 - PFE201 Unite 03)

- Systemd nedir nasıl çalışır, sevice ile farkları, kazanımları neler biraz değinmek gerekiyor. Temel olarak eski init sistemini replace etmeyi amaçlayan ve geliştiricileri tarafından “basic building block” olarak nitelendirilen systemd, init sisteminin yetersiz kaldığı paralelizm, on-demand aktivasyon vs. gibi bir çok yeni özellik barındıran bir sistem ve servis manager’dır veSystemV init scriptileri uyumlu olarak çalışabilmekte, dolayısı ile eski tip init scriptlerinizi de kullanmanıza olanak sağlamakadır. 

- Tüm servislerin listelenmesi
`systemctl list-units --type service`