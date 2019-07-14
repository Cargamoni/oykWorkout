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

### 9. HTTP Doğrulama

- HTTP protokolü, web sayfalarına veya API'lara erişimin sınırlandırılmak istendiği senaryolar için kullanıcının kimliğinin doğrulamasına yardımcı olan ve HTTP Authentication adı verilen mekanizmayı sunmaktadır.

- HTTP'de ilgili başlığın Authorization olarak seçilmiş olması gariptir çünkü aslında bu mekanizma ile sağlanmak istenen Authentication olarak bilinen kimlik doğrulama işlemidir. Authorization günümüzde genel olarak yetkilendirme için tercih edilmektedir.

- Bilinen en eski doğrulama metodu HTTP Basic Authentication'dır. Bu doğrulama yönteminde tarayıcı sunucudan 401 Unauthorized cevabını aldığında kullanıcıya doğrulama için gerekli bilgileri hepimizin bildiği aşağıdaki ekranla sorar ve kullanıcıdan giriş bekler.

- HTTP Basic Authentication'da kullanıcı adı ve parola aralarına iki nokta (username:password) konarak birleştirilir. Birleşim sonunda ortaya çıkan metin, özel karakterlerden (?!<>, vb) arındırılmak üzere base64 encoding'den geçirilir ve Authorization: başlığına konmaya hazır hale getirilir. Aşağıdaki ekran görüntüsünde Basic Authentication ile istemciden sunucuya yapılan bir istek gösterilmiştir. Yine aynı şekilde base64 ile gönderilen metin decode edilerek kullanıcı adı ve parola gösterilmiştir.

https://medium.com/@gokhansengun/http-do%C4%9Frulama-metodlar%C4%B1-nelerdir-1-fdf3ff5dcac3

### 10. HTTP Durum Kodları

<table border="1" cellpadding="0" cellspacing="0" width="567">
<tbody>
<tr>
<td style="width:113px;">
<h2><span style="color:#FF0000;"><strong>Kod</strong></span></h2>
</td>
<td style="width:142px;">
<h2><span style="color:#FF0000;"><strong>Mesaj</strong></span></h2>
</td>
<td style="width:151px;">
<h2><span style="color:#FF0000;"><strong>Anlamı</strong></span></h2>
</td>
<td style="width:350px;">
<h2><span style="color:#FF0000;"><strong>Açıklama</strong></span></h2>
</td>
</tr>
<tr>
<td style="width:113px;">
<h2><strong>1xx</strong></h2>
</td>
<td style="width:142px;">
<h2><strong>Bilgi</strong></h2>
</td>
<td style="width:151px;">
<h2>&nbsp;</h2>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>100</p>
</td>
<td style="width:142px;">
<p><em>Continue</em></p>
</td>
<td style="width:151px;">
<p>Devam</p>
</td>
<td style="width:350px;">
<p>İstek başarılı alındığı ve devam edilebileceği belirtilir</p>
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p><span style="color:#000000;">101</span></p>
</td>
<td style="width:142px;">
<p><span style="color:#000000;"><em>Switching Protocols</em></span></p>
</td>
<td style="width:151px;">
<p><span style="color:#000000;">Anahtarlama Protokolü</span></p>
</td>
<td style="width:350px;">
<p><span style="color:#000000;">Sunucu, istemciden aldığı protokol değiştirme isteğine uyacağını belirtmektedir</span></p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>102</p>
</td>
<td style="width:142px;">
<p><em>Processing</em></p>
</td>
<td style="width:151px;">
<p>İşlem</p>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<h2><strong>2xx</strong></h2>
</td>
<td style="width:142px;">
<h2><strong>Başarı</strong></h2>
</td>
<td style="width:151px;">
<h2>&nbsp;</h2>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>200</p>
</td>
<td style="width:142px;">
<p><em>OK</em></p>
</td>
<td style="width:151px;">
<p>Tamam</p>
</td>
<td style="width:350px;">
<p>İstek başarılı alınmış ve cevap başarılı verilmiştir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>201</p>
</td>
<td style="width:142px;">
<p><em>Created</em></p>
</td>
<td style="width:151px;">
<p>Oluşturuldu</p>
</td>
<td style="width:350px;">
<p>İstek başarılı olmuş ve sunucuda yeni bir kaynak yaratılmıştır.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>202</p>
</td>
<td style="width:142px;">
<p><em>Accepted</em></p>
</td>
<td style="width:151px;">
<p>Onaylandı</p>
</td>
<td style="width:350px;">
<p>Sunucu isteği kabul etti ancak henüz işlemedi.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>203</p>
</td>
<td style="width:142px;">
<p><em>Non-Authoritative Information</em></p>
</td>
<td style="width:151px;">
<p>Yetersiz Bilgi</p>
</td>
<td style="width:350px;">
<p>Sunucu isteği başarılı işledi, ancak başka kaynakta olabilecek bilgi döndürmektedir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>204</p>
</td>
<td style="width:142px;">
<p><em>No Content</em></p>
</td>
<td style="width:151px;">
<p>İçerik Yok</p>
</td>
<td style="width:350px;">
<p>İstek başarılı alınmış ancak geri içerik döndürülmemektedir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>205</p>
</td>
<td style="width:142px;">
<p><em>Reset Content</em></p>
</td>
<td style="width:151px;">
<p>İçeriği Baştan al</p>
</td>
<td style="width:350px;">
<p>İstek başarılı alınmış ancak geri içerik döndürülmemektedir. Ancak içerik temizlenecektir (örneğin bir web formunda doldurulan bilgiler).</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>206</p>
</td>
<td style="width:142px;">
<p><em>Partial Content</em></p>
</td>
<td style="width:151px;">
<p>Kısmi İçerik</p>
</td>
<td style="width:350px;">
<p>GET için kısmi içerik (içeriğin bir belirli bir parçası) başarılıyla döndürülmüştür.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>207</p>
</td>
<td style="width:142px;">
<p><em>Multi-Status</em></p>
</td>
<td style="width:151px;">
<p>Çok-Statü</p>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>210</p>
</td>
<td style="width:142px;">
<p><em>Content Different</em></p>
</td>
<td style="width:151px;">
<p>Farklı İçerik</p>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<h2><strong>3xx</strong></h2>
</td>
<td style="width:142px;">
<h2><strong>Yönlendirme</strong></h2>
</td>
<td style="width:151px;">
<h2>&nbsp;</h2>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>300</p>
</td>
<td style="width:142px;">
<p><em>Multiple Choices</em></p>
</td>
<td style="width:151px;">
<p>Çok Seçenek</p>
</td>
<td style="width:350px;">
<p>Sunucuda isteğe göre birden fazla seçenek olduğunu bildirir. Sunucu seçeneği kendisi seçebilir veya seçenek listesini görüntüleyebilir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>301</p>
</td>
<td style="width:142px;">
<p><em>Moved Permanently</em></p>
</td>
<td style="width:151px;">
<p>Kalıcı Taşındı</p>
</td>
<td style="width:350px;">
<p>Bir kaynağın (veya sayfanın) kalıcı olarak başka bir yere taşındığını bildirir ve o yere yönlendirme sağlar.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>302</p>
</td>
<td style="width:142px;">
<p><em>Moved Temporarily</em></p>
</td>
<td style="width:151px;">
<p>Geçici Taşındı</p>
</td>
<td style="width:350px;">
<p>Bir kaynağın (veya sayfanın) kalıcı değil geçici olarak başka bir kaynağa yönlendirir. Kaynağın ana adresi değişmemiştir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>303</p>
</td>
<td style="width:142px;">
<p><em>See Other</em></p>
</td>
<td style="width:151px;">
<p>Diğerlerine Bak</p>
</td>
<td style="width:350px;">
<p>Farklı bir kayanağa GET yapılması gerektiğini belirtir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>304</p>
</td>
<td style="width:142px;">
<p><em>Not Modified</em></p>
</td>
<td style="width:151px;">
<p>Güncellenmedi</p>
</td>
<td style="width:350px;">
<p>İstenilen kaynakta daha önce yapılan istekten beri herhangi bir değişikliğin olmadı belirtilir ve içerik gönderilmez.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>305</p>
</td>
<td style="width:142px;">
<p><em>Use Proxy</em></p>
</td>
<td style="width:151px;">
<p>Proxy Kullan</p>
</td>
<td style="width:350px;">
<p>Sunucu tarafından döndürülen proxy'in kullanılması gerektiği belirtilir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>307</p>
</td>
<td style="width:142px;">
<p><em>Temporary Redirect</em></p>
</td>
<td style="width:151px;">
<p>Geçici olarak yeniden gönder</p>
</td>
<td style="width:350px;">
<p>Bir kaynağın (veya sayfanın) kalıcı değil geçici olarak başka bir kaynağa yönlendirir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<h2><strong>4xx</strong></h2>
</td>
<td style="width:142px;">
<h2><strong>İstemci hatası</strong></h2>
</td>
<td style="width:151px;">
<h2>&nbsp;</h2>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>400</p>
</td>
<td style="width:142px;">
<p><em>Bad Request</em></p>
</td>
<td style="width:151px;">
<p>Kötü İstek</p>
</td>
<td style="width:350px;">
<p>İstek hatalı (isteğin yapısı hatalı) olduğu belirtilir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>401</p>
</td>
<td style="width:142px;">
<p><em>Unauthorized</em></p>
</td>
<td style="width:151px;">
<p>Yetkisiz</p>
</td>
<td style="width:350px;">
<p>İstek için kimlik doğrulaması gerekiyor.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>402</p>
</td>
<td style="width:142px;">
<p><em>Payment Required</em></p>
</td>
<td style="width:151px;">
<p>Ödeme Gerekli</p>
</td>
<td style="width:350px;">
<p>Ödeme gerekiyor. (gelecekte kullanılması için ayrılmıştır).</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>403</p>
</td>
<td style="width:142px;">
<p><em>Forbidden</em></p>
</td>
<td style="width:151px;">
<p>Yasaklandı</p>
</td>
<td style="width:350px;">
<p>Kaynağın yasaklandığını belirtir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p><u>404</u></p>
</td>
<td style="width:142px;">
<p><em>Not Found</em></p>
</td>
<td style="width:151px;">
<p>Sayfa Bulunamadı</p>
</td>
<td style="width:350px;">
<p>İstek yapılan kaynağın (veya sayfanın) bulunamadığını belirtir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>405</p>
</td>
<td style="width:142px;">
<p><em>Method Not Allowed</em></p>
</td>
<td style="width:151px;">
<p>İzin verilmeyen Metod</p>
</td>
<td style="width:350px;">
<p>Sunucu , HTTP Method'u kabul etmiyor.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>406</p>
</td>
<td style="width:142px;">
<p><em>Not Acceptable</em></p>
</td>
<td style="width:151px;">
<p>Kabul Edilemez</p>
</td>
<td style="width:350px;">
<p>İstemcinin Accept header'ında verilen özellik karşılanamıyor.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>407</p>
</td>
<td style="width:142px;">
<p><em>Proxy Sunucuda login olmak gerekli</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>Proxy üzerinden yetkilendirme gerekir.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>408</p>
</td>
<td style="width:142px;"> 
<p><em>İstek zaman aşamına uğradı</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>İstek zaman aşımına uğradı (belirli bir sürede istek tamamlanamadı).</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>409</p>
</td>
<td style="width:142px;">
<p><em>Conflict</em></p>
</td>
<td style="width:151px;">
<p>(Hatlar) Çakıştı,Çakışma</p>
</td>
<td style="width:350px;">
<p>İstek içinde çelişki var.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>410</p>
</td>
<td style="width:142px;">
<p><em>Gone</em></p>
</td>
<td style="width:151px;">
<p>Bak</p>
</td>
<td style="width:350px;">
<p>Kaynak artık yok.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>411</p>
</td>
<td style="width:142px;">
<p><em>Length Required</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>İstekte "Content-Length" (içeriğin boyutu) belirtilmemiş.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>412</p>
</td>
<td style="width:142px;">
<p><em>Precondition Failed</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>unucu istekte belirtilen bazı önkoşulları karşılamıyor.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>413</p>
</td>
<td style="width:142px;">
<p><em>Request Entity Too Large</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>&nbsp;İsteğin boyutu çok büyük olduğu için işlenemedi.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>414</p>
</td>
<td style="width:142px;">
<p><em>Request-URI Too Long</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>URI (URL) fazla büyük.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>416</p>
</td>
<td style="width:142px;">
<p><em>Requested range unsatifiable</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>İstenilen kaynak istenilen medya tipini desteklemiyor.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>417</p>
</td>
<td style="width:142px;">
<p><em>Expectation failed</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>İstek yapılan parça (bir dosyanın bir parçası vb..) sunucu tarafından verilebiliyor veya uygun değil.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>422</p>
</td>
<td style="width:142px;">
<p><em>Unprocessable entity</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>Sunucu "Expect" ile istenileni desteklemiyor veya yerine getiremiyor.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>423</p>
</td>
<td style="width:142px;">
<p><em>Locked</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>424</p>
</td>
<td style="width:142px;">
<p><em>Method failure</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>451</p>
</td>
<td style="width:142px;">
<p><em>Unavailable For Legal Reasons</em></p>
</td>
<td style="width:151px;">
<p>Yasal nedenlerle gösterilemiyor</p>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<h2><strong>5xx</strong></h2>
</td>
<td style="width:142px;">
<h2><strong>Sunucu hatası </strong></h2>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>500</p>
</td>
<td style="width:142px;">
<p><em>Internal Server Error</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>Sunucuda bir hata oluştu ve istek karşılanamadı.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>501</p>
</td>
<td style="width:142px;">
<p><em>Uygulanmamış</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>Sunucu istenilen isteği yerine getirecek şekilde yapılandırılmamıştır.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>502</p>
</td>
<td style="width:142px;">
<p><em>Geçersiz Ağ Geçidi</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>Gateway veya Proxy sunucusu, kaynağın bulunduğu sunucudan (upstream sunucusu) cevap alamıyor.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>503</p>
</td>
<td style="width:142px;">
<p><em>Hizmet Yok</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>Sunucu şu anda hizmet vermiyor (kapalı veya erişilemiyor).</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>504</p>
</td>
<td style="width:142px;">
<p><em>Gateway Timeout</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>Gateway veya Proxy sunucusu, kaynağın bulunduğu sunucudan (upstream sunucusu) belirli bir zaman içinde cevap alamadı.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>505</p>
</td>
<td style="width:142px;">
<p><em>HTTP Version not supported</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>HTTP Protokol versiyonu desteklenmiyor.</p>
</td>
</tr>
<tr>
<td style="width:113px;">
<p>507</p>
</td>
<td style="width:142px;">
<p><em>Insufficient storage</em></p>
</td>
<td style="width:151px;">
<p>&nbsp;</p>
</td>
<td style="width:350px;">
<p>&nbsp;</p>
</td>
</tr>
</tbody>
</table>