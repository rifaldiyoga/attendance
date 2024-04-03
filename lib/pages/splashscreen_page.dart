import 'dart:async';

import 'package:attendance/routes/route_helper.dart';
import 'package:attendance/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  void requestPermissions() async {
    // Request permission to access location
    var status = await Permission.location.request();

    if (status.isGranted) {
      // Permission granted, proceed with your logic
      print("Location permission granted");
    } else {
      // Permission denied, handle accordingly
      print("Location permission denied");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermissions();
    Timer(const Duration(seconds: 2), () async {
      Get.offNamed(RouteHelper.getHome());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 150,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Attendance App",
              textAlign: TextAlign.center,
              style: blueTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }
}
