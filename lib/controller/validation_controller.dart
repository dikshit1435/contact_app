import 'package:dio_practice/services/control_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_contact_controller.dart';

class ValidationController extends GetxController {

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final contactController = Get.find<AddContactInList>();

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
  ControlText controlText = ControlText();

@override
  void onInit() {
    // TODO: implement onInit
  super.onInit();

  }
  @override
  void onReady() {
    super.onReady();
    controlText.createController();
  }

  @override
  void onClose() {
    controlText.closeController();

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


  void validateTextField(){
  final isValid = loginFormKey.currentState!
      .validate(); // isValid for checking all textfield are validate
// If not then return nothing
  if (!isValid) {
    return;
  }
  loginFormKey.currentState!
      .save(); // If all textfield is validate then save formfield  data
}



 // Function for calling addContact and fill parameter with  TextField data
void addData() {
    contactController.addContact(
        userName, number, fName, mName, email, address);
    contactController.saveTodo();
    controlText.clearController();
    Get.back();
  }

  // Function for calling updateContact function  and fill parameter with  TextField data
  void editContact(int index){
     contactController.updateContact(
         userName, number, fName, mName, email, address, index);
     contactController.saveTodo();
     controlText.clearController();

     Get.back();

   }


    }


