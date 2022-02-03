import 'package:dio_practice/view/list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    home: ListPage(),
    title: 'Contact',
  ));
}
