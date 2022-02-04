import 'dart:convert';
import 'package:dio_practice/modal/contact.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddContactInList extends GetxController {
  final dataStorage = GetStorage();


  @override
  void onInit() {
    super.onInit();
    setupContact(); // Call Setup method on initialization
  }

  // Write data items of contact into List
  List contacts = <Contact>[].obs;



  //  Add New Element in Contact Data Model
  addContact(
    String userName,
    String phoneNo,
    String fatherName,
    String motherName,
    String email,
    String address,
  ) {
    contacts.add(Contact(
      userName: userName,
      phoneNo: phoneNo,
      fatherName: fatherName,
      motherName: motherName,
      emailAddress: email,
      location: address,
    ));
  }



// Update data in Contact at particular index of contact List
  updateContact(String userName, String phoneNo, String fatherName,
      String motherName, String email, String address, int index) {
    contacts[index] = Contact(
      userName: userName,
      phoneNo: phoneNo,
      fatherName: fatherName,
      motherName: motherName,
      emailAddress: email,
      location: address,
    );
  }

  //  Read Data from list & save Contact data locally  into contact list
  setupContact() {
    String stringContact = dataStorage.read('contactData')??'';
    if (stringContact != '') {
      List contactList = jsonDecode(stringContact);
      for (var contact in contactList) {
        contacts.add(Contact().fromJson(contact));
      }}
      else{
    return;

    }
  }

//  Write Data Element in Contact
  void saveTodo() {
    List items = contacts.map((e) => e.toJson()).toList();
    dataStorage.write('contactData', jsonEncode(items));
  }
}
