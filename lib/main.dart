import 'package:dio_practice/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()  async{
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.initial,
    getPages: AppPages.pages,
    title: 'Contact',
    ),
  );
}
