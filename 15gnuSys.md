# 15 Web Teknolojisine Giriş

### 1. HTTP Protokolü ve World-Wide-Web (WWW)

#### HTTP Protokolü
- HTTP - Hypertext Transfer Protocol olarak adlandırılan, OSI katmanlarında uygulama bölümünde yer almaktadır. Web Based Applications olarak geçen uygulamalarda iletişim ve veri alışverişi görevini üstlenir. HTTP için internetin posta güvercini diyebiliriz. Temel olarak TCP/IP tabanlı bir protokoldür. Resim, video, ses veya döküman dosyalarının iletimi için kullaınlır.

- Eğer iki bilgisayar birbirleriyle iletişime geçecekse ve ver ideğişimi yapcak ise client - server arasında bir iletişim kurulması gerekmektedir. Birbirleriyle konumak için HTTP buna imkan kılar ve request - response cycle şeklinde çalışır. Client bu durumda bilgiyi talep eden, server da talep edilen bilgiye cevap veren durumundadır.

HTTP Hakkındaki Önemli Noktalar;

1. HTTP'nin en önemli noktalarından biri Connectionless yani bağlantısız olmasıdır. Peki bu ne demek ? Bir iletişim kurulacağı zaman client request eder, server bu requeste response işlemini gerçekleştirir daha sonrasında aralarındaki iletişim kopar. Bu yüzden HTTP bağlantısız olarak çalışmaktadır.

2. HTTP herhangi bir türdeki dosyayı transfer edeiblir. Her iki ilgisayarında okuyabileceği miktarda olması gerekmektedir.

3. HTTP Statelerss yani durumu olmayan bir protokoldür. Buda şu demek oluyor, iki bilgisayar birbirleriyle iletişime geçtikten sonra geçerli request kapanırsa, iki bilgisayar birbirine yeniden bağlanmak zorunda kalır. Bu iki bilgisayar birbirlerini sadece request zamanlarında tanır ve request response döngüsü bittikten sonra bu tanışma ortadan kalkar. Yeniden tanışmak zorunda kalırlar.

- Neden HTTP ? HTTP ilk başlarda sadece HTML dosyalarını çekmek için kullanılmaya başlandı. Başlarda yani benim doğduğum yıllarda sadece HTML dosyalarını transfer etmek için kullanılıyordu ve diğer dosya tiplerini desteklemiyordur, yani video, resim vs gönderemiyordunuz. Gelişebilir şekilde oluşturulduğunda dolayı, sürekli olarak evrim geçirerek bugünkü haline geldi ve şimdilerde en hızlı ve güvenilir bir şekilde web içerisinde dosya aktarımı sağlayan bir protokol haline geldi, aynı zamanda bir çok avantajı beraberinde getirdi.

#### World-Wide-Web (www)

- Peki World-Wide-Web nasıl çalışıyor ve HTTP bunu nasıl mümkün kılıyor ? Öncelikle Request Response Cycle nasıl ona bir bakalım.

##### Request Response Cycle
-  Bir tarafta internet client bir tarafta da server olduğunu varsayalım. Kullanıcı bir internet sitesine erişimde bulunmak istiyor örnek vermek gerekirse `www.para.com.tr/hakkimizda.html`. Client kullandığı istemci programının URL kısmına bu bilgiyi yazıyor. Ancak bilgileri almasını için birbirleriyle bağlantıda olmaları gerekmektedir. Burada İnternet devreye girmektedir.

- İnternet günümüzün teknolojisiyle, ister kablolu, ister kablosuz bağlantıyı, tüm gerekli işleri gerçekleştirir, TCP/IP protokollerinden uygun olanını kullanarak iki bilgisayarın birbirleriyle iletişim kurabilmesini sağlamak amacıyla HTTP için gerekli ortamı sağlamaktadır. 

1. Client ilk olarak request gönderir, bunun adı HTTP Message olarak adlandırılmaktadır. Bağlantısız yani connectless olduğu için Client Request gönderdikten sonra response beklerken bağlantısı kesilir.

2. Sunucu tarfı aldığı request'e cevap vemrek için, isteği inceler, ne gerekiyorsa bunu hazırlayarak HTTP Message olarak response'u karşıya iletmek için bağlantı kurulur, gönderilecek data gönderilir ve aradaki bağlantı tamamen kesilimiş olur.

- Genel olarak işlem bu şekilde döngüyü tamamlar. Yeniden bir request atılana kadar bağlantı açılmaz. Genel olarak durum HTTP protokolünün titiz kuralları ile alakalıdır. Bir HTTP Message'a daha yakından baktığımızda şunları görüyoruz

    Startline
    Headers
    Body

Genellikle HTTP Messages plain text ve bazen de binary data içermektedir. Genel larak düz metin ile işlem yapılır. Response ve Request HTTP mesajları için 3 bölüm vardır ve bunlar birbirlerine göre farklılık göstermektedir.

    Request HTTP Message
    Startline
        GET     /hakkimizda.html    HTTP/1.0
    Headers
        Host: www.para.com.tr
        Accept: text/html
        Accept-langugage:en-us
    Body

- Bu bağlamda request bekleyen client'ın body göndermesine gerek yoktur, ancak göndereceği durumlar da bulunabilir. Startline'a baktığımız zaman 3 bölümden oluştuğunu görüyoruz. 

Method : Sunucuya ne yapmak için bağlantı kurmak istediğini sunucuya belirtir. Bana data ver, database'e bir veri ekle, bunu bir yerden ekle gibi. GET sunucuya veri göndermesini, POST veritabanında veri tutması için gönderiliyor. PUT ve DELETE gibi başka metodlar da mevcuttur. Burdaki durumda GET kullanılmaktadır, çünkü kullaıncı bir web sayfasını görüntülemek istiyor.

URI : Unified Resource Identifier olarak isimlendirilir ve request'in nerede aracanacğını sunucuya söylemekle yükümlüdür. Bizim yukarıda gördüğümüz gibi senaryomuzda /hakkimizda.html dosyası istenmekdetir. / bildiğiniz üzere kök dizinidir.

HTTP Version : Adından da anlaşılacağı gibi HTTP protokolünün verisyonunu belirtir ve sunucu gönderilen mesajı bu sayede nasıl anlayacağını bilir.

- Headers bölümü bazı bilgilendirmeler içermektedir.

Host: Örnekte de görüldüğü gibi sunucunun bulunduğu adresi bulundurulmaktadır ki bu da bizim requestte bulunduğumuz server tarafıdır.

Accept-language: Dili tanımlamak için kullanılır.

Accept: Sunucuya bizim hangi türde bir dosyayı talep ettiğimizi belirtmektedir. Mime type şeklinde tanımlanmış bir biçimde yazılır ki bu bizim durumumuzda text/html dir. image/gif, text/html vs.

- Sunucunun verdiği cevabı inceleyecek olursak.
    Response HTTP Message
    Startline
        HTTP/1.0    200:OK
    Headers
        Host: www.para.com.tr
        Accept-langugage: en-us
        Accept: text/html
    Body
        /hakkimizda.html

Status Code: Bu kodlar client'a request ile ilgili bilgi vermektedir. HTTP durum kodları pek çok şekilde bilgilendirme sağlamaktadır. 200 OK, 404 File Not Found şeklinde bilindik örnekler verilebilir.

Body: Client'ın istediği bilgi bu bağlamda sadece /hakkimizda.html dosyasıdır. Tek seferde veya aynı anda bir çok request gönderip response edilebilir.

https://umuttosun.com/http-protokolu/

### 2. İstemci (Firefox, Chromium, vs) ve Sunucu (Apache, Nginx, vs) Yazılımları

- Basit anlamda anlatacak olursak yukarıdada bahsettiğimiz gibi, biz bir internet sitesine girmek için Firefox, Chrome istemesekde IE kullanıyoruz. Bu programlar bizim istemcilerimiz oluyor. Yani bilgisayardan sunucuya request yollamak için, aynı zamanda sunucunun verdiği cevabı görüntülemek için kullandığımız uygulamalardır.

### 3. İstemcide (HTML, CSS, vs) ve Sunucuda (PHP, Java EE, Ruby on Rails, vs) Çalışan Teknolojiler

Client tarafında;

- HTML yani Hypertext Markp Language. Açılımından da anlaşılacağı gibi HTML bir etiketleme dilidir. Bu etiketler sayesinde cilent uygulananız aldığı etiketleri size daha güzel görülecek şekilde karşınıza getimektedir. HTMl bir web uygulamasının temeli olarak kullanılır.

- CSS yani Cascade Style Sheets. Sadece HTML kozmetik açıdan pek bir getiri sağlamamaktadır. Yukarıda da yazdığım gibi sadece iskelet kısım olarak kullanılır. Ancak CSS bu iskeletin daha çok bir insana benzemesini sağlamaktadır. Kozmetik açıdan birçok yeteneği mevcuttur.

- JS yani Javascript. Client taraflı bir betik programlama dilidir. HTML den istkelet CSS'den insana benzemesini sağlayacak araç olarak bahsettiğimiz için, JS için de bu insanın makyajı, aksesuarları, giysileri, diyebiliriz. Bu bağlamda JS ile bir çok işlem yapılabilir. Çok güçlü bir yapıya sahip olduğu için sınır tanımadan bir çok işlemi kolaylıkla gerçekleşitirlebilir.

- AJAX “Asynchronous JavaScript and XML” (Türkçe: Eşzamansız JavaScript ve XML) anlamına gelen ve bir çok programlama dili ile uyumlu çalışan bir tekniktir. Peki ama Ajax Nedir? Amaç; bütün sayfayı kullanıcıya tekrar yükletmeden, sadece gerekli olan veriyi dinamik olarak ekrana getirmek veya sunucuya veri göndermektir. Örneğin iletişim formu doldurulduğunda sadece datayı göndererek o bölüme sonucu yazdırmak için kullanılabilir.

Bunun gibi bir çok istemci üzerinde çalışan teknoloji mevcut, belli başlı bahsetmek istediklerim bunlardı. Daha fazlası için Google (:

Sunucu tarafında;



### 4. Uygulama Sunucuları ve Web ile Bağlantılı Diğer Servisler

### 5. Bir Web Sayfasının Görüntülenmesi

- Yukarıda aslında bir web sayfası nasıl görüntüleniyor azda olsa bahsettik. Temel olarak client tarafı, sunucunun gönderdiği bilgileri derleyerek sizin karşınıza görsel bir şekilde getirmektedir.

### 6. İstemcinin ve Sunucunun Kısıtlamaları

### 7. GET, POST, Cookie ile Değişken Aktarımı

### 8. SSL ile Güvenli HTTP (TLS/SSL) ve SSL Sertifikası

- Yukarıda bahsetmiştik, aslında tüm bilgilerimiz bir ağ üzerinden geçip sunucuya ulaşıyor. Bu HTTP protokolü tarafından gönderilen HTTP Message'ları tamamen okunabilir durumdadır. SSL yani Secure Socket Layer size adından da anlaşılacağı gibi Güvenli Giriş Katmanı sunmaktadır. Tüm iletişim esnasında bilgilerini şifreleyerek gönderilmesini sağlamaktadır.

SSL Protokolünün Özellikleri Nelerdir?

1. Bağlantı gizlidir.

2. Gelen verinin kodlaması ve şifreyi çözmesi esnasında güvenlik ve gizliliği sağlar.

3. Haberleşen uçların kimlikleri doğrulanabilir.

4. Doküman arşivi oluşturulmasını kolaylaştırır.

5. Bağlantı güvenilirdir. Mesaj akışı, mesajın bütünlüğünün kontrolünü de içerir.

6. Veriyi gönderenin ve veriyi alanın doğru yerler olduğunu garanti eder.

7. İletilen dokümanların tarih ve zamanını doğrular.

SSL Sertifika Çeşitleri (Doğrulama Türüne Göre);

1. DV (Domain Validation) SSL 

Doğrulama düzeyi düşük, sadece sunucu adını doğrulayan ve dakikalar içerisinde sağlanan sertifikalardır.

dv-ssl

2. OV (Organizational Validation) SSL 

Sunucu adına bağlı olarak bu alan adına sahip olan firmanın bilgilerini içerir ve bu bilgilerin hepsi sertifikayı üreten firma tarafından kontrol edilerek doğrulanır. Kurum adı, kurumun faaliyette olup olmadığı, başvuruyu yapan kişinin kurumda çalışıp çalışmadığı, başvurunun kurum tarafından gelip gelmediği, başvuru yapılan alan adının sahipliğinin veya kontrolünün bu kurumda olup olmadığı ve tüm iletişim bilgilerinin doğruluğu bu tip SSL sertifikalarının üretim sürecinde tek tek doğrulanır. DV seritifikalara göre çok daha güvenlidir. Onay süreci 1-2 gün sürmektedir.

ov-ssl

3. EV (Extended Validation) SSL

güvenlik düzeyi en yüksek olan ve sertifika sahibi firmanın fiziksel, hukuki ve ticari varlığıyla beraber çok kapsamlı kurumsal doğrulama süreçlerini sağlayan sertifikalardır. Sertifika üreticileri tarafında yapılan doğrulamaların çokluğu ve detayı sebebiyle en pahalı SSL sertifikalarıdır. Bu tür sertifikalarda kullanıcı tarayıcı üzerinde EV SSL sertifikası bulunan bir siteye bağlandığı takdirde adres çubuğunda güvenilir site niteliği taşıyan yeşil renkli bir gösterim belirir. Aşağıda EV SSL in ekran görüntüsü bulunmaktadır.

ev ssl örnek

ev-ssl

Kullanım Alanına (Domain Tipine) Göre SSL Seritifikaları;

1. Standart SSL Sertifikaları

Subdomainler olmaksıızn sadece 1 adet domain için imzalanan SSL seritifikalarıdır.

2. Multi Domain SSL Sertifikaları

Birden fazla domainin tek sertifika ile imzalanmasına olanak tanıyan sertifikalardır. Genelde multi domain sertikaları, varsayılan olarak 1 ana domaine ek 2 domain seçeneği ile kullanıcıya teslim edilir. Yani herhangi bir ekstra ücret ödemeden, ilk satın almada bu sertifikalar 3 domain için kullanılaibilir.
Ayrıca sertifika sağlayıcının belirlediği, domain başı ücretin ödenmesiyle ek domain satın alınarak, tek sertifika ile şifrelenen domain sayısı ortalama 100 adete kadar yükseltilebilir.

3. Wildcard SSL Sertifikaları

Sertifikanın kullanıldığı domainin tüm subdomainlerinin imzalanmasını sağlayan sertifika tipidir. Kurulumu *.domain.com şeklinde yapılır.
Wildcard ssl sertifikalarında subdomain limiti bulunmaz.

### 9. HTTP Doğrulama

- HTTP protokolü, web sayfalarına veya API'lara erişimin sınırlandırılmak istendiği senaryolar için kullanıcının kimliğinin doğrulamasına yardımcı olan ve HTTP Authentication adı verilen mekanizmayı sunmaktadır.

- HTTP'de ilgili başlığın Authorization olarak seçilmiş olması gariptir çünkü aslında bu mekanizma ile sağlanmak istenen Authentication olarak bilinen kimlik doğrulama işlemidir. Authorization günümüzde genel olarak yetkilendirme için tercih edilmektedir.

- Bilinen en eski doğrulama metodu HTTP Basic Authentication'dır. Bu doğrulama yönteminde tarayıcı sunucudan 401 Unauthorized cevabını aldığında kullanıcıya doğrulama için gerekli bilgileri hepimizin bildiği aşağıdaki ekranla sorar ve kullanıcıdan giriş bekler.

- HTTP Basic Authentication'da kullanıcı adı ve parola aralarına iki nokta (username:password) konarak birleştirilir. Birleşim sonunda ortaya çıkan metin, özel karakterlerden (?!<>, vb) arındırılmak üzere base64 encoding'den geçirilir ve Authorization: başlığına konmaya hazır hale getirilir. Aşağıdaki ekran görüntüsünde Basic Authentication ile istemciden sunucuya yapılan bir istek gösterilmiştir. Yine aynı şekilde base64 ile gönderilen metin decode edilerek kullanıcı adı ve parola gösterilmiştir.

https://medium.com/@gokhansengun/http-do%C4%9Frulama-metodlar%C4%B1-nelerdir-1-fdf3ff5dcac3

### 10. HTTP Durum Kodları

![DurumKodları](örnekler/15gnuSys-codes.md)