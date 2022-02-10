import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Validation {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late bool isValid;


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

  // Function for validate & calling addContact and fill parameter with  TextField data
  void validateData() {
    isValid = loginFormKey.currentState!
        .validate(); // isValid for checking all textfield are validate
   // If not then return nothing
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }
}
