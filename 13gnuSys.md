### 13 Güvenli Uzaktan Erişim

1. SSH'a Giriş

  -  Secure Shell'in kısaltılmış halidir. Aynı veya farklı bir ağdaki bilgisayara
  güvenli bağlantı için kullanılır. Telnet'in güvenli halidir. Öncelerde Telnet
  ve Rlogin gibi uygulamalar bilgisayarlar arasındaki aynı veya farklı bilgisayarlar
  arasında veya ağ cihazlarına bağlanırken, güvensi bağlantı kuruyor bağlantı
  bilgilerini şifrelemeden gönderip alıyordu bu da güvenlik zaafiyetine sebebiyet
  veriyordu. Bunun üzerine SSH geliştirildi. SSH aradaki bağlantıyı şifreli hale
  getiriyor. Varsayılan Port numarası olarak 22 kullanıyor. Dilerseniz değiştire
  biliyorsunuz.

  - SSH için sunucu tarafında çalışan bir uygulama ve bu sunucuya bağlayacak bir
  client uygulaması gerekiyor. Bir tarafta hizmet olması diğer tarafta da hizmet
  alana bir client olması gerekiyor.

  - SSH ismi aslında kullandığınız client'ın ismi, SSH komutunu, programını
  kullanarak SSH sunucularına bağlantı sağlayabiliyorsunuz. Karşı tarafta
  sunucu tarafında geçen isim SSH Deamon olarak geçiyor, en popüler olanı da
  OpenSSH hem sunucu hem client versiyonudur. Servisin adı da sshd olarak
  geçiyor.

  - Man SSH ile bir çok parametreyi görebilirsiniz.

  - Windows olan bilgisayarlar için de bir çok SSH client uygulaması mevcut Putty
  Mobaxterm gibi. Bunlarla SSH sunucunuza bağlanabiliyorsunuz.

  - Sunucuya bağlanmak için birkaç tane bilgiye ihtiyacınız var sunucunun ismi veya
  ip numarası, kullanıcı adı ve parola. Eğer herhangi bir kullanıcı adı kısmını
  yazmazsanız o an işaretli makinada hangi kullanıcı ile hesap açtıysanız o Kullanıcı
  ile bağlanmaya çalışır.

  - -p parametresi ile farklı bir port numarasından hizmet veren SSH sunucusuna
  bağlantı yapılabilmektedir.

  - Netstat Parameterleri
    -n ip isim dönüşümünü engeller
    -t sadece tcp ile ilgili bilgi verir
    -l detaylı bilgilendirme yapar
    -p sadece portlar hakkında bilgi verir

  - Bağlantıda Sorun Yaşıyorsanız Firewall engelliyor olabilir. Güvenlik duvarlarının
  da servisleri vardır çoğunluğu iptables kullanır ancak yeni nesil güvenlik
  duvarı uygulaması firewalld olarak geçer bunu kontrol edebilirsiniz.



 * 13.1.1 Doğrulama yöntemleri (parola, anahtar, vs.)

    - SSH ile farklı doğrulama yöntemleri ile oturum açabiliyorsunuz, ya direk
    kullanıcının parolası ile okturum açabilirsiniz ya da öntanımlı anahtarınızı
    SSH sunucunuza tanımlayarak parola gereksinimi olmadan bağlantı yapabiliyor-
    sunuz.


 * 13.1.2 Şifreleme yöntemleri (simetrik - asimetrik)
    - Anahtar setlerinin üretimi ssh-keygen ile yapılmaktadır. Herhangi bir
    kullanıcı belirtmezseniz, o kullanıcı için oluşturur. Oluşturma işlemi
    yaparken dosyanın oluşturulacağı yer ve parola isteyebilir, buradaki
    parola kullanıcı parolanız değil anahtara verdiğiniz parola passpharese olarak
    isimlendiriliyor.

    - Simetrik Şifreleme  (DES - AES - Blowfish)

        Bu algoritmada şifreleme ve şifre çözmek için bir tane gizli anahtar
      kullanılmaktadır. Kullanılan anahtar başkalarından gizlidir ve şifreleme
      yapan ile şifrelemeyi çözecek kişilerde arasında anlaşılmış ortak bir
      anahtardır. Gönderilecek gizli metinle beraber üstünde anlaşılmış olan
       gizli anahtar da alıcıya gönderilir ve şifre çözme işlemi gerçekleştirilir.

         Simetrik şifrelemenin en önemli avantajlarından birisi oldukça hızlı olmasıdır.
      Asimetrik şifrelemeyle karşılaştırıldığında hız konusunda simetrik algoritmalar
      çok daha başarılıdır. Bununla birlikte simetrik algoritmayı içerdiği basit
      işlemlerden dolayı elektronik cihazlarda uygulamak çok daha kolaydır. Ayrıca
      simetrik algoritmalarda kullanılan anahtarın boyu ve dolayısıyla bit sayısı
      çok daha küçüktür.  

    - Asimetrik Şifreleme (DH - Diffie Hallman / RSA - Rivest Shamir Adleman)

        Siz açık anahtarınızı herkezle paylaşıyorsunuz, gizli anahtarınızı paylaşmıyorsunuz
      herhangi bir bağlantı, mesaj veya şifreleme yaptığınıızda, bunu şifrelerken
      kendi gizli anahtarınızı kullanıyorsunuz, o şekilde şifreleyip yolluyorsunuz. Bu
      şifrelenmiş dosyanızı karşı taraf genel anahtarınızla açıyorsunuz. SSH bağlantınıızda
      da bu şekilde yapabiliyorsunuz, SSH anahtarlarında açık anahtar id_rsa.pub dosyasında
      bulunuyor özel anahtarıınız da id_rsa içerisinde bulunuyor. Genel anahtarı herkez
      özel anahtarı ise sadece sabi okuyabilmelidir.
        RSA, uygulamayı geliştiren isimlerin baş harfleri (Rivest-Shamir-Adleman), DSA ise
      bir başka şifreleme algoritması ama o kadar çok kullanılmıyor artık, çözülebildiği için.

        Simetrik şifreleme algoritmalarında  bulunan en büyük problem anahtar dağıtımıdır.
      Simetrik algoritma kullanan çok kullanıcılı bir sistemde anahtarın bütün
      kullanıcılara aynı anahtarın dağıtılması güvenlik açısından problemli olabilir.
      Her kullanıcıya farklı bir anahtar vermek ise sistemde bir çok farklı anahtar
      olacağı için sıkıntılı olabilir. Bu sorunları çözüm getirmek için asimetrik şifreleme
      algoritmaları geliştirilmiştir. Asimetrik şifreleme algoritmalarında anahtar ile
      şifre çözme anahtarı birbirinden farklıdır. Şifreleme yapan anahtara açık anahtar,
      şifreyi çözen anahtar ise özel anahtardır. Açık anahtarlar herkese dağıtılabilir,
      ancak hangi anahtarın kime ait olduğundan da emin olunmalıdır. Bu yüzden sertifikalar
      kullanılmaktadır. Sertifika açık anahtar ile sahibinin kimliği arasındaki bağlantının
      belgesidir. Özel anahtar ise sadece şifreyi çözecek kullanıcıda bulunur, açık anahtar
      ise gizli değildir.  Bu yüzden asimetrik şifreleme güvenlik açısından simetriğe göre
      çok daha başarılıdır. Az sayıda anahtar kullanarak simetrik şifreleme yapan çok
      kullanıcılı uygulamalarda ortaya çıkabilecek anahtar fazlalığı durumunu engeller.  
      Bununla birlikte hız ve donanımsal uygunluk gibi konularda asimetrik şifreleme
      simetriğe göre geri planda kalmıştır. Asimetrik algoritmaların güvenliğini
      sağlayabilmek için çok büyük asal sayılar kullanılmaktadır. Bu da zaman açısından
      çok büyük problemler getirmektedir.

    - İlk bağlanırken size bağlanmak istiyormusnuz diye sorduğunda yes/no diye cevap verdiğiniz
    bölümde yes dedikten sonra sunucu tarfından gönderilen fingerprint diye adlandırılan
    sunucunun public anahtarı, tekrar tekrar sorulmaması için siz bağlandıktan sonra
    known_hosts dosyası içerisinde saklanıyor (Client üzerinde tutulur). Bilgisayarın,
    Adı, ipsi, hangi şifreleme yönteminin kullanıldığı ve genel anahtarı.

* 13.2 sshd servisi ve ayarları

    - Root kullanıcısına bağlanma hakkı vermeyebilirsiniz. Her serviste olduğu
    gibi SSH servisinde de kullanıcıya özel ayarlar yapabiliyorsunuz. Genel
    ayarlar /etc/ssh altında bulunuyor. Buraya gittiğinizde bir çok ayar
    dosyasını görebilirsiniz.

    - /etc/ssh klasörünü incelediğimizde ssh_config ve sshd_config diye iki
    birbirine çok yakın dosya isminde ayar görebilirsiniz. Bunların ayrımı sshd_config
    server ayarlarını barındırırken, ssh_config client ayarlarını barındırmaktadır.    

    - sshd_config'i açıp baktığımızda, bir çok ayarın üstünde aslında ne işe
    yaradığını bir üst satırında yazıyor. Bunlardan en önemlileri, hangi porttan
    hizmet vereceği yani "Port 22", anahtar ile bağlantı için "HostKey" tanımları
    önemli. Client'ın bağlantı için bir anahtarı olduğu gibi sunucunun da
    kendi bölümünde anahtarı olması gerekiyor. Dizinde gördüğünüz dosyalar ise
    sunucuya ait anahtar bilgilerini temsil ediyor, bağlantı yapıldığında sorulan
    soruya verdiğini yanıta göre host tarafında tanımlı olan kısa karakteri
    client bilgisayara da tanıtıyor.

    - PermitRootLogin kısmı önemli, root kullanıcısının işlem yapamamasını,
    bağlanamamasını sağlıyor, parametreleri yes, no veya force-command-only.
    Force command only zorla bağlanmasını sağlıyor, yani sudo haklarıyla
    komut gönderirseniz, sudo haklarına sahip bir kullanıcıysanız sadece
    onlar bu force isteğini gönderebiliyor.

    - Önemli kısımlardan biri de AuthorizedKeysFile bağlanırken parola sormaması
    ve bağlanan kişiye ait geçerli anahtarların tutulduğu dosya lokasyonunu
    belirlemizi sağlıyor. Bu dosyanın içeriğine de bakacağız.

    - PasswordAuthentication, sunucuya sadece anahtarlarla bağlanabilmesini
    sağlamak istiyorsanız, parola ile bağlanamyı engellemek istiyorsanız bu
    özelliği kullanabilirsiniz.

    - X11Forwarding, terminal de kursanız her hangi bir sunucu üzerinde Xwindow
    olabilir, grafik arayüzünde çalışan uygulamalar olabilir, siz ssh'la
    bağlandığınız zaman arka tarafta açılan grafik arayüzü görebilmeniz için
    gerekli parametreyi kullanabilmenizi sağlar.

    - Diğer ayarların çoğu, genellikle sıkılaştırma ve kullanılan algoritma
    ile ilgili ayarlar.

* 13.3 Parolasız güvenli erişim

    - sshd_config authorized_keys dosyasına bakıyor demiştik, bu da her kullanıcısının
    .shh dizininin içerisinde bulunmaktadır. Dizinin içerisinde herhangi bir
    anahtar bulunmuyor ise veya authorized_keys dosyası da yok ise, hali hazırda
    client olarak public ve private anahtar oluşturulmamış demektir.

    - ssh-keygen ile kendinize sunucu tarafına parolasız bağlantı yapmanızı
    sağlayacak anahtarlarınızı üretebilirsiniz.

    - touch ile authorized_keys dosyası oluşturup chmod komutu ile kullanıcısına
    sadece okuma ve yazma yetkilerini verdikten sonra içerisine yazdığınız
    bağlanacağınız bilgisayarın public key'i ile parola kullanmadan sunucunuza
    bağlanabilirsiniz. (Bağlanacağınız kullanıcınn .ssh dosyasına eklemeniz gerekir)

* 13.4 ssh uzaktan komut çalıştırma

    - SSH bağlantısı yapmadan sadece bir komut çalıştırmak istiyorsanız, bu
    herhangi bir dosyanın yedek alınması, taşınması veya başka bir işlem olabilir,
    veya çalıştırılması gereken bir script vardır ve bunun çalıştırılması işlemi
    olabilir bunlar için kullanılmaktadır. Aşağıdaki şekilde kullandığınızda
    karşı tarafa bir komut gönderip bunu çalıştırmış sayılmaktasınız.

      - ssh kullaniciadi@ipadresi komut
      - ssh kullaniciadi@ipadresi 'komut'
      - ssh cargamoni@192.168.1.29 ls -l
      - ssh cargamoni@192.168.1.29 'date >> /home/cargamoni/tarih'
      - ssh cargamoni@192.168.1.29 'cd /home/cargamoni/ && ./deneme.sh'

* 13.5 scp ile dosyaların güvenli bir şekilde kopyalanması

    - SSH bağlantısı sayesinde güvenli bir şekilde bir bilgisayardan başka bir
    bilgisayara dosya gönderme işlemi yapabiliyorsunuz. Paketlerinizi güvenli bir
    şekilde göndermek için scp komutu kullanılabilir, hedef bilgisayara hem
    dosya gönderebilir hem de dosya alabilirsiniz.

    - Hedef bilgisayardaki bir dosyayı almak için scp komutundan sonra
    hedef bilgisayardaki dosyanın konum bilgisi ve dosyanın adı ile beraber
    kendi bilgisayarınızda nereye kaydetmek istiyorsanız oranın lokasyonunu
    vermeniz yeterlidir.

      - scp kullaniciad@ipadresi:/alinacak/dosyanin/konumu /kaydedilecek/dosyanin/konumu
      - scp cargamoni@192.168.1.29:/home/cargamoni/denemeShTest /c/Users/Cargamoni
denemeShTest

    - Hedef bilgisayara bir dosyayı göndermek için scp komutundan sonra
    gönderilecek dosyanın adı gerekliyse lokasyonuyla beraber girildikten sonra
    hedef bilgisayarda nereye kaydetmek istediğinizin bilgisini vermeniz yeterlidir.

      - scp gönderilecekDosya kullaniciAdi@ipadresi:/dosyanin/gönderilecegi/konum
      - scp hostTestFile cargamoni@192.168.1.29:/home/cargamoni/

* 13.6 sftp ile güvenli FTP benzeri dosya aktarma erişimi

    - SFTP ile güvenli bir ftp bağlantısı yapabilmekteyiz. Bağlantıyı yaparken
    sftp komutu ile yaparak aynı ssh bağlantısı yapar gibi bağlanacağımız
    sunucunun bilgilerine sahip olmamız gerekmetedir. Bağlantı kurulduktan
    sonra artık sftp promptuna geçiş yapılır ve sadece sftp komutları
    kullanılabilir, help komutu ile neler yapabileceğinize bakabilirsiniz.

* 13.7 ssh ile SOCKS vekil (proxy) sunucu
    - https://ceaksan.com/en/vekil-sunucu-guvenli-internet-ssh-tunnel/

* 13.8 ssh ile tünelleme ve ters tünelleme

    - Mesela bir ağ sunucusu üzerinde çalışan bir web sayfanız var 80 portuna
    bağlı hizmet veriyor, ancak sadece o makinanın 80 portuna bağlı hizmet
    vermektedir, siz buradan herhangi bir şekilde ulaşma şansınızı yoksa
    ssh bağlantısı ile dinamik forward işlemi yaptığınız zaman bağlandığınız
    makine üzerinde bir port açıyor örnek olarak 64100, siz firefox'a gidip
    proxy ayarlarında kendi makinanızın ipsi ve port ayarlarına 64100 girdiğiniz
    zaman ssh bağlantısıı yaptığııınızı makine üzerinden internete çıkarak
    bağlantınızı yapabilirsiniz.

    -  Bir ssh bağlantısı ile A Sunucusuna sağladığım zaman özel bir tünel
    açılıyor ve bu tülen bağlantısıınıın 64100 üzerinden client üzerinde
    kullanılabilir durumda olur, her paket 64100 portu üzerinden gönderilsin,
    ve bu ikinci bir Server B olsun ancak bu sunucuya benim erişimin olmadığını
    ancak A sunucusunun erişiminin olduğunu varsayalım. Server A'yı kullanılarak
    tünel aracılığıyla Server B'ye bağlantı yapabiliriz, bağlantı yaparken yine
    ssh komutunu kullanıyoruz ancak hangi port üzerinden çıkması gerektiğini -L
    parametresi ile belirtiyoruz, bu şekilde bir ssh bağlantısı açabiliyoruz.

      - ssh -L kullaniciAdi@ServerA 6100:SunucuB:22

    - Bu tünel çift taraflı olduğu için giriş yapılan taraftan geri dönüş de
    sağlanılabilmektedir, bu işleme de reverse tunneling yani ters tünelleme
    denilmektedir, bağlandığımız B sunucusu üzerinden ters tünelleme yapmak için
    ise -R komutunu kullanmaktayız.

      - ssh -R 6100:localhost:22 kullaniciAdi@Client

    > Anlatma <
    Bunun yapılabilmesi için bu şekilde bir yönlendirme yapmanız gerekiyor,
    arkada çalışan ssh komutuna parametrelerini verip forwardlama işlemini
    yani yönlendirme işlemini yaptırıyor, yerel makinanızdaki herhangi bir yere
    anlamına gelen 0.0.0.0 adresini karşı taraftaki 64100 portuna eşliyor,
    hangi porta ve hangi özel anahtar ile bağlanacaksak onu belirtiyoruz

    SSH Tunnel in 3 farklı tipi bulunuyor, bunlar;

    • Yerel port yönlendirme (Local port forwarding):

    - ssh -L 9001:domain.com:80 sshServerIP

      Bağlı bulunduğunuz ağdan domain.com adresine erişiminiz yoksa, bu adrese
    erişimi olan bir SSH sunucu üzerinden erişim sağlanabilir. Yukarıdaki örnekte
    sshServerIP sunucusuna kurduğum SSH bağlantısı üzerinden domain.com‘a 80. port
    üzerinden tünel açtık. Bu komutu çalıştırdıktan sonra tarayıcınıza http://localhost:9001
    yazdığınızda domain.com yüklenecektir. https protokolü için de aynı yöntem
    uygulanabilir.

    • Uzak port yönlendirme (Remote port forwarding | Reverse Tunnelling):

    - ssh -R 9001:localhost:80 sshServerIP

      NAT veya firewall arkasından dış dünyaya bulunduğunuz ağdaki veya kendi
    makinenizden hizmet sağlanabilir. Dış dünyadaki gerçek IP adresine (sunucu)
    istek gönderenler tünelin ucundaki makine ile konuşabilirler. Yukarıdaki
    örnekte güvenli ağ arkasındaki makineden sshServerIP sunucusunun 80. portuna
    ters tünel açtık. Kurulan bu bağlantı ile dış dünyada bulunan sunucumuza
    tarayıcı ile ulaşanlar, güvenlikli bölgedeki makinemizin üzerinde çalışan
    web sunucudan hizmet alabilecekler.

    Yukarıdaki örneği biraz değiştirerek iş yerinizdeki intranet sayfalarına
    evden erişim sağlanabilir. VPN erişimi alınamadığı durumlarda zorlukları
    aşmada kuvvetli bir alternatif olacaktır.

    • Dinamik port yönlendirme (Dynamic port forwarding):

    - ssh -D 9001 sshServerIP

      En çok işimize yarayacak bağlantı tipi dinamik port yönlendirmedir. Yerel
    makinede açılan bir soket uzak makine üzerinden tüm hedeflere ulaştırılır.
    Yerel soket üzerinden SOCKS proxy protokolü kullanılarak bağlantı karşı tarafa
    ulaştırılır. Özetle uzak makinenin İnternet erişimi kullanılabilir. Yerel
    makinede tarayıcıya SOCKS proxy ayarlarının girilmesi gerekir. Firefox kendi
    bağlantı ayarlarını içsel olarak kullandığından bu iş için kolaylık sağlar.
    Ayrıca tarayıcılar için proxy uzantıları kullanılabilir. Veya yerel makinenin
    tüm trafiğinin proxy üzerinden geçirilmesi tercih edilebilir.

      Firefox ağ ayarlarından SOCKS proxy tanımlandığında DNS sorguları bu proxy
    üzerinden geçirilmez. DNS sorgularının da tünelden geçmesi için adres satırına
    “about:config” yazıp, “network.proxy.socks_remote_dns” true olarak
    ayarlanmalıdır.

      ssh komutuna -N parametresi eklenerek uzaktaki sunucuda başka hiçbir komut
    çalıştırmadan sadece port yönlendirmesi yapılabilir.

* 13.9 ssh-agent ile anahtar taşıma

    - ssh-copy-id kullanıcıadı@idadresi / Karşı tarafa, ssh bağlantısı yapacağımız
  bilgisayara, public anahtarımızı göndereceğimiz komut ile bağlantıyı yaparken
  ilk sefer yaptığınızda karşı taraf parolayla bağlanmaya izin veriyorsa parola
  bilgisini soracak sonrasında authorized_keys dosyasına sizin genel anahtarınızı
  eklemektedir.

* 13.10 ssh ile X11 tünelleme

    - ssh -X komutu ile X11 bağlantısını sağlayabiliyorsunuz, gerekli ayar yes
    ile tanımlandığı zaman ve sunucuda bir grafik arayüzü mevcut ise bu
    bağlantı yapılabilmektedir.

* 13.11 ssh istemcisinin ~/.config dosyasının yapılandırılması

    - SSH Client ile ilgili genel ayarlar, ssh_config dosyası içinde yer alıyor,
  birden fazla sunucuya bağlanıyorsunuzdur, birden fazla sunucu ile etkileşim
  halinde olabilirsiniz, tüm bu ayarlamaları bu dosya içinde yapabilirsiniz. client
  ile bağlanırken hangi ayarların kullanılacağı bu dosya içinde yapılıyor, bağlantı
  yapılacağı zaman sıkıştırma yapılması gerekiyor mu (-C ile yapılıp gönderilen
  veya alınan verinin az yer kaplaması için kullanılmaktadır.), sıkıştıırmanın
  seviyesi ne olacak ayarları yapılabiliyor. Yönlendirme yapacak mı, aradaki sunucu mu
  değil mi onların tanımları burada olabilir.

    - ForwardX1Trusted yes  ile tünelleme yapacaksanız yani bir sunucuyu Kullanılarak
    diğer bir sunucuya ssh bağlantısı yapacaksanız bunun yes olması gerekmektedir.
    Aynı şekilde sunucu tarafında da bunun açık olması gerekmektedir.

  **Herşey iyi güzel peki bu bağlantı nasıl işliyor neler dönüyor arka planda ?

    - Öncelikle ssh ile bağlanmak istediğiniz sunucuya önce bir istek gönderiliyor
    yukarıda belirttiğimiz gibi fingerprint bilgileri yes denildiği taktirde
    client üzerindeki known_hosts dosyası içerisine yazılıyor, güvenil bağlantı
    oluşturulduktan sonra aradaki iletişim her bir gönderilen paket örneğin
    ls komutu, kullanıcının özel anahtarı ile şifreleniyor ve hash'lenmiş bir
    paket karşı tarafa gödneriliyor, bu tarafta sunucu aldığı şifrelenmiş paketi
    kullanıcının gönderdiği genel anahtar ile açıp, komutu işletiyor.
    -**
