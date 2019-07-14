# 9 Depolama Aygıtlarının Yönetimi

Dosya Sisteminde Neler Tutulur ?

### 1. GNU/Linux Sistemlerde Disk Yönetimi(PFE101 Unite6 P:43  - PFE201 Unite4 P:41)
  
  1.1 Disk bölümleme (fdisk, parted vb. )(PFE101 Unite6 P:46.47 - PFE201 Unite4 P:41..44)
  
  1.2 Bir Dosya Sistemi Kullanılarak Diskin Formatlanması (mkfs)(PFE101 Unite6 - PFE201 Unite4 P:45)
  
  1.3 Dosya sisteminin kontrolü ve düzeltilmesi (fsck)(PFE101 Unite6 - PFE201 Unite4 P:47)

### 2. Mount (Bindirme) İşlemleri(PFE101 Unite6 - PFE201 Unite4)
  
  2.1 Mount Parametreleri(PFE101 Unite6 P:47 - PFE201 Unite4 P:45)
  
  2.2 /etc/fstab Açıklaması(PFE101 Unite6 - PFE201 Unite4 P:48)

### 3. Hard link ve inode (ln, stat)(PFE201 Unite4 P:49..53)

##### Stat
- Seçtiğiniz dosyanın detaylı olarak bilgisini ekrana yazdırmak için kullandığımız komuttur. Dosya sisteminde o dosyaya ait olan hangi bilgilerin tutulduğunu listeler.

        File: gl-sys1.md
        Size: 8032      	Blocks: 16         IO Block: 4096   regular file
      Device: fd00h/64768d	Inode: 9582405     Links: 1
      Access: (0644/-rw-r--r--)  Uid: ( 1000/cargamoni)   Gid: ( 1000/cargamoni)
      Access: 2019-07-14 03:19:53.268034925 +0300
      Modify: 2019-07-05 17:05:34.255345888 +0300
      Change: 2019-07-05 17:05:34.255345888 +0300
      Birth: -

`man stat`

https://www.tecmint.com/linux-stat-command-examples/

##### Hard Link ve Inode (Kopyalama, Taşıma, Silme Nasıl Olur ?)

- Linux işletim sistemi dosyalardan oluşur. Her bir dosya disk üzerinde yer kaplar. Her bir disk bloklardan oluşur ve dosya sistemi oluşturulurken bu bloklar belirli boyutlarda veri saklamak için ölçeklenir. 

- Katı bağ dediğimiz, her bir dosya için oluşturulan disk üzerindeki bilgilerine ulaşmamızı sağlayan, bu bağ sayesinde de disk üzerinden veri üzerinde işlemler yapabilmemizi sağlayan bir dosya sistemi özelliğidir. Sembolik bağlara burada girmiyorum. Zaten biliyor olmanız gerekiyor.

- Her katı bağ, o dosyaya ait olan verinin bilgisini taşıdığı için dosya üzerinde yapılan değşiklikler tüm katı bağlara yansıtılır. Her bir katı bağ silinmedem dosyanın tam olarak nerede olduğu verisini kaybetmemiz imkansızdır. Bir dosyanın yerini tamamen kaybetmemiz, bir diğer deyişle silmemiz için tüm katı bağlarını ortadan kaldırmamız gerekmektedir.

- Dosya sistemlerini dosyaya ait olan hangi bilgileri tuttuğundan bahsetmiştik. Bunun biraz daha detayına inelim şimdide. Her bir katı bağa ilişkilendirilmiş Inode'lar bulunur. Inode içerisinde dosya ile ilgili `metadata` ve dosyanın disk üzerindeki yerini işaret eden 15 adet işaretçi, pointer bulundurur. Dosyanın adını Inode bulundurmaz.


    Her bir Inode kendi içerisinde;
    Dosyanın Boyutunu
    Aygıt ID'si
    UID
    GID
    MODE
    Zaman Damgaları
    Pointer to data

    Dosya Sistemi Yapısı;
    filesystem (örn, root fs, home fs) > filename > inode > data

 - Her bir INODE 15 pointer bulundurur demiştik, bunlardan 12 tanesi direk olarak veri bloğu üzerindeki dosyanın yerini işaret eder. Eğer dosya büyük ise 13. Pointer girer. Bu bölümde Indirect olarak adlandırdığımız pointer, bir sonraki disk bloklarını işaret eden bir Pointer Table'ı işaret eder ki bu da içerisinde disk bloklarını gösterir. Dosya için hala yeterli alan bulunamıyorsa 14. Pointer (2x Indirect) sıradaki disk bloklarını işaret edecek olan 2 adet Pointer Table oluşturur, her bir pointer table bloğun nerede başlayıp bittiğinin işaretlerini tutar. Aynı durum 15. pointer için de geçerlidir (3x Indirect). 

![Inode](örnekler/09gnuSys-inode.gif)

- Sistemdeki tüm katıbağları gösteren


`find / -type f -links +1 -exec ls -i {} \;|sort`

- Inode'u bilinen bir dosyanın yeri veya yerlerini saptama.


`find -inum INODE_NUM`

- Dosyayı diskten tamamen silmek için tüm lokasyonlardaki dosyayı nasıl silebilirim ?

https://www.youtube.com/watch?v=tMVj22EWg6A
https://www.youtube.com/watch?v=KN8YgJnShPM
https://www.youtube.com/watch?v=_6VJ8WfWI4k
### 4. Bir sürecin kullandığı bir dosyanın silinmesi ya da çalıştırılan Dosyanın Silinmesi değiştirilmesi

`ffplay ~/Music/HDRN\ Mix/Astronomy.mp3`

- The assumption that the complete RAW file is in memory is not true. Normally, when a file is opened the process gets a file descriptor which can be used to read/write the file.

- When a file is opened by a process and then is deleted while the file is still open does not actually delete the file instantly. The file is actually deleted when there are no processes anymore with handles (file descriptors) to that file. You can use lsof to see if the file still has handles and when you delete such file it is often listed with the (deleted) text appended to the line.

- Disk space is also not reclaimed when an open file is deleted so it is safe to still use the file as long as it is open. When the deleted file does not have active file descriptors anymore the filesystem will reclaim the consumed disk space.
