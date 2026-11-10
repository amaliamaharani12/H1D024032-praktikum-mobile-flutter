// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:modul2/hello_world.dart';
import 'package:modul2/column_widget.dart';
import 'package:modul2/row_widget.dart';
import 'package:modul2/ui/produk_form.dart';
import 'package:modul2/ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Aplikasi Flutter Pertama",
      // Sesuai instruksi akhir modul (halaman 26): home berisi ProdukPage
      // Kamu juga bisa mengganti home di bawah ini untuk melihat bagian materi lainnya:
      // - HelloWorld()    -> Halaman 16-18
      // - ColumnWidget()  -> Halaman 19-20
      // - RowWidget()     -> Halaman 21
      // - ProdukForm()    -> Halaman 21-24
      // - ProdukPage()    -> Halaman 25-26
      home: const HelloWorld(),
    );
  }
}
