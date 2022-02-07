import 'package:dio_practice/app/binding/homebinding.dart';
import 'package:dio_practice/app/ui/pages/add_or_edit_contact.dart';
import 'package:dio_practice/app/ui/pages/list_page.dart';
import 'package:dio_practice/app/ui/pages/view_detail.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL, page: () => ListPage(), binding: AllBinding()),
    GetPage(
        name: Routes.VIEWPAGE,
        page: () => ViewDetail(),),
    GetPage(
      name: Routes.ADDOREDITPAGE,
      page: () => AddEditPage(),)

  ];

}