import 'package:attendance/helpers/database_helper.dart';
import 'package:attendance/models/lokasi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class LokasiController extends GetxController {
  List<Lokasi> products = [];
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  TextEditingController nameController = TextEditingController();
  RxBool showSearchField = false.obs;
  PickResult? pickResult = null;

  var imagePath = "";

  @override
  void onInit() {
    products = [];
    fetchLokasis();
    print(products);
    super.onInit();
  }

  fetchLokasis() async {
    AttendanceDatabaseHelper.db.getLokasiList().then((productList) {
      print(productList);
      products = productList;
      productList.forEach((element) {
        var coordinate = element.coordinate?.split(",");
        markers[MarkerId(element.id.toString())] = Marker(
            markerId: MarkerId(element.id.toString()),
            position: LatLng(double.parse(coordinate?[0] ?? "0"),
                double.parse(coordinate?[1] ?? "0")),
            infoWindow: InfoWindow(
              title: element.namaLokasi,
              snippet: element.alamat,
            ));
      });
      update();
    });
  }

  void addLokasi(Lokasi product) {
    if (product.id != null) {
      AttendanceDatabaseHelper.db.updateLokasi(product).then((value) {
        updateLokasi(product);
      });
    } else {
      AttendanceDatabaseHelper.db
          .insertLokasi(product)
          .then((value) => updateList(product));
    }
  }

  void deleteLokasi(Lokasi product) {
    AttendanceDatabaseHelper.db
        .deleteLokasi(product.id!)
        .then((_) => products.remove(product));
    fetchLokasis();
  }

  void updateList(Lokasi product) async {
    var result = await fetchLokasis();
    if (result != null) {
      final index = products.indexOf(product);
      print(index);
      products[index] = product;
    }
  }

  void updateLokasi(Lokasi product) {
    AttendanceDatabaseHelper.db
        .updateLokasi(product)
        .then((value) => updateList(product));
  }

  void handleAddButton([id]) {
    if (id != null) {
      var product = Lokasi(
          id: id,
          namaLokasi: nameController.text,
          alamat: pickResult?.formattedAddress,
          coordinate: pickResult?.geometry?.location.toString());
      addLokasi(product);
    } else {
      var product = Lokasi(
          namaLokasi: nameController.text,
          alamat: pickResult?.formattedAddress,
          coordinate: pickResult?.geometry?.location.toString());
      addLokasi(product);
    }
    nameController.text = "";
    pickResult = null;
  }

  void toggleShowSearch() {
    showSearchField.value = !showSearchField.value;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
