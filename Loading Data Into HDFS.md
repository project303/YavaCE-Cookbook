Upload Data ke dalam HDFS
=====================================================

HDFS atau Hadoop Distributed File System adalah file system yang digunakan oleh Hadoop dalam menyimpan dan mengolah file. Untuk dapat menggunakan distributed processing yang disediakan oleh Hadoop maka file-file yang akan diproses harus dimasukkan ke dalam HDFS. Hadoop akan memecah dan mendistribusikan file tersebut ke dalam node-node yang tersedia.
Dataset yang akan kita gunakan adalah movielens yang berukuran kecil yang diunduh dari movielens.org.

File notebook zeppelin dapat di download :

## Langka-langkah

1. Log in ke dalam server sebagai user yava, atau menggunakan Zeppelin notebook
2. Buat directory dataset dalam home directory yava
```bash
mkdir dataset
```
3. Download dataset movielens ke dalam directory dataset dengan menggunakan wget
```bash
wget http://files.grouplens.org/datasets/movielens/ml-latest-small.zip -P dataset
```
4. Verifikasi file yang telah kita download
```bash
ls -lah dataset
```
5. Lakukan ekstrasi file dan periksa hasil ekstrasinya
```bash
unzip dataset/ml-latest-small.zip -d dataset/
ls -lah dataset/ml-latest-small
```
6. Untuk mengetahui lebih detail mengenai dataset yang kita download, kita dapat membaca file README.txt yang disertakan dalam dataset
```bash
cat dataset/ml-latest-small/README.txt
```
7. List files under current user’s home folder, which is /user/<username>
```bash
hdfs dfs -ls
```
8. Buat directory dataset
```bash
hdfs dfs -mkdir dataset
```
9. Upload file *.csv dari lokal ke dalam directory dataset yang ada di HDFS dan periksa hasilnya
```bash
hdfs dfs -put dataset/ml-latest-small/*.csv dataset
hdfs dfs -ls dataset
```
10. Baca beberapa baris awal dari file movies.csv
```bash
hdfs dfs -head dataset/movies.csv
```
11. Baca beberapa baris akhir dari file movies.csv
```bash
hdfs dfs -tail dataset/movies.csv
```
12. Lakukan penghitungan jumlah baris dari file movies.csv
```bash
hdfs dfs -cat dataset/movies.csv | wc -l
```
13. Buat direktori movielens/movies
```bash
hdfs dfs -mkdir -p movielens/movies
```
14. Copy file dataset/movies.csv ke dalam movielens/movies
```bash
hdfs dfs -cp -p dataset/movies.csv movielens/movies
hdfs dfs -ls movielens/movies
```
