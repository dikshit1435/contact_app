import 'package:dio_practice/app/binding/home_binding.dart';
import 'package:dio_practice/app/ui/pages/add_or_edit_contact.dart';
import 'package:dio_practice/app/ui/pages/list_page.dart';
import 'package:dio_practice/app/ui/pages/view_detail.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.initial, page: () => ListPage(), binding: HomeBinding()),
    GetPage(
        name: Routes.viewPage,
        page: () => ViewDetail(),),
    GetPage(
      name: Routes.addOrEditPage,
      page: () => AddEditPage(),)

  ];

}