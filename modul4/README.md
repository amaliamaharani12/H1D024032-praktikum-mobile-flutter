# Modul 4: Operasi CRUD dengan API CodeIgniter 4

Repositori dan project ini dibuat untuk memenuhi tugas **Modul 4: Operasi CRUD dengan API Codeigniter 4** pada mata kuliah **Praktikum Pemrograman Mobile**.

---

## Identitas Praktikan

- **Nama       :** Amalia Maharani Andessy
- **NIM        :** H1D024032
- **Shift KRS  :** E
- **Shift Baru :** F

---

## Deskripsi Praktikum

Praktikum Modul 4 berfokus pada perancangan arsitektur client-server antara **Backend RESTful API menggunakan Framework CodeIgniter 4 & MySQL** dengan **Frontend Aplikasi Mobile menggunakan Framework Flutter (Project `tokokita`)**. 

Materi utama yang dipelajari dan diimplementasikan meliputi:
1. **Perancangan Database & RESTful API**:
   - Pembuatan database `toko_api` pada MySQL dengan tabel: `member`, `member_token`, dan `produk`.
   - Pembuatan base controller `RestfulController` turunan dari `ResourceController` CodeIgniter 4 untuk standarisasi format response JSON (`code`, `status`, `data`).
   - Pembuatan endpoint API Autentikasi: Registrasi (`POST /registrasi`) dan Login (`POST /login`).
   - Pembuatan endpoint API CRUD Produk:
     - Create Produk: `POST /produk`
     - Read/List Produk: `GET /produk`
     - Read/Detail Produk: `GET /produk/{id}`
     - Update Produk: `PUT /produk/{id}` (atau `POST /produk/{id}/update`)
     - Delete Produk: `DELETE /produk/{id}`
2. **Frontend Flutter (`tokokita`)**:
   - Pemodelan data (*Data Modeling*) dengan factory method `fromJson` untuk mem-parsing response JSON:
     - `model/login.dart`
     - `model/registrasi.dart`
     - `model/produk.dart`
   - Pembuatan antarmuka pengguna (*User Interface*) dengan validasi form (*Form Validation*):
     - `ui/registrasi_page.dart`: Form registrasi (Nama min 3 karakter, validasi regex email, Password min 6 karakter, Konfirmasi password).
     - `ui/login_page.dart`: Form login email & password beserta tombol navigasi ke halaman registrasi.
     - `ui/produk_page.dart`: Menampilkan katalog produk dalam bentuk list card, navigasi tambah produk (`+`), serta drawer navigasi.
     - `ui/produk_form.dart`: Formulir serbaguna untuk **Tambah Produk** (mode create) dan **Ubah Produk** (mode update prepopulated data).
     - `ui/produk_detail.dart`: Menampilkan detail informasi produk lengkap dengan tombol **EDIT** dan **DELETE** (disertai dialog konfirmasi).

---

## Struktur Folder Project

```text
modul4/
├── toko-api/                              # Backend CodeIgniter 4 RESTful API
│   ├── app/
│   │   ├── Config/
│   │   │   ├── Database.php               # Konfigurasi koneksi MySQL (db: toko_api)
│   │   │   └── Routes.php                 # Routing endpoint API
│   │   ├── Controllers/
│   │   │   ├── RestfulController.php      # Base RESTful Controller & format response JSON
│   │   │   ├── RegistrasiController.php   # Controller proses registrasi member
│   │   │   ├── LoginController.php        # Controller login & token generator
│   │   │   └── ProdukController.php       # Controller CRUD produk
│   │   └── Models/
│   │       ├── MRegistrasi.php            # Model tabel member (registrasi)
│   │       ├── MMember.php                # Model tabel member (login check)
│   │       ├── MLogin.php                 # Model tabel member_token
│   │       └── MProduk.php                # Model tabel produk
│   └── toko_api.sql                       # Skema database & tabel MySQL
│
├── android/                               # Konfigurasi platform Android
│   ├── app/
│   └── gradle.properties                  # Setting aman JVM RAM 2 GB
├── lib/                                   # Source Code Flutter (tokokita)
│   ├── main.dart                          # Titik masuk utama aplikasi Flutter
│   ├── model/                             # Model data class Flutter
│   │   ├── login.dart                     # Model data Login response
│   │   ├── registrasi.dart                # Model data Registrasi response
│   │   └── produk.dart                    # Model data entitas Produk
│   └── ui/                                # Komponen Tampilan (Antarmuka)
│       ├── registrasi_page.dart           # Halaman Form Registrasi
│       ├── login_page.dart                # Halaman Form Login
│       ├── produk_page.dart               # Halaman List Produk
│       ├── produk_form.dart               # Halaman Tambah / Ubah Produk
│       └── produk_detail.dart             # Halaman Detail Produk
├── pubspec.yaml                           # Konfigurasi package & dependensi
└── README.md                              # Dokumentasi Modul 4
```

---

## Rincian File dan Logika Program

### A. Backend CodeIgniter 4 (`toko-api`)

1. **Database Script (`toko-api/toko_api.sql`)**:
   - `member`: Menyimpan kredensial user (`nama`, `email`, `password` hash).
   - `member_token`: Menyimpan auth token hasil login per user (`member_id`, `auth_key`).
   - `produk`: Menyimpan katalog barang (`kode_produk`, `nama_produk`, `harga`).
2. **`RestfulController.php`**:
   Menyediakan fungsi seragam `responseHasil($code, $status, $data)` untuk menghasilkan format keluaran standar:
   ```json
   {
       "code": 200,
       "status": true,
       "data": ...
   }
   ```
3. **`RegistrasiController.php` & `LoginController.php`**:
   - Mengenkripsi password user menggunakan `password_hash($password, PASSWORD_DEFAULT)`.
   - Memverifikasi login dengan `password_verify()` dan men-generate random token string sepanjang 100 karakter yang disimpan pada tabel `member_token`.
4. **`ProdukController.php`**:
   - `create()`: Menyimpan produk baru dan mengembalikan record produk yang baru diinput.
   - `list()`: Mengambil seluruh baris data produk dengan `findAll()`.
   - `detail($id)`: Mengambil satu baris spesifik data produk berdasarkan `id`.
   - `ubah($id)`: Memperbarui data produk berdasarkan `id`.
   - `hapus($id)`: Menghapus data produk berdasarkan `id`.

---

### B. Frontend Flutter (`tokokita`)

1. **Model (`lib/model/`)**:
   Mengonversi payload Map JSON menjadi objek strongly-typed pada Dart melalui konstruktor factory `fromJson()`.
2. **`lib/ui/registrasi_page.dart`**:
   - Dilengkapi `GlobalKey<FormState>()` untuk validasi form.
   - Validasi nama minimal 3 karakter.
   - Validasi format email menggunakan regex pattern RFC-compliant.
   - Validasi password minimal 6 karakter dan pencocokan konfirmasi password.
3. **`lib/ui/login_page.dart`**:
   - Validasi input email dan password tidak boleh kosong.
   - Menggunakan widget `InkWell` di bagian bawah form untuk navigasi langsung ke halaman `RegistrasiPage`.
4. **`lib/ui/produk_form.dart`**:
   - Menerima argumen opsional `Produk? produk`.
   - Fungsi `isUpdate()` memeriksa apakah parameter produk diisi. Jika iya, judul otomatis menjadi *"UBAH PRODUK"*, tombol menjadi *"UBAH"*, dan textfield langsung terisi nilai awal produk. Jika tidak diisi, judul menjadi *"TAMBAH PRODUK"* dan tombol menjadi *"SIMPAN"*.
5. **`lib/ui/produk_detail.dart`**:
   - Menampilkan detail informasi `Kode`, `Nama`, dan `Harga` dalam format Rupiah.
   - Tombol **EDIT** untuk berpindah ke `ProdukForm` membawa data produk yang sedang dilihat.
   - Tombol **DELETE** yang memicu `confirmHapus()` berupa `AlertDialog` dengan pilihan *"Ya"* dan *"Batal"*.
6. **`lib/ui/produk_page.dart`**:
   - Menampilkan daftar produk menggunakan widget `Card` dan `ListTile`.
   - Memiliki tombol `+` pada AppBar untuk membuka formulir tambah produk.
   - Memiliki Drawer navigasi dengan menu `Logout`.
7. **`lib/main.dart`**:
   - Mengatur entry point aplikasi dengan `home: const ProdukPage()`.

---

## Cara Menjalankan Aplikasi

### 1. Menjalankan Backend API (`toko-api`)
1. Import database `modul4/toko-api/toko_api.sql` ke MySQL (via phpMyAdmin / MySQL CLI).
2. Letakkan folder `toko-api` pada web root server (misal `C:\xampp\htdocs\toko-api` atau jalankan via `php spark serve`).
3. Endpoint API dapat diuji menggunakan Postman sesuai dokumentasi endpoint di atas.

### 2. Menjalankan Frontend Flutter (`modul4`)
1. Buka terminal pada folder `modul4`:
   ```powershell
   cd modul4
   ```
2. Jalankan aplikasi ke HP fisik via USB atau emulator:
   ```powershell
   flutter run
   ```
   *Atau buka file `modul4/lib/main.dart` di VS Code / Antigravity IDE lalu tekan tombol **F5**.*

### Mengganti Halaman Pengujian di `main.dart`
Untuk melihat pengujian dari masing-masing langkah modul, ubah properti `home:` pada file `modul4/lib/main.dart`:
```dart
// Pilihan halaman pengujian:
home: const RegistrasiPage(), // Halaman Form Registrasi (Hal. 34)
home: const LoginPage(),      // Halaman Form Login (Hal. 37)
home: const ProdukPage(),     // Halaman List Produk (Hal. 43 - Default Aktif)
```

---

## Hasil Tangkapan Layar (Screenshots)

Simpan hasil screenshot dari layar HP ke dalam folder `screenshots/` di root repositori dengan format nama file berikut:

### 1. Form Registrasi (Modul Hal. 34)
> Letakkan screenshot di: `screenshots/modul4_registrasi.png`

![Form Registrasi](../screenshots/modul4_registrasi.png)

### 2. Form Login (Modul Hal. 37)
> Letakkan screenshot di: `screenshots/modul4_login.png`

![Form Login](../screenshots/modul4_login.png)

### 3. List Data Produk (Modul Hal. 43)
> Letakkan screenshot di: `screenshots/modul4_list_produk.png`

![List Data Produk](../screenshots/modul4_list_produk.png)

### 4. Form Tambah Produk (Modul Hal. 43)
> Letakkan screenshot di: `screenshots/modul4_tambah_produk.png`

![Form Tambah Produk](../screenshots/modul4_tambah_produk.png)

### 5. Detail Produk (Modul Hal. 44)
> Letakkan screenshot di: `screenshots/modul4_detail_produk.png`

![Detail Produk](../screenshots/modul4_detail_produk.png)

### 6. Form Ubah Produk (Modul Hal. 44)
> Letakkan screenshot di: `screenshots/modul4_ubah_produk.png`

![Form Ubah Produk](../screenshots/modul4_ubah_produk.png)
