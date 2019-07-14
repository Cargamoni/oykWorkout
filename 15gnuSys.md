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

- Geldik dananın kuyruğunun koptuğu yere, Web nasıl çalışır ve HTTP buna nasıl imkan sağlar. Öncelikle response - request cyle nasıl çalışır ona bir bakalım. Bir 

* 15.2 İstemci (Firefox, Chromium, vs) ve Sunucu (Apache, Nginx, vs) Yazılımları
* 15.3 İstemcide (HTML, CSS, vs) ve Sunucuda (PHP, Java EE, Ruby on Rails, vs) Çalışan Teknolojiler
* 15.4 Uygulama Sunucuları ve Web ile Bağlantılı Diğer Servisler
* 15.5 Bir Web Sayfasının Görüntülenmesi
* 15.6 İstemcinin ve Sunucunun Kısıtlamaları
* 15.7 GET, POST, Cookie ile Değişken Aktarımı
* 15.8 SSL ile Güvenli HTTP (TLS/SSL) ve SSL Sertifikası
* 15.9 HTTP Doğrulama
* 15.10 HTTP Durum Kodları