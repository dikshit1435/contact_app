import 'package:dio_practice/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/binding/homebinding.dart';
import 'app/ui/pages/list_page.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    getPages: AppPages.pages,
    title: 'Contact',
  ));
}
