import 'package:attendance/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LokasiPage extends StatefulWidget {
  const LokasiPage({super.key});

  @override
  State<LokasiPage> createState() => _LokasiPageState();
}

class _LokasiPageState extends State<LokasiPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Daftar Lokasi'),
        bottom: TabBar(
          isScrollable: false,
          controller: _tabController,
          tabs: [
            Tab(
              text: "Berdasarkan Nama",
            ),
            Tab(
              text: "Berdasarkan Map",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: primaryTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "coordinate",
                    style: secondaryTextStyle,
                  )
                ],
              ),
            );
          }),
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.7749, -122.4194), // San Francisco coordinates
              zoom: 12,
            ),
          ),
        ],
      ),
    );
  }
}
