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
  void onInit() async{
    await setupContact(); // Call Setup method on initialization
     super.onInit();
    createcontroller();// initialized textEditing Controller
  }

  // Write data items of contact into List
  List contacts = <Contact>[];

  late Contact contactDetail;
  late int index;

  //  Add New Element in Contact Data Model
  addContact(Contact contact,
  ) {
    contacts.add(Contact(
      userName: contact.userName,
      phoneNo: contact.phoneNo,
      fatherName: contact.fatherName,
      motherName: contact.motherName,
      emailAddress: contact.emailAddress,
      location: contact.location,
    ));
    update();
  }

// Update data in Contact at particular index of contact List
  updateContact(Contact contact, int index) {
    contacts[index] = Contact(
      userName: contact.userName,
      phoneNo: contact.phoneNo,
      fatherName: contact.fatherName,
      motherName: contact.motherName,
      emailAddress: contact.emailAddress,
      location: contact.location,
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
        contacts.add(Contact(
            userName: contact['userName'],
            fatherName: contact['fatherName'],
            motherName: contact['motherName'],
            emailAddress: contact['emailAddress'],
           phoneNo: contact['phoneNo'],
          location: contact['location']
        ));
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

  void createEditController(Contact contact) {
    userNameController= TextEditingController(text: '${contact.userName}');
    numberController  = TextEditingController(text:'${contact.phoneNo}');
    fNameController = TextEditingController(text:'${contact.fatherName}');
    mNameController    = TextEditingController(text:'${contact.motherName}');
    addressController= TextEditingController(text:'${contact.location}');
    emailController = TextEditingController(text: '${contact.emailAddress}');
  }

  void clearController() {
    userNameController.clear();
    numberController.clear();
    fNameController.clear();
    mNameController.clear();
    addressController.clear();
    emailController.clear();
  }



// viewpage function for routing of viewpage and pass Contact list to that page
  viewpage(contactsDetail) {
    this.contactDetail = contactsDetail;
    Get.toNamed(Routes.viewPage);
  }

// editPage function for routing of add_Edit_page and pass index data to that page
  editPage(index) {
    this.index = index;
    Get.toNamed(Routes.addOrEditPage, arguments: true);
  }

}
