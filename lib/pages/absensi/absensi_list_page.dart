import 'package:attendance/controller/absensi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbsensiListPage extends StatefulWidget {
  const AbsensiListPage({super.key});

  @override
  State<AbsensiListPage> createState() => _AbsensiListPageState();
}

class _AbsensiListPageState extends State<AbsensiListPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AbsensiController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Riwayat"),
          ),
          body: Container(
            child: Column(
              children: [],
            ),
          ),
        );
      },
    );
  }
}
