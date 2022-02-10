import 'dart:io';

import 'package:dio_practice/app/controller/home_controller.dart';
import 'package:dio_practice/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends GetView<HomeController> {
  final padding = EdgeInsets.symmetric(horizontal: 10);
  @override
  Widget build(BuildContext context) {
    final name = 'Dikshit Sharma ';
    final email = 'dikshit.d.k.2002@gmail.com';

    return Drawer(
      child: Material(
        color: Colors.blueAccent,
        child: ListView(
          children: <Widget>[
            buildHeader(
              name: name,
              email: email,
            ),

            Container(
              padding: padding,
              child: Column(
                children: [
                  Divider(color: Colors.white54,height: 15,),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Add New Contact',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Favourites',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'About us',
                    icon: Icons.library_books,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  Divider(color: Colors.white,height: 20,),
                  buildMenuItem(
                    text: 'Close App',
                    icon: Icons.clear,
                    onClicked: () => selectedItem(context, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 30)),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(Icons.person),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white54),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blueAccent,
                child: IconButton(
                    onPressed:(){Get.back();},
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Get.back();

    switch (index) {
      case 0:
        controller.createcontroller();
        Get.toNamed(Routes.addOrEditPage, arguments: false);
        break;
      case 3:
        exit(0);
        break;
    }
  }
}
