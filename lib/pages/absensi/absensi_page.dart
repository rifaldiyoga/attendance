import 'package:attendance/controller/absensi_controller.dart';
import 'package:attendance/routes/route_helper.dart';
import 'package:attendance/theme.dart';
import 'package:attendance/widgets/button.dart';
import 'package:attendance/widgets/item_absensi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbsensiPage extends StatefulWidget {
  const AbsensiPage({super.key});

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  _header() {
    return Container(
      margin: const EdgeInsets.only(top: 32, bottom: 16),
      child: Row(
        children: [
          Center(
            child: ClipOval(
              child: Image(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, exception, stackTrack) => Image.asset(
                  'assets/images/image_profile.jpg',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat datang di",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Attendance App",
                  style:
                      primaryTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttonAbsen(AbsensiController controller) {
    return PrimaryButton(
        text: "",
        custom: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
            ),
            Text(
              controller.lastAbsensi?.type == "o" ? "Check In" : "Check Out",
              style:
                  onPrimaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              size: 30,
              color: Colors.white,
            )
          ],
        ),
        onPressed: () {
          controller.handleAddButton();
        });
  }

  @override
  Widget build(BuildContext context) {
    Get.find<AbsensiController>().fetchAbsensis();
    Get.find<AbsensiController>().getLastAbsensi();

    return GetBuilder<AbsensiController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(16),
            child: _buttonAbsen(controller),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  Text(
                    "Riwayat Terakhir",
                    style:
                        primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  for (var model in controller.products)
                    ItemAbsensi(
                      absensi: model,
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
