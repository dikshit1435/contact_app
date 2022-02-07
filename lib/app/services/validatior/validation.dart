import 'package:dio_practice/app/controller/home_controller.dart';
import 'package:dio_practice/app/modal/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Validation {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final contactController = Get.find<HomeController>();


  var userName;
  var number;
  var fName;
  var mName;
  var address;
  var email;

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

  void clearController() {
    contactController.userNameController.clear();
    contactController.numberController.clear();
    contactController.fNameController.clear();
    contactController.mNameController.clear();
    contactController.addressController.clear();
    contactController.emailController.clear();
  }



  void createEditController(Contact contact) {
    contactController.userNameController= TextEditingController(text: '${contact.userName}');
    contactController.numberController  = TextEditingController(text:'${contact.phoneNo}');
    contactController.fNameController = TextEditingController(text:'${contact.fatherName}');
    contactController.mNameController    = TextEditingController(text:'${contact.motherName}');
    contactController.addressController= TextEditingController(text:'${contact.location}');
    contactController.emailController = TextEditingController(text: '${contact.emailAddress}');
  }


  // Function for validate & calling addContact and fill parameter with  TextField data
  void addData() {
    final isValid = loginFormKey.currentState!
        .validate(); // isValid for checking all textfield are validate
// If not then return nothing
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!
        .save(); // If all textfield is validate then save formfield  data
    contactController.addContact(
        userName, number, fName, mName, email, address);
    contactController.saveTodo();

    Get.back();
  }

  // Function for calling updateContact function  and fill parameter with  TextField data
  void editContact(int index) {
    final isValid = loginFormKey.currentState!
        .validate(); // isValid for checking all textfield are validate
// If not then return nothing
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!
        .save(); // If all textfield is validate then save formfield  data
    contactController.updateContact(
        userName, number, fName, mName, email, address, index);
    contactController.saveTodo();

    Get.back();
  }
}
