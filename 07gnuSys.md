# 7 Paket Yönetim Sistemi (PFE201 Unite7 P:55)

- Gönüllülük esası ile beraber konunun anlatımına başlanacak, Paket, Depo kavramları anlatılacak.

Bir paket dosyası içinde genellikle, kurulum komutlarıyla birlikte, derlenmiş ikili dosyalar ve yazılımı oluşturan diğer kaynakları içeren bir dosya arşivleridir. Paketler, gereksinimleri, bunlarla beraber yüklemek ve çalıştırmak için gereken diğer paketlerin bir listesi de dahil olmak üzere değerli meta verileri saklar. 

Repo (Repository - Depo), en genel şekilde; kullanıcılar, bilgisayarlar veya yazılımlar hakkında önemli verileri içerisinde barındıran depo dizinleridir. Repository içerisinde çoğunlukla yazılım paketleri ve yazılım paketlerine dair veriler barındırılır.

### 1. Temel Kavramlar (Paket, Depo, Paket Yöneticisi)                           (PFE201 Unite7)

### Gönüllülük Esası
1. Linux Uzayı
Linux uzayı kendi içerisinde belli parçalardan oluşur. Merkezinde Forumlar, mail grupları, sosyal medya, github vb. servisler bulunuyor. Temelde iletişimlerini sağlayan birimler bunlar. Burada kullanıcılar da ken diçerisinde gruplara ayrılmış durumdalar.
i - Kullanıcılar
ii - Geliştiriciler
iii - Alfa Tester
iv - Beta Tester
v- Sosyal medya, Mail Grupları, GitHub

2. Şurada da Repository sunucusu mevcut. 
Suse, RedHat, Cannonical, burada bulunan insanlar, aynı çatı altında olmaları gerekmiyor. RedHat veya SuSe olduğunu kabul ederek devam edelim.
a. Repo
b. Beta Repo
c. Dsitro Builders
d. Yeni Versiyon Distro
e. İletişim ve Koordinasyon'dan sorumlu bir ekip
f. Paketleri Derleyen kişiler var
g. Ön Testle Sorumlu kişi, derlenmiş paketleri test eden kişilerdir

3. Olay şurada başlıyor, rpm -qa dediğimiz zaman karşınıza çıkan paketler, birbirinden bağımsız olarak geliştirilen paketler.

	ii -> f 
        Paket derleyen kişiler bu paketleri geliştiricilerin yazdıkları programları alıyorlar ve derliyorlar. nano.rpm, xwindow.rpm vs vs
        
    f -> g
        ön testle sorumlu kişi bu derlenen paketleri test ediyor, mevcut daha önce çıkmış olan versiyonlarda kontrol ediliyor. Eğer bu testten geçerse beta repoya aktarılıyor.
        
    g -> b
    b -> i
        Beta Repodan indirilen programlar, kullanıcılar beta repolardan indirdikleri programları deneyerek iletişim ve koordinasyon bölümüne geri bildirimde bulunuyorlar. Programda oluşan hataları bildirip bug reportları gönderir.
        
    i -> e
        x prgoramına ait y hatasını alan ve bu programa ait bug olarak alınan geri bildirim  paket derleyicilere gönderiliyor.
        
    e -> f
        Paket derleyiciler bu hatanın nereden olduğunu tespit etmeye çalışıyorlar. Bu hata sistemden mi kaynaklı, yazılımdan mı kaynaklı diye kontrol ediliyor. Yazılımdan kaynaklı olduğun uvarsayarsak bu program yeniden iletişim ve koordinasyon bölümüne bildiriliyor.
        
    f -> ii
        İletişim ve Koordinasyon tarafından bilgilendirmek amacıyla geliştiriciler ile bağlantı kuruluyor. Bu programın bizim sistemimizle kaynaklanan bir sorundan hata çıkarmadığını, programın kaynak koduyla alakalı bir problem olduğunu belirtiyorlar.
        
    ii -> iii
        Feedback'i yani geri bildirimi alan geliştirici, hatayı düzelttikten sonra kendi alfa testerlarına gönderiyor. Alfa testerları düzeltilen programı çeşitli denemeler yaparak kontrol ediyor. Bir sorun çıkarsa 
        
    iii -> ii
        şeklinde git geller yaparak programın hatasız olarak çalıştığına kanaat getirildiği zaman geliştirici grubu bu sefer daha geniş bir kesim olan beta testerlara gönderiyor programı denemeleri için.
        
    iii -> iv
        Bu sürekli iletişim Linux Uzayının merkezindeik forumlar, mail grupları, sosyal medya ve github üzerinden gerçekleştiriliyor.
        
    v -> f
        Paket derleyiciler grubu da bu ortamları sürekli takip ettiği için, programın son durmundan haberdar oluyorlar. Sorun olmadığı bilgisi GitHub üzerinden alan paket derleyiciler yeniden programı alıyor ve paketi yeniden derliyorlar. Ve Ön testle sorumlu kişiye bildiriliyor. Denemeler yapılıyor ve yeni verisyonda bir problem olmadığına kanaat getirilene kadar çalıştırılıyor.
        
    f -> b
        Hatası giderilen paket yeniden Beta Repo'ya aktarılıyor. Uzayın tamamı bunu yeniden deniyor. Ve bu sürekli bir döngü halinde devam ederek ilerliyor.

    *Breakpoint*

    b -> a
        Yazılımın olgunluğa ulaştığında, beta repodan, repo'ya aktarılarak beta repolarını kullanmayan normal kullanıcıların zypper install nano veya apt-get install nano şeklinde yükleyebilecekleri seviyeye gelir. Her bir update yapıldığında bu repolar kontrol edilir eski versiyon ise güncelleme yapılacaktır. Yeni versiyonu olan programların güncelleştirmeleri çıktı diyor ve yükleyim mi diye soruyor. Yükleme aracı repoya bağlanıp tüm güncelleştirmesi olan dosyaları indiriyor ve sistemi güncel bir hale getiriyor.
        
    a -> Linux Uzayı
	Böyle bir ekosistem Gönüllülük esasıyla dönüyor.. Peki tüm bunlar olurken biz ne yapıyoruz ? (Öğreniyoruz, kullanıyoruz, geri bilidrim yapıyoruz.). Bu insanlar bunlraı hiçbir para karşılığı istemeden yapıyor. Her bir program en az 10 kişiden oluşan bir ekiple yapılıyor. Bu konu sadece repo ve kullanıcı arasındaki bağlantıyı oluşturuyor.
    
    a -> c
    Beta repolardan ana repoya geçen ve bu güncellenen programların sayısı çıkan dağıtımın içerisinde bulunan programlardan çoğu güncellendiyse Distro Builders güncellenen paketleri alıyor ve yeni bir iso haline geitrip güncel sürümün bir üst sürümünü çıkartarak
    
    c -> d
    Yeni sürüm oluşturuyor. Debian 9.2 iken Debian 9.3 ortaya çıkıyor ve artık bu iso indirilmeye başlanıyor.


Windows'da tüm paket bağımlılıklarını sizin indirmeniz gerekiyor. Paket Yöneticileri programı paket bağımlılıkları ile beraber kurup güncellemesini yapıyor GNU/Linux işletim sistemlerinde.

### 2. Dağıtımların Paket Yöneticileri ve Araçları (apt/deb, yum/rpm, pacman,    zypper/rpm, vs.)

- Silme, bileşen sorgulama, hangi paketin, ayar dosyaları, bağımlılıkları neler, sistemdeki kurulu paketler, kurulu paket hakkında bilgi alma 


### 3. Temel İşlemler (kurma, kaldırma, güncelleme, arama, detaylı paket inceleme, vs.)
`ldd /bin/bash`
Yüklü bir uygulamanın paket bağımlılıklarını gösterme.

### 4. Yükseltme, Eski Sürüme İndirme (downgrade) ve Otomatik Güncelleme

`apt-cache showpkg <package-name>`

Nano'nun 2.3 versiyonu varmış mesela,

`apt-get install <package-name>=<package-version-number>`
veya
`apt-get -t=<target-release> install <package-name>`

şeklinde yüklenebilir.

Programı güncellemeden korumak için ise

`apt-mark hold <package-name>`

Otomatik güncellemeler için ise debian türevi sistemlerde aşağıdaki site kontrol edilebilir.
https://wiki.debian.org/UnattendedUpgrades

Suse üzerinde yani rpm için de aşağıdaki site kontrol edilebilir.
https://www.suse.com/documentation/sled11/book_sle_admin/data/sec_onlineupdate_you_automatically.html

### 5. Benzer Sistemler (maven, composer, rvm, pip, nuget, vs.)
- Maven, öncelikle Java projeleri için kullanılan bir yapı otomasyon aracıdır. Maven, bina yazılımının iki yönünü ele alıyor: ilk önce yazılımın nasıl inşa edildiğini, ikincisi ise bağımlılıklarını düzenliyor. Maven (Apache) proje geliştirirken proje içerisinde bir standart oluşturmamızı, geliştirme sürecini basitleştirmemizi, dokümantasyonumuzu etkili bir şekilde oluşturmamızı, projemizdeki kütüphane bağımlılığını ve IDE bağımlılığını ortadan kaldırmamızı sağlayan bir araçtır.

- Composer PHP için bağımlılık yönetim aracıdır. Projenizin ihtiyaç duyduğu kütüphaneleri tanımlamanızı ve sizin için kurmasını ve güncellemesini sağlar. Laravel gibi bir çok Framework'un kurulumununda sizlere yardımcı olan güzel bir bağılmılık yönetim aracıdır.

- RVM, Ruby on Rails, günümüzde yazılımcılar arasında çok popüler olan Ruby dilinde yazılmış bir uygulama geliştirme çatısıdır. Web uygulamaları için ihtiyaç duyulan tüm bileşenleri içinde barındırır.

- pip: Python programlama dilinde uygulama geliştirirken, python geliştiricileri tarafından hazırlanmış paketlere erişme imkanı sağlanmaktadır. Diğer geliştiricilerin hazırladığı python paketlerini yüklemek için ortak bir yükleyici sunulmuştur. Python ortamında bu yükleyici “pip” olarak anılmaktadır. Pip ismi rekürsif bir akronimdir ve açılımı “Pip installs packages” yada “Pip installs Python” olarak ifade edilmiştir. Üçüncü parti python paketlerinin kurulması için kullanılan bir script’dir. PyPI paketlerini kurmamıza, güncellememize ya da kaldırmamıza yarar.

### 6. Önbellek (cache, yerel indeks) Yönetimi

- Siz bir programı `apt-get install paketAdi` diyerek kurduğunuz zaman apt aracı sizin için o programın ait olduğu repo'ya bağlanarak paket dosyasını bilgisayarınıza indirir. Daha sonra yine aynı araç sizin için bu indirdiği paketi dpkg paket yönetim sistemini kullanarak sisteminize kurulumunu yapar, bir yandan da bu uygulamaya ait olan paket bağımlılıklarını indirir.

- Daha sonra herhangi bir paketi kaldırdığınız zaman, apt bu dosyaların kurulumlarını veya daha önce yapılan upgrade işleminde kurulum yapılmış olan paket dosyalarını /var/cache/apt/archives dizini içerisinde tutuyor. Arşivlenmiş ve daha sonra olası bir kurulum için yeniden indirmesine gerek kalmaması için.

`apt-get clean`

- Yukarıdaki komutu kullanarak, bu bölgedeki dosyaların kapladığı alanı zaman zaman kontrol edip temizleyebilirsiniz.

- Kurulumunu yaptığınız dosyaların tüm konfigürasyon dosyalarıyla beraber beraber kaldırmak için ise `apt-get purge paketAdi` şeklinde kullanabilirsiniz.

- Bir update işlemi gerçekleştirdiğinizde, sistem üzerindeki yüklü olan paket yönetim sistemi, kendi veri tabanı üzerinde kurulu olan paketlerin versiyon numarasını, paket depolarındaki versiyon numaraları ile karşılaştırır. Eğer bir günceleme var ise bu paketi indirir ve kurar. Böylelikle veri tabanınıda güncellemiş olur, bir sonraki update işlemi için hazır hale getirilir.
                               
### 7. DEB/APT - YUM/RPM  farklılıkları                                         (PFE201 Unite7)

### 8. Yeni Paket Depolarının Eklenmesi

- Sistem üzerinde hangi dağıtımı kullanıyorsanız, o dağıtımın onayladığı paket depoları ile çalışırsınız. Bir update yaptığınız zaman Debian sistemlerde olduğumuzu varsayarak konuşursak /etc/apt/sources.list içerisindeki paket depoları üzerinden güncellemeleri kontrol edip, buradaki paketler ile ilgili işlemler gerçekleştirirsiniz.

- Tabi internet üzerinde birden fazla depo bulunabilir ve sizde bu depolara ulaşıp içerisindeki dağıtımları kurabilirsiniz. Bunun için Debian sistemlerde apt aracının bir özelliği karşımıza çıkmaktadır. Örnek olarak libreoffice'in paket deposunu sistemimize ekleyelim.

`sudo add-apt-repository ppa:libreoffice/ppa`

- Yukarıdaki komutu koştuğumuz zaman sistem bu paket deposunu, bir sonraki update işleminde programların güncel versiyonlarını karşılaştırmak için buraya da bakmak için gezecektir.

`apt-add-repository 'deb http://archive.getdeb.net/ubuntu wily-getdeb games'`

- Farklı olarak bu şekilde de ekleme yapılabilirsiniz. Bu yöntemle direk /etc/apt/sources.list içerisine ekleme yapmış oluyorsunuz. Bir paket deposu eklemek için yukarıda bahsettiğim gibi /etc/apt/sources.list içerisine manuel olarak da ekleme yapabilirsiniz. Aynı zamanda eklenilen paket depolarını /etc/apt/sources.list.d/ altından görebilir ve silebilirsiniz.

- Bir paket deposuna bağlandığınız zaman o paket deposu ile aranızda anahtar alışverişi yaparsınız. Aradaki bağlantınızın güvenliği için dosyalar gönderilirken şifrelenir, iki taraftada anahtarlar bulundurulur. Bu anahtarlar sayesinde aldığınız her update yaptığınz depo sunucusu tekrar tekrar bu anahtarları sormaz. Güvenliğinden şüphe edilen depolarda apt aracı bizi uyarır ve bu deponun güvenli olmadığını, herhangi bir anahtara sahip olmadığını bize bildirir. Bu depolara bağlanıp alış veriş yapmamız tamamen bize bağlıdır.

- Sistemde kayıtlı olan anahatları görmek için 

`apt-key list`

- Sistemde kayıtlı olan anahtarı silmek için ise o anahyarın numarası ile beraber silinir.

`apt-key del 73C62A1B`

- Şeklinde örneklenebilir.


### 9. Bir Depodaki Belli Paketlerin Kullanılma(ma)sı ve Güncellenmemesi (exclude)
- Belli paketlerin gücenlenmemesi ile ilgili yukarıda örnek vermiştik. Şimdi burada da RedHat ile ilgili bir örnek sunalım.

`yum update --exclude=PACKAGENAME`

- Yukarıdaki komut ile beraber belirli bir paketi güncellemeyi durdururabilir, bizim sistemimizde yüklü değilse bunun yüklenmesini engelleyebiliriz. Aynı şekilde yukarıda da bahsettiğimiz güncellenmeyi engelleme debian sistemlerde, yüknmesini de engellemektedir.

`yum update --exclude=kernel*`

- Örneği ise tüm kernel verisyonlarının güncellenmesini engellemektedir.

### 10. Paket Yöneticileri ve Ayar Dosyaları
- Bir çok paket kendi içerisinde ayar dosyaları ile beraber gelmektedir. Tüm ayarlar hazır bir şekilde kullanmaya başlıyoruz ama bazı durumlarda bu ayar dosyalarını kendi isteğimize göre değiştirebiliyoruz. Bu durumlarda eski haline getirlebilmemiz için paket yönetim sistemleri bizim için yardımcı oluyor. Yeniden konfigürasyon dosyalarını eski haline getirebilmemize yardımcı oluyorlar. 

- Debian sistemler için

`dpkg-reconfigure paketAdı`

- Bizim için bu görevi görüyor. Aynı zamanda phpmyadmin kurulumunda göreceğiniz gibi krşınıza bir dialog, readline, Gnome, KDE edtör veya herhangi bir interaktif şekilde kullanmak istediğinizi belirmek isterseniz de -f parametresi bize kolaylık sağlıyor.

`dpkg-reconfigure -f readline phpmyadmin`

- CentOs için böyle bir durum malesef bulunmakata. OpenSuSe için böyle bir seçenek mevcutmu siz araştırabilirsiniz.


### 11. Paket Yönetimi Geçmişi Yönetimi ve İşlem Geri Alma
- Pekii ben ne yükledim, nerelerden neler aldım acaba ? diye bir düşünceye sahipsek ne yapacağız. Bir sistem yöneticisinin en çok zamanını geçirdiği yerlerden birine bakmamız gerkeiyor.

- `/var/log/apt/` dizini içerisinde history.log adındaki dosya size kimin ne zaman ne yüklediğini göstermektedir.

-`rpm -q <package name> --last` veya `rpm -qa --last` şeklinde tüm paketler rpm paket yönetim sisteminde görülebilir. Aynı zamanda yine log dosyaları incelenebilir.

- Yapılan bir işlemi geri nasıl alacağız peki ? Bunun için biraz araştırma yapmamız gerekiyor. Direk olarak böyle bir komut var mı bilmiyorum. Ancak bulduğum ve denemediğim bir komut mevcut.

https://unix.stackexchange.com/questions/79050/can-i-rollback-an-apt-get-upgrade-if-something-goes-wrong


### 12. Paket Yöneticisi Kullanılarak Bir Programın Kaynak Kodunun İndirilmesi  
`apt-get source paketAdi`
- Bununla ilgili uzun bir dökman mevcut. İnceleyebilirsiniz meraklılarına.
https://askubuntu.com/questions/28372/how-do-i-get-and-modify-the-source-code-of-packages-installed-through-apt-get

- RPM içinde farklı bir durum mevcut. Öncelile yum-utils yüklemeniz gerekiyor CentOS sistemlerde. Daha sonrada aşağıdaki şekilde kullanabilirsiniz.

`yumdownloader --source paketAdi`

### 13. Delta kavramı  