import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Daftar Lokasi"),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60, left: 20),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      onPressed: () => scaffoldKey.currentState?.openDrawer()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
