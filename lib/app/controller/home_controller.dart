import 'dart:convert';
import 'package:dio_practice/app/modal/contact.dart';
import 'package:dio_practice/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late TextEditingController userNameController,
      numberController,
      fNameController,
      mNameController,
      addressController,
      emailController;

  @override
  void onInit() {
    super.onInit();
    setupContact(); // Call Setup method on initialization
    createcontroller();// initialized textEditing Controller
  }

  // Write data items of contact into List
  List contacts = <Contact>[];

  late Contact contactDetail;
  late int index;

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
    update();
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
    update();
  }

// deleteContact function for deleting contact data from particular index
  deleteContact(int index) {
    contacts.removeAt(index);
    update();
  }

  //  Read Data from list & save Contact data locally  into contact list
  setupContact() async {
    final SharedPreferences sharedPrefrences =
        await SharedPreferences.getInstance();
    String stringContact = sharedPrefrences.getString('contactData') ?? '';
    if (stringContact != '') {
      List contactList = jsonDecode(stringContact);
      for (var contact in contactList) {
        contacts.add(Contact().fromJson(contact));
      }
    } else {
      return;
    }
  }

//  Write Data Element in Contact
  saveTodo() async {
    final SharedPreferences sharedPrefrences =
        await SharedPreferences.getInstance();
    List items = contacts.map((e) => e.toJson()).toList();
    sharedPrefrences.setString('contactData', jsonEncode(items));
  }

// For creating textEditing controller for all variable
  void createcontroller() {
    userNameController = TextEditingController();
    numberController = TextEditingController();
    fNameController = TextEditingController();
    mNameController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
  }

// viewpage function for routing of viewpage and pass Contact list to that page
  viewpage(contactsDetail) {
    this.contactDetail = contactsDetail;
    Get.toNamed(Routes.VIEWPAGE);
  }

// editPage function for routing of add_Edit_page and pass index data to that page
  editPage(index) {
    this.index = index;
    Get.toNamed(Routes.ADDOREDITPAGE, arguments: true);
  }
}
