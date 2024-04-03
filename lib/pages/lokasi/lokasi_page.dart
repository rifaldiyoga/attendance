import 'package:attendance/controller/lokasi_controller.dart';
import 'package:attendance/routes/route_helper.dart';
import 'package:attendance/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
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
    Get.find<LokasiController>().fetchLokasis();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          onPressed: () {
            Get.toNamed(RouteHelper.getTambahLokasi());
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text(
          'Daftar Lokasi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          isScrollable: false,
          labelColor: primaryColor,
          indicatorColor: primaryColor,
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
      body: GetBuilder<LokasiController>(builder: (lokasiController) {
        Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

        return TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            ListView.builder(
                itemCount: lokasiController.products.length,
                itemBuilder: (context, index) {
                  print(lokasiController.products[index].namaLokasi ?? "");
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lokasiController.products[index].namaLokasi ?? "",
                              style: primaryTextStyle.copyWith(fontSize: 16),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              lokasiController.products[index].coordinate ?? "",
                              style: secondaryTextStyle,
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            lokasiController
                                .deleteLokasi(lokasiController.products[index]);
                          },
                        )
                      ],
                    ),
                  );
                }),
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: lokasiController.markers.values.firstOrNull?.position ??
                    LatLng(37.7749, -122.4194),
                zoom: 12,
              ),
              markers: lokasiController.markers.values.toSet(),
              onMapCreated: (controller) {},
            ),
          ],
        );
      }),
    );
  }
}
