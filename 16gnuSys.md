# 16 Veritabanı Servislerine Giriş

### 1. İlişkisel veritabanı modeli
İlişkisel veri tabanı, verinin tablo temelli yapılarda tutulduğu, tablolar arası ilişkilerin mevcut olduğu, sütun ve satırlardan oluşan veri tabanı sistemleridir. Her satır bir kayda ait bilgiyi içermektedir ve bu bilgiler satır-sütun (hücre) içerisinde tutulur.

Farklı tablolar arasındaki veriler, bir takım anahtarlar vasıtası ile birbirlerine bağlanırlar. İlgili tablolarda, sütunlar arasında bir veya birden fazla anahtar sütun yeralır. Bu anahtar sütun/sütunlar aracılığı ile birden çok tablonun verileri birbiriyle bağlantı sağlayabilir ve herhangi bir sorgulamada birlikte görüntülenebilir.

Aşağıda basit bir ilişkisel veri tabanı örneği verilmiştir. Örnekte, bir üniversite veri tabanınında, öğrenciler, akademisyenler, dersler, personel, öğrenci-ders bilgileri yer almaktadır. Aşağıdaki örnek elbette basitleştirilmiş bir senaryo. Gerçek dünyada bundan çok daha fazla bilgi ve ilişki mevcut olabilir.

#### 1.1. Veritabanı, tablo, kolon, satır kavramı

        OgNo 	Ad 	  	Soyad 	Fakulte 		Bolum
        1 		Ali 	Çetin 	Mühendislik 	Bilgisayar
        2 		Ayşe 	Yılmaz 	Hukuk 			Hukuk
        3 		Fatma 	Aslan 	Eğitim 			Matematik Öğretmenliği 


        Dkodu 	Ders Adı 			Bolum
        BIL101 	Bilgisayar 			Programlama I Bilgisayar
        BIL303 	Veri Tabanı 		Bilgisayar
        HUK202 	Anayasa Hukuku 		Hukuk
        MAT101 	Matematiğe Giriş 	Matematik Öğretmenliği 

        Ogno 	Dkodu 	Alinandonem  		Vize1 	Vize2 	Final
        1 		BIL101 	2015-2016 Güz 		80 		90 		100
        1 		BIL303 	2017-20218 Bahar	100 	100 	100
        2 		HUK202 	2016-2017 Güz 		65 		90 		90
        3 		MAT101 	2018-2019 Güz 		100 	90 		80


#### 1.2. Birincil anahtar, yabancı anahtar

- Bir veritabanı sistemindeki tablolardan herhangi birinde, o satırı tek başına diğerlerinden eşsiz bir şekilde tanımlayabilecek tek bir hücreye, kısacası tek başına o satırı ifade edebilecek veriye Primary Key yani Birincil Anahtar diyoruz.

- Bir veritabanı sistemindeki bir tabloda tanımlanan primary key değerini, ilişkide bulunduğu başka bir tabloda kullandığımız zaman, bu tablodaki o tabloyu eşsiz olarak değerlendiren bir primary key olduğu için, ilişki kurulan tablonun Primary Key'i ilişki kurduğu tabloda Foreign Key olarak adlandırılır.

- Örnek olarak anlatılaiblir.

#### 1.3. Örnek uygulama veritabanı tasarımı (5-6 tabloyu aşmayacak)             

### 2. SQL'e Giriş (SELECT, INSERT, UPDATE, DELETE sorguları)                    

### 3. İlişkisel olmayan veritabanları tanıtımı                                

NoSQL veritabanları, verilere erişmek ve verileri yönetmek için belge, grafik, anahtar-değer, bellek içi ve arama dahil olmak üzere çeşitli veri modelleri kullanır. Bu tür veritabanları, özellikle büyük veri hacmi, düşük gecikme süresi ve esnek veri modelleri gerektiren uygulamalar için optimize edilmiştir. Bu gereksinimler, diğer veritabanlarının veri tutarlılığı kısıtlamalarının bir kısmı esnetilerek karşılanır.

Basit bir kitap veritabanının şemasını modelleme örneğini ele alalım:

- İlişkisel bir veritabanında genellikle bir kitap kaydı gizlenerek (veya “normalleştirilerek”) ayrı tablolarda depolanırken, ilişkiler birincil ve yabancı anahtar kısıtlamaları tarafından tanımlanır. Bu örnekte Books (Kitaplar) tablosu ISBN, Book Title (Kitap Başlığı) ve Edition Number (Baskı Sayısı) sütunlarına; Authors (Yazarlar) tablosu AuthorID (Yazar Kimliği) ve Author Name (Yazar Adı) sütunlarına; Author-ISBN (Yazar-ISBN) tablosu ise AuthorID (Yazar Kimliği) ve ISBN sütunlarına sahiptir. İlişkisel model, veritabanının yedekliliği azaltacak şekilde normalleştirilmiş ve genel olarak depolama için optimize edilmiş tablolar arasında başvurusal bütünlük uygulamasına imkan tanıyacak şekilde tasarlanmıştır.

- Bir NoSQL veritabanında, kitap kaydı genellikle bir JSON belgesi olarak saklanır. Her kitap için öğe, ISBN, Book Title (Kitap Başlığı), Edition Number (Baskı Sayısı), Author Name (Yazar Adı) ve AuthorID (Yazar Kimliği) bilgileri tek bir belgede öznitelikler olarak depolanır. Bu modelde, veriler sezgisel yazılım geliştirme ve yatay ölçeklenebilirlik için optimize edilir.

##### Neden NoSQL veritabanı kullanmalısınız?

NoSQL veritabanları, harika kullanıcı deneyimleri sunulması amacıyla esnek, ölçeklenebilir, yüksek performanslı ve yüksek oranda işlevsel veritabanları gerektiren mobil, web ve oyun gibi birçok modern uygulama için idealdir.

- Esneklik: NoSQL genellikle daha hızlı ve daha fazla yinelemeli yazılım geliştirmeyi mümkün kılan esnek şemalar sağlar. Esnek veri modeli sayesinde NoSQL veritabanları yarı yapılandırılmış ve yapılandırılmamış veriler için idealdir.

- Ölçeklenebilirlik: NoSQL veritabanları genellikle pahalı ve kalıcı sunucular eklenerek ölçeği artırılabilecek şekilde değil, dağıtılmış donanım kümeleri kullanılarak ölçeği genişletilebilecek şekilde tasarlanır. Bazı bulut sağlayıcıları bu işlemleri arka planda, tam olarak yönetilen bir hizmet olarak gerçekleştirir.

- Yüksek performans: NoSQL veritabanları, benzer işlevlerin ilişkisel veritabanlarıyla gerçekleştirilmesi ile karşılaştırıldığında daha yüksek performansı mümkün kılan belirli veri modelleri (belge, anahtar-değer, grafik gibi) ve erişim desenleri için optimize edilmiştir.

- Yüksek oranda işlevsel: NoSQL veritabanları, her biri ilgili veri modeli için özel olarak tasarlanmış yüksek oranda işlevsel API'ler ve veri türleri sağlar.

