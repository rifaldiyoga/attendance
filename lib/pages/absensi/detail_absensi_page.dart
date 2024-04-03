import 'package:attendance/helpers/helper.dart';
import 'package:attendance/models/absensi.dart';
import 'package:attendance/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailAbsensiPage extends StatelessWidget {
  final Absensi absensi;
  const DetailAbsensiPage({super.key, required this.absensi});

  @override
  Widget build(BuildContext context) {
    var cdAbsensi = Helper.convertCoordinate(absensi.coordinate ?? "");
    var cdLokasi =
        Helper.convertCoordinate(absensi.lokasiModel?.coordinate ?? "");

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: cdAbsensi!, zoom: 20),
              markers: Set.of([
                Marker(
                    markerId: MarkerId(""),
                    position: cdAbsensi!,
                    infoWindow: InfoWindow(
                        title: "Titik Absen", snippet: absensi.coordinate)),
                if (cdLokasi != null)
                  Marker(
                      markerId: MarkerId(""),
                      position: cdLokasi,
                      infoWindow: InfoWindow(
                          title: "Titik Lokasi", snippet: absensi.coordinate))
              ]),
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Detail Absensi",
                      style: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    absensi.type == "i"
                        ? "Check in di ${absensi.lokasi}"
                        : "Check out di ${absensi.lokasi}",
                    style: primaryTextStyle.copyWith(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    absensi.date ?? "",
                    style: secondaryTextStyle,
                  )
                ],
              ),
            ),
            bottom: 0,
            right: 0,
            left: 0,
          )
        ],
      ),
    );
  }
}
