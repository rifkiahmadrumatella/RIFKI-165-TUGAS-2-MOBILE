#  Assignment 2

* **Nama:** Ahmad Nizar Rusdiawan  
* **NIM:** 202310370311186  
* **Kelas:** Pemrograman Mobile C

## 🧱 Struktur Folder

```
lib/
 ├── binding/
 │    ├── login_binding.dart
 │    ├── signup_binding.dart
 │    └── profile_binding.dart
 ├── controller/
 │    ├── login_controller.dart
 │    ├── signup_controller.dart
 │    └── profile_controller.dart
 ├── view/
 │    ├── login_view.dart
 │    ├── signup_view.dart
 │    └── profile_view.dart
 ├── routes/
 │    ├── app_pages.dart
 │    └── app_routes.dart
 └── main.dart
```

## 🧭 Penjelasan Singkat

Aplikasi **login_theater** memiliki tiga halaman utama sesuai dengan desain tugas, yaitu:

1. **Halaman Login:** Tempat pengguna masuk ke aplikasi.  
2. **Halaman Sign-up:** Tempat pengguna baru mendaftar akun.  
3. **Halaman Theater:** Menampilkan daftar bioskop yang ada di sekitar lokasi pengguna.

Fokus utama dari tugas ini adalah membangun tampilan (UI) sesuai desain serta mengimplementasikan fitur **deteksi lokasi pengguna secara otomatis**.

---

## ⚙️ Cara Kerja Aplikasi

Aplikasi ini dibangun menggunakan **arsitektur GetX**, dengan pembagian struktur berikut:  
- **Binding:** Mengatur inisialisasi controller dan dependency.  
- **Controller:** Mengelola logika dan state.  
- **View:** Menampilkan antarmuka pengguna.  
- **Routes:** Mengatur navigasi antar halaman.

### 🧩 Mekanisme Utama

1. **Routing (Navigasi):**  
   Navigasi antar halaman diatur dalam file `app_pages.dart` dan `app_routes.dart`.

2. **Manajemen State (Logika):**  
   Halaman Theater menggunakan `profile_controller.dart` untuk mengatur data dan state lokasi.

3. **Deteksi Lokasi:**
   - Saat halaman Theater (`profile_view.dart`) dibuka, file `profile_binding.dart` akan memanggil `profile_controller.dart`.
   - `ProfileController` menjalankan fungsi `_determinePosition()` secara otomatis di dalam `onInit()`.
   - Fungsi tersebut menggunakan *package* **`geolocator`** untuk meminta izin lokasi dan mendapatkan koordinat perangkat.
   - Setelah koordinat diperoleh, *package* **`geocoding`** mengonversinya menjadi alamat lengkap.
   - Nama kota disimpan dalam variabel reaktif `locationName`.
   - Widget `Obx` pada `ProfileView` akan otomatis memperbarui teks kota di UI.

4. **Tampilan Halaman Theater:**
   - Daftar bioskop (seperti XXI, CGV, dll.) ditampilkan menggunakan `ListView.builder`.
   - Setiap item menggunakan `Card` dan `ExpansionTile` untuk menampilkan informasi dengan gaya *dropdown*.

---

## 🚀 Cara Menjalankan Aplikasi

### 1. Persiapan
Pastikan **Flutter SDK** sudah terinstal di komputer Anda.

### 2. Instalasi
1. Kloning repositori ini.  
2. Buka terminal di direktori proyek.  
3. Jalankan perintah berikut untuk mengunduh semua *package* yang diperlukan:
   ```bash
   flutter pub get

### 3. Konfigurasi Izin Lokasi

Untuk fitur deteksi lokasi, tambahkan izin lokasi pada platform yang digunakan.

#### 🔹 Android

Buka file `android/app/src/main/AndroidManifest.xml`, lalu tambahkan kode berikut di dalam tag `<manifest>`:

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

#### 🔹 iOS

Buka file `ios/Runner/Info.plist` dan tambahkan:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Aplikasi ini membutuhkan akses lokasi untuk menampilkan daftar bioskop di kota Anda.</string>
```

---

### 4. Menjalankan Aplikasi

1. Hubungkan perangkat atau jalankan emulator.

2. Jalankan aplikasi dengan perintah:

   ```bash
   flutter run
   ```

3. Aplikasi akan terbuka di **halaman Login**.
   Di bagian bawah terdapat teks berwarna biru *“Register here”* untuk menuju ke halaman **Sign-up**.

   <br>
   <img width="442" height="1020" alt="Login" src= "https://github.com/user-attachments/assets/316a13a0-eeef-492f-b23d-f42546252fd9" />
   <img width="445" height="1019" alt="SignUp" src="https://github.com/user-attachments/assets/abf530e3-c13d-4bed-be57-7a0886e7a46c" />

4. Setelah berhasil login, pengguna akan diarahkan ke halaman **Theater**.

   <br>
   <img width="446" height="1015" alt="Theater" src="https://github.com/user-attachments/assets/a2edd9f7-d704-4275-9da9-52933fe62127" />

5. Saat halaman Theater pertama kali dibuka, aplikasi akan **meminta izin lokasi**.

6. Pilih **Allow (Izinkan)** untuk melanjutkan.

7. Teks *“Loading...”* akan berubah menjadi **nama kota pengguna** setelah lokasi berhasil dideteksi.

   <br>
   <img width="443" height="1014" alt="Lokasi" src="https://github.com/user-attachments/assets/b39fd33f-3cf5-45ea-82e6-5bb759bdf3a4" />


---
✨ **Dibuat dengan semangat Super Saiyan!** ⚡

