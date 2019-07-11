### 17 Apache/PHP/MySQL Kurulumu ve Örnek Bir Uygulamanın Koşturulması

**1. Apache/PHP/MySQL'in paket yöneticisinden kurulumu**

- "LAMP" bir dizi açık kaynak kodlu yazılımın bir arada yüklenip, sunucunuzun dinamik web siteleri ve web uygulamalarını çalıştırabilir hale getirilmesini sağlayan bir dizi programa verilen isimdir. Aslında acronym olan LAMP'ın açılımı "Linux işletim sistemi içinde Apache Web Sunucusu. MySQL veri tabanı içinde tutulan internet sitesi bilgileri ve dinamik içerik için kullanılan PHP" dir.

    ***CentOS Sunucu Sistemleri İçin Apache/PHP/MySQL Kurulumu***

    **Birinci Adım Apache'nin Kurulumu**

    *Öncelikle sistemimizdeki yazılım güncellemelerini, repolardan kontrol edelim ve sistemimizi güncel bir duruma getirelim.*

    `sudo yum update`

    *Daha sonra Apache web servisini kuralım.*

    `sudo yum install httpd`

    *Sunucu servisimizi başlatalım ve başlangıçta açılması için gerekli işlemleri yapalım*

    `sudo systemctl start httpd.service`

    `sudo systemctl enable httpd.service`

    *Vee httpd web sunucumuz artık kuruldu ve kullanıma hazır, tek yapmanız gereken ip komutu ile ip adresini öğrenip browser'ınıza ip adresini yazmanız.*
    `ip addr`

    http://sunucu.ip.adresi/

    *Bazı CentOS sunucularda Firewall tarafından HTTP ve HTTPS trafiği korunmaktadır, HTTP ve HTTPS trafiğine izin vermek için Firewall üzerinden izinlerimizi verelim.*

    `sudo firewall-cmd --permanent --zone=public --add-service=http`

    `sudo firewall-cmd --permanent --zone=public --add-service=https`

    `sudo firewall-cmd --reload`

    **İkinci Adım MySQL(MariaDB) Kurulumu**

    *Sunucunuzda verilerin bir arada tutulup, bu veriler üzerinde işlemler yapabilmemizi sağlayacak olan Veri Tabanı Yönetim Sistemi olan MySQL'in kurulmasına geçebiliriz*

    > NOT: Bu komutları uygulamadan önce sisteminizin güncel olduğunu apt update ile temin etmeniz gerektiğini unutmayın.

    `sudo yum install mariadb-server `
    
    *Yükleme işlemi tamamlandıktan sonra MariaDB servisini başlatalım*

    `sudo systemctl start mariadb`

    *Veri tabanına giriş yapabilmenizi sağlayacak parolayı oluşturmak için bir script kullanmamız gerekecek, kullanacağınız parolayı kaybetmeniz haline erişiminizi bloklayabileceğiniz için lütfen dikkatli olun.*

    `mysql_secure_installation`

    >NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

    >In order to log into MariaDB to secure it, we'll need the current password for the root user.  If you've just installed MariaDB, and you haven't set the root password yet, the password will be blank, so you should just press enter here.

    >Enter current password for root (enter for none):

    *İlk kurulumdan sonra herhangi bir parolası olmadığı için MySQL girişi için root parolasını belirlememiz gerekiyor, bu durumda boş bırakarak yeni root parolası belirleme işlemini yapıyoruz*

    >Setting the root password ensures that nobody can log into the MariaDB root user without the proper authorisation.

    >You already have a root password set, so you can safely answer 'n'.

    >Change the root password? [Y/n] Y
    >New password:
    >Re-enter new password:
    >Password updated successfully!
    >Reloading privilege tables..
    >... Success!

    >By default, a MariaDB installation has an anonymous user, allowing anyone to log into MariaDB without having to have a user account created for them.  This is intended only for testing, and to make the installation go a bit smoother.  You should remove them before moving into a production environment.

    >Remove anonymous users? [Y/n] y
    >... Success!

    >Normally, root should only be allowed to connect from 'localhost'.  This ensures that someone cannot guess at the root password from the network.

    >Disallow root login remotely? [Y/n] y
    >... Success!

    >By default, MariaDB comes with a database named 'test' that anyone can access.  This is also intended only for testing, and should be removed before moving into a production environment.

    >Remove test database and access to it? [Y/n] y
    >Dropping test database...
    >... Success!
    >Removing privileges on test database...
    >... Success!

    >Reloading the privilege tables will ensure that all changes made so far will take effect immediately.

    >Reload privilege tables now? [Y/n] y
    >... Success!

     >Cleaning up...

    >All done!  If you've completed all of the above steps, your MariaDB installation should now be secure.

    >Thanks for using MariaDB!

    *Sistem açılışıyla beraber başlaması için servisimizi ayarlayalım*

    `sudo systemctl start mariadb`

   **Üçüncü Adım PHP Kurulumu**
*PHP web uygulamaları ve web programlama için  geniş bir kitle tarafından kullanılan, özellikle sanal yöreler üzerinde geliştirme için tasarlanmış HTML içine gömülebilen bir betik dilidir.*

    *PHP MySQL ile de uyumlu bir şekilde kullanılabildiği için her iki paketi de Yum aracı ile beraber kolay bir şekilde yükleme işlemimizi yapalım*

    `sudo yum install php php-mysql`

    *Yükleme işlemimiz tamamlandıktan sonra Apache servisimizi gerekli ayar dosyalarını görebilmesi için yeniden başlatmamız gerekmektedir.*

    `sudo systemctl restart httpd.service`

    *Bu adımdan sonra PHP dosyalarınızı internet sitenizde çalıştırabilir ve dinamik internet siteleri olutşurabilirsiniz. Ek olarak PHP'ye ait birçok modül bulunmaktadır hangilerinin olduğunu görmek için yum aracı ile arama yapabilir ve yükleyebilirsiniz.*

    `sudo yum search php-`

    *İstediğiniz paketin tanımını okuyabilir,*

    `sudo yum info paket_adi`

    *Ve istediğiniz modülü yükleyebilirsiniz.*

    `sudo yum install php-modul1 php-modul2`


**Dördüncü Adım, PHP dosyalarınızı Sunucunuzda çalıştırın.**
*İnternet sitenizin dosyalarının bulunduğu konum /var/www/html altındadır. Buraya dosyalarınızı koyarak, herkezin görebileceği internet siteleri hazırlayabilirsiniz, şimdi kurdulumuzu test edelim.*

`sudo vi /var/www/html/info.php`

*Oluşturduğunuz boş php dosyası içerisine şu satırları ekleyelim*

`<?php phpinfo(); ?>`

*Ve deneyelim*

http://sunucu.ip.adresi/info.php



**2. phpMyAdmin web arayüzünün kurulumu**

*PhpMyAdmin sunucunuzda kurulu olan MySQL veri tabanı yönetim sistemini daha kolay kullanabilmeniz için PHP ile hazırlanmış bir web arayüz programıdır.*

*PhpMyAdmin web arayüzünü yükleyebilmek için EPEL Deposuna erişim sağlamamıza yardımcı olacak epel-release adlı programı yükleyeceğiz, bu program CentOS un eriştiği sunucu depoların bulunduğu dosyayı güncellemektedir.*

`sudo yum install epel-release`

*EPEL depolarına erişim sağlayabiliyoruz artık, phpmyadmin kurulumunu yapalım*

`sudo yum install phpmyadmin`

*Yükleme işlemimiz tamamlandıktan sonra phpMyAdmin'in ayar dosyalarında biraz değişiklik yapmamız gerekiyor, önce yedeğimizi alalım ve yeni oluşturacağımız dosyayı hazırlayalım*

`mv /etc/httpd/conf.d/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf.old`

`vim /etc/httpd/conf.d/phpMyAdmin.conf`

*Açılan dosyanın içerisini şu şekilde doldurup kaydedip çıkalıım*

    Alias /phpmyadmin /usr/share/phpMyAdmin
    Alias /phpMyAdmin /usr/share/phpMyAdmin
    
    <Directory "/usr/share/phpMyAdmin">
        AllowOverride None
        Options None
        Allow from All
        Require all granted
    </Directory>

*Ayarların geçerli olması için, Apache servisimizi yeniden başlatalım*

`sudo systemctl restart httpd.service`

*Ve PhpMyAdmin Web Arayüzüne Giriş yapalım*

http://sunucu.ip.adresi/phpMyAdmin


**3. Wordpress'in meşhur 5 dakikada kurulumu (Ayarları o kadar kısa değil (:)**
  *Kişisel bir yayın sistemi olan wordpress, MySQL ve PHP aracılığı ile yazılmış ve GPL lisanslıdır. Uzun hali ile (Content Management System), yani Türkçe anlamı olarak içerik yönetim sistemi olarak söylenebilir. Genel anlamda her ne kadar blog sistemleri üzerinde, bir makale yazma ile birlikte düzenlemede kullanılıyor olsa da yine de akla gelebilecek tüm içeriklerin de düzenlemesi yapılıp yayımlanabilmektedir.*

 **3.1 MySQL'de kullanıcı oluşturulması**

`mysql -u root -p`

`CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;`

`CREATE USER wordpressuser@localhost IDENTIFIED BY 'password';`

`GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';`

`FLUSH PRIVILEGES;`

`EXIT;`


 *WordPress'in Yüklenmesi ve Ayarları*

`sudo yum install php-gd`

`sudo service httpd restart`

`cd ~`

`wget http://wordpress.org/latest.tar.gz`

`tar xzvf latest.tar.gz`

`sudo rsync -avP ~/wordpress/ /var/www/html/`

`mkdir /var/www/html/wp-content/uploads`

`sudo chown -R apache:apache /var/www/html/*`


`cd /var/www/html`

`cp wp-config-sample.php wp-config.php`

`vim wp-config.php`

*İçerisindeki değerleri düzenliyoruz*
    // ** MySQL settings - You can get this info from your web host ** //
    // ** The name of the database for WordPress ** //
    define('DB_NAME', 'wordpress');
    // ** MySQL database username ** //
    define('DB_USER', 'wordpressuser');
    // ** MySQL database password ** //
    define('DB_PASSWORD', 'password');

http://sunucu.ip.adresi/

 **3.2 Apache'de gerekli ayarların düzenlenmesi (AllowOverride, vs)**

*Düzenleme işlemini vim aracılığıyla yapıyoruz.*

`vim /etc/apache2/sites-available/wordpress.conf`

    <Directory /var/www/wordpress/>
        AllowOverride All
    </Directory>

https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lamp-on-ubuntu-18-04

**4. Kendi sunucunuza kurabileceğiniz yaygın uygulamalar** (https://github.com/Kickball/awesome-selfhosted)
