# Data_Engineer_ETL_SQL
Create Job ETL with Talend and moving a data from Staging to Data Warehouse

## PROJECT BASED VIRTUAL INTERNSHIP PROGRAM | DATA ENGINEER ID/X Partners
# TABLE 

## Introduction 
Hello Everyone, This is my portofolio about implementation of Data Warehouse to E-commerce 

## CV 
Hello, My Name is Muhammad Fauzan,I'm student of Sriwijaya University majoring Information System. I'm very interested with Data especially Data Engineering. Data its ability to provide information through analysis, dan its validity can be measured in decision making.

##Problem Statement 

Salah satu client dari ID/X Partners yang bergerak di bidang e-commerce memiliki kebutuhan untuk membuat sebuah Data Warehouse yang berasal dari beberapa tabel dari database sumber. Data Warehouse ini nantinya terdiri dari satu tabel Fact dan beberapa tabel Dimension. 

## Task 
1. Melalukan Import/Restore Database Staging
2. Membuat Database berupa **Tabel Fact** dan **Tabel Dimension** dari tabel yang ada di database staging
3. Membuat JOB ETL di tools yaitu TALEND untuk Extract data dari Staging ke Data Warehouse
4. Melakukan Store Procedure untuk menampilkan Summary_Sales_Order berdasarkan status Pengiriman.

## TOOLS 
- Database         = SQLSERVER, MYSQL
- Data Integration = TALEND OPEN STUDIO

## Import/Restore Database
Tahap ini menggunakan Tools SQLSERVER untuk restore database : 

Staging merupakan database source yang berisikan tabel sebagai berikut 
- sales_order
- customer
- product
- status_order

  ## Create Data Warehouse
  Tahap ini dilakukan menentukan Schema database. pada kasus ini menggunakan **STAR SCHEMA** karena skema berpusat pada Fact Table yang terhubung dengan Dimension Table. Pada kasus ini juga lebih baik menggunakan Star skema karena berfokus Tabel Fakta(Status_order) dan terdiri dari tiga Tabel Dimensi (customer,product,status_order)

Data warehouse yang ditargetkan diberi nama **DWH_Project** berfungsi sebagai data yang akan di ekstrak dari Staging

## Database Connection 
Pengkoneksian antar Database Source(Staging) ke Database Target (DWH_Project) menggunakan tool TALEND OPEN STUDIO. Pada kiri Talend terdapat repository dan ada menu **metadata**, pada metadata terdapat pilihan **Database Connection**. Pada Database Connection dapat melakukan inputsql. 

Setelah terkoneksi di data warehouse, proses ETL dapat dilakukan untuk integrasi dan transform data. 

## Proses ETL 
1. Exctract : ekstrak data dari staging database
2. Transform : Transformasi data berdasarkan _requirement_, banyak fitur untuk melakukan transform seperti tfilterow,tfiltercolumn,tMap,dll. pada kasus ini menggunakan fitur Tmap karena pada kebutuhan mengkhususkan tabel DimCustomer untuk merubah data dari kolom FirstName dan LastName menjadi kapital lalu digabungkan ke kolom CustomerName
3. Load : data yang telah di transform kemudian memindahkan data tersebut ke data warehouse.

## Store Procedure 
Setelah dilakukan ETL dan telah dipindahkan ke Data Warehouse langkah terakhir adalah melakukan Store Procedure untuk pengambilan informasi yang mengenai penjualan
