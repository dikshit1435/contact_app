import 'package:dio_practice/controller/add_contact_controller.dart';
import 'package:dio_practice/controller/validation_controller.dart';
import 'package:get/get.dart';

class AllBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddContactInList());
    Get.lazyPut(()=>ValidationController());
  }

}