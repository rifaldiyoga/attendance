import 'package:attendance/helpers/database_helper.dart';
import 'package:attendance/helpers/date_formaters.dart';
import 'package:attendance/helpers/helper.dart';
import 'package:attendance/models/absensi.dart';
import 'package:attendance/models/lokasi.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class AbsensiController extends GetxController {
  List<Absensi> products = [];
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  var imagePath = "";

  @override
  void onInit() {
    products = [];
    fetchAbsensis();
    print(products);
    super.onInit();
  }

  fetchAbsensis() async {
    AttendanceDatabaseHelper.db.getAbsensiList().then((productList) {
      products = productList;
      update();
    });
  }

  void addAbsensi(Absensi product) async {
    AttendanceDatabaseHelper.db
        .insertAbsensi(product)
        .then((value) => updateList(product));
  }

  void updateList(Absensi product) async {
    var result = await fetchAbsensis();
    print(result.toString());
    if (result != null) {
      final index = products.indexOf(product);
      print(index);
      products[index] = product;
      update();
    }
  }

  void handleAddButton() async {
    List<Lokasi> lokasi = await AttendanceDatabaseHelper.db.getLokasiList();
    final position = await _geolocatorPlatform.getCurrentPosition();
    List<Lokasi> filteredList = [];
    lokasi.forEach((element) {
      var list = Helper.convertCoordinate(element.coordinate ?? "");
      double distance = _geolocatorPlatform.distanceBetween(
          position.latitude, position.longitude, list[0], list[1]);
      print(distance);
      if (distance <= 50) {
        filteredList.add(element);
      }
    });
    print(filteredList.toString());
    if (filteredList.firstOrNull != null) {
      var product = Absensi(
          date: DateFormater.dateTimeToString(
              DateTime.now(), DateFormater.DATE_TIME_FORMAT),
          lokasiId: filteredList.firstOrNull?.id,
          lokasi: filteredList.firstOrNull?.namaLokasi,
          coordinate: "${position.latitude},${position.longitude}");
      addAbsensi(product);
    } else {
      Get.snackbar("Gagal Check In", "Jarak lebih dari 50 meter");
    }
  }
}
