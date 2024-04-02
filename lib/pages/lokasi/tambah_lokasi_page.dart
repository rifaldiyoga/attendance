import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TambahLokasiPage extends StatefulWidget {
  const TambahLokasiPage({super.key});

  @override
  State<TambahLokasiPage> createState() => _TambahLokasiPageState();
}

class _TambahLokasiPageState extends State<TambahLokasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target:
                      LatLng(37.7749, -122.4194), // San Francisco coordinates
                  zoom: 12,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Tes"),
                  TextField(),
                  ButtonTheme(child: Text("Tes"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
