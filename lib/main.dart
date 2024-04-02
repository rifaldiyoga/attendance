import 'package:attendance/pages/home_page.dart';
import 'package:attendance/pages/lokasi/lokasi_page.dart';
import 'package:attendance/pages/lokasi/tambah_lokasi_page.dart';
import 'package:attendance/pages/splashscreen_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TambahLokasiPage(),
    );
  }
}
