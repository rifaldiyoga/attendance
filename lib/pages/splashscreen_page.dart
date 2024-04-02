import 'dart:async';

import 'package:attendance/theme.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () async {});
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
