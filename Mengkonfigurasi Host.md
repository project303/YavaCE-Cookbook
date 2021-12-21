Mengkonfigurasi Server
=====================================================

Sebelum kita melakukan instalasi YavaCE, kita harus mempersiapkan beberapa hal sehingga instalasi berjalan dengan lancar. Server yang kita gunakan diberi nama yavace3.labs247.id. Nama tersebut bisa diubah sesuai dengan kebutuhan.

## Langka-langkah

1. Log in ke dalam server sebagai root
2. Ubah nama server sesuai dengan keinginan. Saat ini kita akan memberi nama server yavace3.labs247.id. Lakukan perintah berikut
```bash
hostnamectl set-hostname yavace3.labs247.id
```
Pastikan pada /etc/hosts terdaftar ip dan hostname yang digunakan
```bash
vi /etc/hosts
```
tambahkan 
```bash
<ip-addr> yavace3.labs247.id yavace3
```
3. Install epel repository
```bash
yum install -y  epel-release
```
4. Untuk mendapatkan upgrade dan patch pada OS, lakukan perintah berikut
```bash
yum -y update && yum -y upgrade
```
5. Install netstat dan wget. Dua tools ini akan sangat berguna.
```bash
yum install -y net-tools
yum install -y wget
```
6. YavaCE sangat disarankan menggunakan OpenJDK 1.8
```bash
yum install -y java-1.8.0-openjdk
yum install -y java-1.8.0-openjdk-devel
```
7. Setelah selesai menginstall OpenJDK, lakukan konfigurasi pada shell yang kita menggunakan
```bash
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0' >> .bash_profile
echo 'PATH=$PATH:$HOME/bin' >> .bash_profile
echo 'export PATH' >> .bash_profile
echo 'umask 022'  >> .bash_profile
```
8. Lakukan update shell profile dan validasi OpenJDK
```bash
source .bash_profile
java -version
```
9. YavaCE nilai Maximum Open File Descriptors minimal 10000
```bash
ulimit -n 10000
```
10. Mendisable SELinux dengan mungubah nilai SELINUX menjadi disabled
```bash
sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
```
11. Set umask proﬁle
```bash
echo umask 0022 >> /etc/profile
```
12. Buat passwordless ssh connection ke local server
Jalankan perintah berikut dan ikuti default konfigurasinya
```bash
ssh-keygen
```
Copy ssh ke localhost
```bash
ssh-copy-id -i .ssh/id_rsa.pub root@yavace3.labs247.id
```
Uji coba koneksi
```bash
ssh root@yavace3.labs247.id
```
13. Pastikan time zone pada server terkonfigurasi Jakarta
```bash
timedatectl set-timezone Asia/Jakarta
```
Periksa kembali timezone
```bash
timedatectl
```
14. Restart server
```bash
shutdown -r now
```
