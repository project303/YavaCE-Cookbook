Hadoop Stress Test
=====================================================

Hal yang ingin kita ketahui pada sebuah cluster Hadoop adalah performancenya. Kali ini kita akan mengukur performance dengan menggunkan aplikasi yang telah disediakan oleh Hadoop, yaitu Terasort.
TeraSort Benchmark menggunakan MapReduce dan HDFS untuk melakukan proses mengurutkan sejumlah data secepat mungkin.
Penghitungan ini terdiri dari 3 komponen:

    1. TeraGen - membuat data dengan nilai acak. Setiap records memiliki data sebesar 100 byte.
    2. TeraSort - melakukan pengurutan data menggunakan MapReduce
    3. TeraValidate - digunakan untuk memvalidasi hasil pengurutan data
Sebagai catatan Yahoo pernah membuat record di tahun 2008, dengan mengurutkan data sebesar 1 TB dalam waktu 209 detik menggunakan 910 nodes.


## Langka-langkah

1. Log in ke dalam server sebagai user yava, atau menggunakan Zeppelin notebook
2. Jalankan perintah berikut untuk membuat data acak sebesar 500 x 100 byte atau sekitar 50 kB Angka ini bisa diubah sesuai kebutuhan
```bash
yarn jar /usr/yava/3.0.0.0-0000/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen 500 /user/yava/teragen/input
```
3. Proses berikutkan adalah mengurutkan data yang telah dibuat dengan program terasort
```bash
yarn jar /usr/yava/3.0.0.0-0000/hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort /user/yava/teragen/input /user/yava/teragen/output
```
4. Jalankan teravalidate untuk memvalidasi hasil pengurutan
```bash
yarn jar /usr/yava/3.0.0.0-0000/hadoop-mapreduce/hadoop-mapreduce-examples.jar teravalidate /user/yava/teragen/output /user/yava/teragen/validate
```
5. Catat total waktu, dan bisa dibandingkan dengan membuat data yang lebih besar dengan mengubah parameter pada teragen :
    - 10000.000 untuk 1G
    - 100000000 untuk 10G
    - 1000000000 untuk 100G
    - 10000000000 untuk 1TB
6. Hapus file dan directory yang dihasilkan jika sudah tidak diperlukan
```bash
hdfs dfs -rm -r /user/yava/teragen
hdfs dfs -ls
```
