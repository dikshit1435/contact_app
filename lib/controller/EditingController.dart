import 'package:dio_practice/modal/contact.dart';
import 'package:get/get.dart';

class EditContact extends GetxController {

  var isEdit = false.obs; // for checking user press edit contact or not
  late Contact contactList;
  var index = 0;

  // function for accessing current index contact list
  void GetList(Contact contacts) {
    contactList = contacts;
  }
}
