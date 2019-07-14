# 9 Depolama Aygıtlarının Yönetimi

### 1. GNU/Linux Sistemlerde Disk Yönetimi(PFE101 Unite6 - PFE201 Unite4 P:41)
    1.1 Disk bölümleme (fdisk, parted vb. )(PFE101 Unite6 - PFE201 Unite4 P:41..44)
    1.2 Bir Dosya Sistemi Kullanılarak Diskin Formatlanması (mkfs)(PFE101 Unite6 - PFE201 Unite4 P:45)
    1.3 Dosya sisteminin kontrolü ve düzeltilmesi (fsck)(PFE101 Unite6 - PFE201 Unite4 P:47)

### 2. Mount (Bindirme) İşlemleri(PFE101 Unite6 - PFE201 Unite4)
    2.1 Mount Parametreleri(PFE101 Unite6 - PFE201 Unite4 P:45)
    2.2 /etc/fstab Açıklaması(PFE101 Unite6 - PFE201 Unite4 P:48)

### 3. Hard link ve inode (ln, stat)(PFE201 Unite4)

### 4. Bir sürecin kullandığı bir dosyanın silinmesi ya da çalıştırılan Dosyanın Silinmesi değiştirilmesi

- The assumption that the complete RAW file is in memory is not true. Normally, when a file is opened the process gets a file descriptor which can be used to read/write the file.

- When a file is opened by a process and then is deleted while the file is still open does not actually delete the file instantly. The file is actually deleted when there are no processes anymore with handles (file descriptors) to that file. You can use lsof to see if the file still has handles and when you delete such file it is often listed with the (deleted) text appended to the line.

- Disk space is also not reclaimed when an open file is deleted so it is safe to still use the file as long as it is open. When the deleted file does not have active file descriptors anymore the filesystem will reclaim the consumed disk space.
