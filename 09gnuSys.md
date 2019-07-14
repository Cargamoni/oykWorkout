# 9 Depolama Aygıtlarının Yönetimi

### 1. GNU/Linux Sistemlerde Disk Yönetimi(PFE101 Unite6 P:43  - PFE201 Unite4 P:41)
    1.1 Disk bölümleme (fdisk, parted vb. )(PFE101 Unite6 P:46.47 - PFE201 Unite4 P:41..44)
    1.2 Bir Dosya Sistemi Kullanılarak Diskin Formatlanması (mkfs)(PFE101 Unite6 - PFE201 Unite4 P:45)
    1.3 Dosya sisteminin kontrolü ve düzeltilmesi (fsck)(PFE101 Unite6 - PFE201 Unite4 P:47)

### 2. Mount (Bindirme) İşlemleri(PFE101 Unite6 - PFE201 Unite4)
    2.1 Mount Parametreleri(PFE101 Unite6 P:47 - PFE201 Unite4 P:45)
    2.2 /etc/fstab Açıklaması(PFE101 Unite6 - PFE201 Unite4 P:48)

### 3. Hard link ve inode (ln, stat)(PFE201 Unite4 P:49..53)

##### Stat
Seçtiğiniz dosyanın detaylı olarak bilgisini ekrana yazdırmak için kullandığımız komuttur. Dosya sisteminde o dosyaya ait olan hangi bilgilerin tutulduğunu listeler.

      File: gl-sys1.md
      Size: 8032      	Blocks: 16         IO Block: 4096   regular file
    Device: fd00h/64768d	Inode: 9582405     Links: 1
    Access: (0644/-rw-r--r--)  Uid: ( 1000/cargamoni)   Gid: ( 1000/cargamoni)
    Access: 2019-07-14 03:19:53.268034925 +0300
    Modify: 2019-07-05 17:05:34.255345888 +0300
    Change: 2019-07-05 17:05:34.255345888 +0300
    Birth: -



### 4. Bir sürecin kullandığı bir dosyanın silinmesi ya da çalıştırılan Dosyanın Silinmesi değiştirilmesi

- The assumption that the complete RAW file is in memory is not true. Normally, when a file is opened the process gets a file descriptor which can be used to read/write the file.

- When a file is opened by a process and then is deleted while the file is still open does not actually delete the file instantly. The file is actually deleted when there are no processes anymore with handles (file descriptors) to that file. You can use lsof to see if the file still has handles and when you delete such file it is often listed with the (deleted) text appended to the line.

- Disk space is also not reclaimed when an open file is deleted so it is safe to still use the file as long as it is open. When the deleted file does not have active file descriptors anymore the filesystem will reclaim the consumed disk space.
