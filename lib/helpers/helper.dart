import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Helper {
  static LatLng? convertCoordinate(String coordinate) {
    var list = coordinate.split(",");
    return list.length == 2
        ? LatLng(double.parse(list[0]), double.parse(list[1]))
        : null;
  }

  static showMessage(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        instantInit: true,
        margin: EdgeInsets.all(16));
  }
}
