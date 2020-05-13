Menginstall Zeppelin Notebook
=====================================================

Notebook adalah aplikasi yang mempermudah data analis atau data scientist untuk melakukan coding dalam menganalisa data. Notebook yang populer salah satunya adalah Apache Zeppelin.
Untuk menginstal Apache Zeppelin kita bisa menggunakan beberapa opsi:
1. Apache Zeppelin tersedia dalam paket YavaCE.
2. Menggunakan paket terpisah yang bisa didownload pada ..
3. Menggunakan versi dari Apache, yang bisa didownload pada situs resminya.

Karena kedepannya kita akan mengintegrasikan dengan Anaconda ataupun Miniconda, maka cara termudah adalah dengan menggunakan opsi kedua. Versi Apache Zeppelin ini sudah terkonfigur dengan YavaCE sehingga dapat dengan mudah kita menginstalnya.

## Langka-langkah
1. Masuk ke Virtual Machine dengan menggunakan user yava
2. Download miniconda
```bash
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
```
3. Install Miniconda dengan menjalankan script berikut
```bash
./Miniconda3-latest-Linux-x86_64.sh
```
Ikuti saja langkah yang disediakan oleh script. Pada opsi
```bash
Do you wish the installer to initialize Miniconda2
by running conda init? [yes|no]
[no] >>>
```
ketik yes

4. Buat environment baru pada Miniconda yang digunakan untuk menjalankan Apache Zeppelin. Environment ini kita berinama zeppelin, dengan menginstal library tambahan seperti numpy, pandas, scipy dan seaborn.
```bash
conda create --name zeppelin python=2.7 numpy pandas scipy seaborn
```
Setelah selesai, jika kita eksekusi perintah berikut maka zeppelin akan tampil dalam list environment pada miniconda
```bash
conda env list
# conda environments:
#
base                     /home/yava/miniconda2
zeppelin              *  /home/yava/miniconda2/envs/zeppelin
```
5. Download Apache Zeppelin dan extract
```bash
wget https://downloads.apache.org/zeppelin/zeppelin-0.8.2/zeppelin-0.8.2-bin-all.tgz
sudo tar -xzvf zeppelin-0.8.2-bin-all.tgz
sudo mv zeppelin-0.8.2 zeppelin
```
6. Jalankan Apache Zeppelin server dengan menggunakan environment zeppelin
```bash
conda activate zeppelin
(zeppelin) [yava@yavace3 ~]$ /opt/zeppelin/bin/zeppelin-daemon start
```
7. Setelah Zeppelin server berjalan, maka Zeppelin notebook dapat diakses dengan menggunakan web browser pada port: 8081 dengan menggunakan user: yava dan passwordnya yava247
