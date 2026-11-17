// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:tokokita/ui/login_page.dart';
import 'package:tokokita/ui/registrasi_page.dart';
import 'package:tokokita/ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      // Sesuai materi Modul 4:
      // - Halaman 33: RegistrasiPage()
      // - Halaman 36: LoginPage()
      // - Halaman 42: ProdukPage() (aktif sebagai tampilan akhir)
      home: ProdukPage(),
    );
  }
}
