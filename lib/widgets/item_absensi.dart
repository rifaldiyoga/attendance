import 'package:attendance/models/absensi.dart';
import 'package:attendance/routes/route_helper.dart';
import 'package:attendance/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemAbsensi extends StatelessWidget {
  final Absensi absensi;
  const ItemAbsensi({super.key, required this.absensi});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteHelper.getDetailAbsensi(absensi)),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Container(
                child: Icon(
                  absensi.type == "i"
                      ? Icons.login_outlined
                      : Icons.logout_outlined,
                  color: primaryColor,
                  size: 20,
                ),
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    absensi.type == "i"
                        ? "Check in di ${absensi.lokasi}"
                        : "Check out di ${absensi.lokasi}",
                    style: primaryTextStyle,
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
            ],
          )),
    );
  }
}
