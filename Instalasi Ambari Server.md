Instalasi Ambari Server
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
9. Verifikasi status Ambari Server
```bash
ambari-server status
```
10. Untuk mengakses Ambari Server melalui antarmuka web, kita harus mengetahui ip address yang digunakan. Jika belum mengetahui ip address server yang digunakan, lakukan perintah berikut
```bash
ip addr
```
11. Akses ambari server dengan menggunakan web browser dari komputer mana saja yang bisa terkoneksi dengan server dan diarahkan ke alamat : <ip-address>:8080
<br>

<img src="images/ambari-url.png" alt="Ambari URL"
	title="Ambari URL"/>

12. Login dengan menggunakan user: admin/admin
