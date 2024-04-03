import 'package:attendance/controller/absensi_controller.dart';
import 'package:attendance/routes/route_helper.dart';
import 'package:attendance/theme.dart';
import 'package:attendance/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.find<AbsensiController>().fetchAbsensis();

    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: () => Get.toNamed(RouteHelper.getLokasi()),
                title: Text("Daftar Lokasi"),
              )
            ],
          ),
        ),
        body: GetBuilder<AbsensiController>(
          builder: (controller) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 60,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.menu,
                                size: 30,
                                color: Colors.black54,
                              ),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                        ],
                      ),
                    ),
                    PrimaryButton(
                        text: "Check In",
                        onPressed: () {
                          controller.handleAddButton();
                        }),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Riwayat Terakhir",
                      style: primaryTextStyle.copyWith(),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    for (var article in controller.products)
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Check in di ${article.lokasi}",
                                style: primaryTextStyle,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                article.date ?? "",
                                style: secondaryTextStyle,
                              )
                            ],
                          ))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
