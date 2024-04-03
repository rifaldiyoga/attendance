import 'package:attendance/helpers/database_helper.dart';
import 'package:attendance/helpers/date_formaters.dart';
import 'package:attendance/helpers/helper.dart';
import 'package:attendance/models/absensi.dart';
import 'package:attendance/models/lokasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AbsensiController extends GetxController {
  List<Absensi> products = [];
  Absensi? lastAbsensi = null;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  var imagePath = "";

  @override
  void onInit() {
    products = [];
    getLastAbsensi();
    fetchAbsensis();
    print(products);
    super.onInit();
  }

  getLastAbsensi() async {
    AttendanceDatabaseHelper.db.getLastAbsensi().then((value) {
      lastAbsensi = value;
      update();
    });
  }

  fetchAbsensis() async {
    AttendanceDatabaseHelper.db.getAbsensiList().then((productList) {
      products = productList;
      update();
    });
  }

  void addAbsensi(Absensi product) async {
    AttendanceDatabaseHelper.db.insertAbsensi(product).then((value) {
      updateList(product);
      getLastAbsensi();
      Helper.showMessage(
        "Berhasi tambah data",
        ":)",
      );
    });
  }

  void updateList(Absensi product) async {
    var result = await fetchAbsensis();
    print(result.toString());
    if (result != null) {
      final index = products.indexOf(product);
      products[index] = product;
      update();
    }
  }

  void handleAddButton() async {
    var status = await Permission.location.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      Helper.showMessage("Izin Ditolak", "Izinkan aplikasi untuk akses lokasi");
      return;
    }

    List<Lokasi> lokasi = await AttendanceDatabaseHelper.db.getLokasiList();
    final position = await _geolocatorPlatform.getCurrentPosition();
    List<Lokasi> filteredList = [];
    lokasi.forEach((element) {
      var list = Helper.convertCoordinate(element.coordinate ?? "")!;
      double distance = _geolocatorPlatform.distanceBetween(
          position.latitude, position.longitude, list.latitude, list.longitude);

      element.distance = distance;

      if (distance <= 50) {
        filteredList.add(element);
      }
    });
    filteredList.sort((a, b) {
      return (a.distance!.compareTo(b.distance!));
    });

    if (filteredList.firstOrNull == null) {
      Helper.showMessage(
        "Gagal Check In",
        "Jarak lebih dari 50 meter",
      );
      return;
    }
    var product = Absensi(
        type: lastAbsensi?.type == "i" ? "o" : "i",
        date: DateFormater.dateTimeToString(
            DateTime.now(), DateFormater.DATE_TIME_FORMAT),
        lokasiId: filteredList.firstOrNull?.id,
        lokasi: filteredList.firstOrNull?.namaLokasi,
        coordinate: "${position.latitude},${position.longitude}");
    addAbsensi(product);
  }
}
