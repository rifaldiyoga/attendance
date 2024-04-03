import 'dart:ffi';
import 'dart:io';

import 'package:attendance/controller/lokasi_controller.dart';
import 'package:attendance/theme.dart';
import 'package:attendance/widgets/button.dart';
import 'package:attendance/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class TambahLokasiPage extends StatefulWidget {
  const TambahLokasiPage({super.key});

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  State<TambahLokasiPage> createState() => _TambahLokasiPageState();
}

class _TambahLokasiPageState extends State<TambahLokasiPage> {
  var namaLokasiController = TextEditingController();
  final controller = Get.put(LokasiController());

  void onAddLokasiScreenPress() {
    if (Get.arguments != null) {
      controller.handleAddButton(Get.arguments.id);
    } else {
      controller.handleAddButton();
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlacePicker(
        apiKey: "AIzaSyAo4JNqjra9WNIpbMRtPUsP7XlBX7Pe7jA",
        onPlacePicked: (result) {
          // Navigator.of(context).pop();
        },
        initialPosition: TambahLokasiPage.kInitialPosition,
        useCurrentLocation: true,
        resizeToAvoidBottomInset: false,
        enableMapTypeButton: false,
        usePlaceDetailSearch: true,
        selectedPlaceWidgetBuilder:
            (context, selectedPlace, state, isSearchBarFocused) {
          controller.pickResult = selectedPlace;
          return FloatingCard(
              bottomPosition: 0.0,
              leftPosition: 0.0,
              rightPosition: 0.0,
              width: 500,
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding: EdgeInsets.all(20),
                child: state == SearchingState.Searching
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        child: Column(
                          children: [
                            Text(
                              "Tambah Lokasi",
                              style: primaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(selectedPlace?.formattedAddress ?? ""),
                            SizedBox(
                              height: 16,
                            ),
                            CustomTextField(
                                titleText: "Nama Lokasi",
                                controller: controller.nameController),
                            SizedBox(
                              height: 16,
                            ),
                            PrimaryButton(
                                text: "Submit",
                                onPressed: () => onAddLokasiScreenPress())
                          ],
                        ),
                      ),
              ));
        },
      ),
    );
  }
}
