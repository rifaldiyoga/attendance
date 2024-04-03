import 'package:attendance/controller/absensi_controller.dart';
import 'package:attendance/pages/absensi/absensi_page.dart';
import 'package:attendance/pages/lokasi/lokasi_page.dart';
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
  int _selectedIndex = 0;

  List<Widget> _pages = [AbsensiPage(), LokasiPage()];

  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                  activeIcon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pin_drop_outlined),
                  label: "Lokasi",
                  activeIcon: Icon(Icons.pin_drop))
            ]),
        body: _pages[_selectedIndex]);
  }
}
