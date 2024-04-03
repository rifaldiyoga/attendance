import 'dart:convert';

import 'package:attendance/models/absensi.dart';
import 'package:attendance/pages/absensi/absensi_list_page.dart';
import 'package:attendance/pages/absensi/detail_absensi_page.dart';
import 'package:attendance/pages/home_page.dart';
import 'package:attendance/pages/lokasi/lokasi_page.dart';
import 'package:attendance/pages/lokasi/tambah_lokasi_page.dart';
import 'package:attendance/pages/splashscreen_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String _splashScreen = "/splash";
  static const String _initial = "/";
  static const String _lokasi = "/lokasi";
  static const String _absensi = "/absensi";
  static const String _detailAbsensi = "/detail-absensi";
  static const String _tambahLokasi = "/tambah-lokasi";

  static String getSplashScreen() => _splashScreen;
  static String getHome() => _initial;
  static String getLokasi() => _lokasi;

  static String getAbsensi() => _absensi;
  static String getDetailAbsensi(Absensi absensi) =>
      "$_detailAbsensi?detail=${json.encode(absensi.toJson())}";

  static String getTambahLokasi() => _tambahLokasi;

  static List<GetPage> routes = [
    GetPage(name: _initial, page: () => const HomePage()),
    GetPage(name: _splashScreen, page: () => const SplashScreenPage()),
    GetPage(name: _lokasi, page: () => const LokasiPage()),
    GetPage(name: _tambahLokasi, page: () => const TambahLokasiPage()),
    GetPage(name: _absensi, page: () => const AbsensiListPage()),
    GetPage(
        name: _detailAbsensi,
        page: () {
          var param = Get.parameters["detail"]!;
          var pengajuan = Absensi.fromJson(json.decode(param));
          return DetailAbsensiPage(
            absensi: pengajuan,
          );
        }),
  ];
}
