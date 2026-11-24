# Modul 5: Integrasi Flutter dengan REST API CodeIgniter 4 (Helpers, BLoC, Dialog & CRUD)

Repositori dan project ini dibuat untuk memenuhi tugas **Modul 5: Integrasi Flutter dengan REST API CodeIgniter 4** pada mata kuliah **Praktikum Pemrograman Mobile**.

---

## Identitas Praktikan

- **Nama       :** Amalia Maharani Andessy
- **NIM        :** H1D024032
- **Shift KRS  :** E
- **Shift Baru :** F

---

## Deskripsi Praktikum

Praktikum Modul 5 merupakan kelanjutan dari aplikasi **`tokokita`** (Modul 4) yang menghubungkan antarmuka pengguna Flutter secara penuh ke **Backend RESTful API CodeIgniter 4 (`toko-api`)**. Pada modul ini diimplementasikan:

1. **Helper Modul (`lib/helpers/`)**:
   - **`user_info.dart`**: Mengelola penyimpanan sesi login pengguna (`token` dan `userID`) secara lokal menggunakan `shared_preferences`.
   - **`app_exception.dart`**: Penanganan error (*Custom Exception Handling*) untuk berbagai kode status HTTP (`FetchDataException`, `BadRequestException`, `UnauthorisedException`, `UnprocessableEntityException`, `InvalidInputException`).
   - **`api.dart`**: Pembungkus (*wrapper*) HTTP client (`GET`, `POST`, `PUT`, `DELETE`) dengan penyisipan header `Authorization: Bearer <token>`.
   - **`api_url.dart`**: Konfigurasi terpusat seluruh endpoint REST API (`/registrasi`, `/login`, `/produk`, `/produk/{id}/update`, `/produk/{id}`).
2. **Arsitektur BLoC / Controller (`lib/bloc/`)**:
   - **`registrasi_bloc.dart`**: Mengirim request registrasi akun ke endpoint `POST /registrasi`.
   - **`login_bloc.dart`**: Mengirim request autentikasi ke endpoint `POST /login`.
   - **`logout_bloc.dart`**: Menghapus sesi token dari local storage saat logout.
   - **`produk_bloc.dart`**: Mengelola operasi CRUD produk ke REST API (`getProduks`, `addProduk`, `updateProduk`, `deleteProduk`).
3. **Common Dialog Widget (`lib/widget/`)**:
   - **`success_dialog.dart`**: Custom pop-up dialog informasi ketika operasi berhasil (**SUKSES**).
   - **`warning_dialog.dart`**: Custom pop-up dialog informasi ketika operasi gagal (**GAGAL**).
4. **Integrasi Penuh Halaman UI (`lib/ui/` & `lib/main.dart`)**:
   - Pengecekan status login otomatis pada `main.dart` (`isLogin()`).
   - Integrasi halaman Registrasi, Login, Logout, Tampil List Produk (`FutureBuilder`), Tambah Produk (`simpan()`), Ubah Produk (`ubah()`), dan Hapus Produk (`confirmHapus()`).

---

## Struktur Folder Project

```text
modul5/
├── toko-api/                              # Backend CodeIgniter 4 RESTful API
│   ├── app/
│   │   ├── Config/
│   │   │   ├── Database.php               # Konfigurasi database toko_api
│   │   │   └── Routes.php                 # Routing endpoint API
│   │   ├── Controllers/
│   │   │   ├── RestfulController.php
│   │   │   ├── RegistrasiController.php
│   │   │   ├── LoginController.php
│   │   │   └── ProdukController.php
│   │   └── Models/
│   │       ├── MRegistrasi.php
│   │       ├── MMember.php
│   │       ├── MLogin.php
│   │       └── MProduk.php
│   └── toko_api.sql
│
├── android/                               # Konfigurasi Android (JVM RAM 2 GB)
├── lib/
│   ├── main.dart                          # Entry point & pengecekan session token
│   ├── helpers/
│   │   ├── api.dart                       # HTTP request helper (GET, POST, PUT, DELETE)
│   │   ├── api_url.dart                   # Daftar konstanta URL endpoint API
│   │   ├── app_exception.dart             # Custom exception error handling
│   │   └── user_info.dart                 # Manajemen token & userID SharedPreferences
│   ├── bloc/
│   │   ├── login_bloc.dart                # BLoC autentikasi login
│   │   ├── logout_bloc.dart               # BLoC hapus sesi logout
│   │   ├── registrasi_bloc.dart           # BLoC pendaftaran member
│   │   └── produk_bloc.dart               # BLoC CRUD data produk
│   ├── model/
│   │   ├── login.dart                     # Model parsing JSON Login
│   │   ├── registrasi.dart                # Model parsing JSON Registrasi
│   │   └── produk.dart                    # Model parsing JSON Produk
│   ├── widget/
│   │   ├── success_dialog.dart            # Dialog custom notifikasi SUKSES
│   │   └── warning_dialog.dart            # Dialog custom notifikasi GAGAL
│   └── ui/
│       ├── registrasi_page.dart           # UI & fungsi submit Registrasi ke API
│       ├── login_page.dart                # UI & fungsi submit Login ke API
│       ├── produk_page.dart               # UI List Produk (FutureBuilder API) & Logout
│       ├── produk_form.dart               # UI & fungsi Simpan / Ubah Produk ke API
│       └── produk_detail.dart             # UI Detail & fungsi Hapus Produk ke API
├── pubspec.yaml                           # Dependensi http & shared_preferences
└── README.md                              # Dokumentasi Modul 5
```

---

## Cara Menjalankan Aplikasi

1. **Pastikan Backend REST API (`toko-api`) Aktif**:
   - Nyalakan Apache & MySQL (XAMPP / Laragon).
   - Pastikan database `toko_api` sudah di-import dari `toko-api/toko_api.sql`.
   - Sesuaikan `baseUrl` pada `lib/helpers/api_url.dart`:
     - Gunakan `http://10.0.2.2/toko-api/public` jika memakai Emulator Android.
     - Gunakan IPv4 Laptop (misal `http://192.168.x.x/toko-api/public`) jika memakai HP fisik lewat Wi-Fi/Hotspot yang sama.
2. **Jalankan Aplikasi Flutter**:
   ```powershell
   cd modul5
   flutter pub get
   flutter run
   ```

---

## Hasil Tangkapan Layar (Screenshots)

Simpan hasil screenshot dari layar HP ke dalam folder `screenshots/` di root repositori dengan format nama file berikut:

### 1. Registrasi Berhasil (Modul Hal. 18)
> Letakkan screenshot di: `screenshots/modul5_registrasi_sukses.png`

![Registrasi Sukses](../screenshots/modul5_registrasi_sukses.png)

### 2. Login Gagal / Warning Dialog (Modul Hal. 21)
> Letakkan screenshot di: `screenshots/modul5_login_gagal.png`

![Login Gagal](../screenshots/modul5_login_gagal.png)

### 3. List Produk dari REST API (Modul Hal. 27)
> Letakkan screenshot di: `screenshots/modul5_list_produk_api.png`

![List Produk API](../screenshots/modul5_list_produk_api.png)

### 4. Tambah & Ubah Produk ke REST API
> Letakkan screenshot di: `screenshots/modul5_crud_produk.png`

![CRUD Produk](../screenshots/modul5_crud_produk.png)
