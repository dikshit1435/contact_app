import 'dart:convert';
import 'package:dio_practice/controller/editingController.dart';
import 'package:dio_practice/modal/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'add_contact_controller.dart';

class ValidationController extends GetxController {
  Dio dio = new Dio();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final contactController = Get.find<AddContactInList>();
  final editController = Get.find<EditContact>();
  final dataStorage = GetStorage();

  late TextEditingController userNameController,
      numberController,
      fNameController,
      mNameController,
      addressController,
      emailController;
  var userName;
  var number;
  var fName;
  var mName;
  var address;
  var email;
// For Inserting Data in Api
  Future postData() async {
    try {
      final String pathurl = 'https://jsonplaceholder.typicode.com/posts';
      dynamic data = {'title': userName, 'body': number, 'userId': 0};

      var response = await dio.post(pathurl,
          data: data,
          options: Options(
              headers: {'Content-type': 'application/json; charset=UTF-8'}));
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    setupContact();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    userNameController.dispose();
    numberController.dispose();
    fNameController.dispose();
    mNameController.dispose();
    addressController.dispose();
    emailController.dispose();
  }

  //  Read Data from list & add Contact  into contact list
  setupContact() {
    String stringContact = dataStorage.read('contactData');
    if (stringContact.isNotEmpty) {
      List contactList = jsonDecode(stringContact);
      for (var contact in contactList) {
        contactController.contacts.add(Contact().fromJson(contact));
      }
    }
  }

// Write data items of contact into List
  void saveTodo() {
    List items = contactController.contacts.map((e) => e.toJson()).toList();
    dataStorage.write('contactData', jsonEncode(items));
  }

// Function for validate userName
  String? validateUserName(String value) {
    if (value.isEmpty) {
      return "Provide valid Name";
    }
    return null;
  }

// Function for validate PhoneNo.
  String? validateNumber(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Please Enter valid Phone no.";
    }
    return null;
  }

// Function for validate FatherName Variable
  String? validateFName(String value) {
    if (value.isEmpty) {
      return "Provide valid Name";
    }
    return null;
  }

// Function for validate MotherName
  String? validateMName(String value) {
    if (value.isEmpty) {
      return "Provide valid Name";
    }
    return null;
  }

// Function for validate Address of user
  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Provide valid Address";
    }
    return null;
  }

// Function for validate Email id
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid E-mail";
    }
    return null;
  }

// Function for validate & add or edit data in Database
  void addData() async {
    final isValid = loginFormKey.currentState!
        .validate(); // isValid for checking all textfield are validate
// If not then return nothing
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!
        .save(); // If all textfield is validate then save formfield  data

    await postData().then((value) => print(value));
    // if else statement for check user is coming for edit contact or add new contact
    if (editController.isEdit.value == false) {
      contactController.addContact(
          userName, number, fName, mName, email, address);
      saveTodo();
      Get.back();
    } else {
      final isValid = loginFormKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      loginFormKey.currentState!.save();
      contactController.updateContact(
          userName, number, fName, mName, email, address, editController.index);
      saveTodo();

      Get.back();
    }
  }
}
