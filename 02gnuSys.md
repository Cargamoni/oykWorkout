### 2 Baby Steps ve GNU/Linux İşletim Sisteminin Yapısı
1. Kabuk Kavramı                                                             (PFE101 Unite2 P:13)
    - İşletim sistemi çekirdeği ile kullanıcının daha rahat bir şekilde iletişim kurmasını sağlayan bir birimdir kabuk. Çoğu GNU/Linux dağıtımlarında BASH kabuğu varsayılan olarak gelmektedir. 4. Ünitede detaylı şekilde haşır neşir olacağız ancak şimdilik bilmeniz gerekn kısım şudur; kullanıcının işlettireceği komutları, çalıştırılacak programları arkaplanda kabuğa iletip, karşılığını ekrana kullanıcının karşısına getiren bir araçtır. Varsayılan olarak gelen BASH yerinde sistemde sh kabuğu da bulunmatkadır. Dilerseniz daha sonra da ekleyebiliyorsunuz, örnek olarak beni şuanda kullandığım zsh'ı verebiliriz. Fish çok kullanılan kabuklardan birisidir. 

2. Yardım Almak (man, info, help, Google :P)                                 (PFE101 Unite8)

3. Kabukta İlk Adımlar (whoami, pwd, cd, ls, cat)
        - 3.1 Seçenekler, çift ve tek tire
            . Her programın kendi içerisinde seçenekleri, özellikleri, mevcuttur. Bütün bunları ezbere bilmeniz gerekmez, örnek olarak önünüzde açık olan terminaller üzerinde yazacağınız bir help komutu, help programını çalıştırıp sizin önünüze sık kullanılan programları ve nasıl kullanıldığını getirmektedir. Bu help BASH'ın bir özelliği olarak gelmektedir.

        - 3.2 Parametre ve argümanlar
            . Parametre ile argüman arasında fark vardır. C/C++ dilinden örnek verecek olrusak;
                int toplayici(int a, int b)
                {
                    return a + b;
                }

                cout >> toplayici(5,4) >> endl;
            
            . Fonksiyonun içerisindeki a ve b değişkenleri parametre, aşağıda kullanılan toplayıcı(5,4) içerisindeki 5 ve 4 sayıları o fonksyiona parametre olarak gönderilecek argümanlardır. Peki size sorum şu biz `cd /home/cargamoni` komutunu yazarken neresi parametre neresi neresi argüman.


4. Açılış Sistemi                                                            (PFE101 Unite 2)
    - Bilgisayar nasıl açılır ? Adım adım anlatılacak.
![picture](resimler/02gnuSys-motherboard.png)

5. Dosya Sistemlerinin Tanıtılması                                           (PFE101 Unite 6 P:44.45.46)
    - GNU/Linux işletim sisteminde herşey dosyadır. Bu yüzden dosya sistemi önemlidir. Bir değineceğiz. Tiplerine bakacğız neler var neler yok bunlardan bahsedeceğiz. Detaylı olarak 09 Depolama aygıtlarının yönetiminde işleyeceğiz.

6. Dosya ve Dizin Hiyerarşisi                                                (PFE101 Unite 2)
    - 

7. Dosya Türleri (Dizin, Soket, vs)                                          (PFE101 Unite4)
8. Sembolik bağ tanım                                                           (PFE101 Unite6) 
9. Mutlak Yol, Bağıl Yol Kavramları                                          Kendim anlatacağım