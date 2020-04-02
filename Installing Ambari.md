Menginstallasi Ambari
=====================================================

Pada resep ini kita akan melakukan instalasi yava repository dan juga ambari server. Untuk ini diperlukan koneksi internet yang stabil, karena kita harus mendownload 2 file utama yang cukup besar pada yava.labs247.id/download_box

## Langka-langkah

1. Log in ke dalam server sebagai root
2. Download YavaCE 19.07 dengan
```bash
wget https://yava.labs247.id/download/116801/
wget https://yava.labs247.id/download/116796/
```
3. Setelah selesai, maka kita akan memperoleh file ambari_2.7.3-yavace-repo-3.1907-24.noarch.rpm dan yavace-core_3.1907-yavace-repo-3.1907-24.noarch.rpm
4. Validasi kedua file tersebut dengan membandingkan nilai md5 dengan yang tertera dalam websita
```bash
md5sum ambari_2.7.3-yavace-repo-3.1907-24.noarch.rpm
md5sum yavace-core_3.1907-yavace-repo-3.1907-24.noarch.rpm
```
5. Buat repository lokal dengan menggunakan perintah
```bash
yum install -y ambari_2.7.3-yavace-repo-3.1907-24.noarch.rpm
yum install -y yavace-core_3.1907-yavace-repo-3.1907-24.noarch.rpm
```
6. Install Ambari Server
```bash
yum install -y ambari-server
```
7. Lakukan konfigurasi Ambari Server, dengan opsi default
```bash
ambari-server setup -j /usr/lib/jvm/java-1.8.0
```
8. Start Ambari Server
```bash
ambari-server start
```
9. Check ip address server yang digunakan, dalam kasus ini didapat 192.168.56.247
```bash
ambari-server start
```
9. Akses ambari server dengan menggunakan browser dan diarahkan ke alamat : 192.168.56.247:8080
10. Login dengan menggunakan user: admin/admin
