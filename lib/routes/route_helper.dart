import 'dart:convert';

import 'package:attendance/pages/home_page.dart';
import 'package:attendance/pages/lokasi/lokasi_page.dart';
import 'package:attendance/pages/lokasi/tambah_lokasi_page.dart';
import 'package:attendance/pages/splashscreen_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String _splashScreen = "/splash";
  static const String _initial = "/";
  static const String _lokasi = "/lokasi";
  static const String _tambahLokasi = "/tambah-lokasi";

  static String getSplashScreen() => _splashScreen;
  static String getHome() => _initial;
  static String getLokasi() => _lokasi;
  static String getTambahLokasi() => _tambahLokasi;
  // static String getDetailPengajuan(PengajuanModel pengajuanModel) =>
  //     "$_detail_pengajuan?pengajuan=${json.encode(pengajuanModel.toJson())}";
  // static String getRiwayatStatus(PengajuanModel pengajuanModel) =>
  //     "$_riwayat_status?pengajuan=${json.encode(pengajuanModel.toJson())}";
  // static String getArticle(ArticleModel articleModel) =>
  //     "$_article?article=${json.encode(articleModel.toJson())}";
  // static String getPengajuan(LayananModel layananModel) =>
  //     "$_pengajuan?layanan=${json.encode(layananModel.toJson())}";
  // static String getTandaTangan() => "$_tanda_tangan";

  static List<GetPage> routes = [
    GetPage(name: _initial, page: () => const HomePage()),
    GetPage(name: _splashScreen, page: () => const SplashScreenPage()),
    GetPage(name: _lokasi, page: () => const LokasiPage()),
    GetPage(name: _tambahLokasi, page: () => const TambahLokasiPage()),
    //   GetPage(name: _layanan, page: () => const LayananListPage()),
    //   GetPage(name: _tanda_tangan, page: () => const TandaTanganPage()),
    //   GetPage(
    //       name: _article,
    //       page: () {
    //         var param = Get.parameters["article"]!;
    //         var article = ArticleModel.fromJson(json.decode(param));
    //         return ArticlePage(
    //           articleModel: article,
    //         );
    //       }),
    //   GetPage(
    //       name: _detail_pengajuan,
    //       page: () {
    //         var param = Get.parameters["pengajuan"]!;
    //         var pengajuan = PengajuanModel.fromJson(json.decode(param));
    //         return DetailPengajuanPage(
    //           pengajuanModel: pengajuan,
    //         );
    //       }),
    //   GetPage(
    //       name: _riwayat_status,
    //       page: () {
    //         var param = Get.parameters["pengajuan"]!;
    //         var pengajuan = PengajuanModel.fromJson(json.decode(param));
    //         return RiwayatStatusPage(
    //           pengajuanModel: pengajuan,
    //         );
    //       }),
    //   GetPage(
    //       name: _pengajuan,
    //       page: () {
    //         var param = Get.parameters["layanan"]!;
    //         var article = LayananModel.fromJson(json.decode(param));
    //         return PengajuanPage(
    //           layananModel: article,
    //         );
    //       }),
  ];
}
