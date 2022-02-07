import 'package:dio_practice/controller/validation_controller.dart';
import 'package:dio_practice/modal/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final validationController = Get.find<ValidationController>();
class ControlText {

  void  createController() {
    validationController.userNameController = TextEditingController();
    validationController.numberController = TextEditingController();
    validationController.fNameController = TextEditingController();
    validationController.mNameController =TextEditingController();
    validationController.addressController = TextEditingController();
    validationController.emailController =TextEditingController();
  }
  void createEditController(Contact contact) {
    validationController.userNameController = TextEditingController(
        text:'${contact.userName}'
            );
    validationController.numberController = TextEditingController(
        text:'${contact.phoneNo}'
            );
    validationController.fNameController = TextEditingController(
        text: '${contact.fatherName}'
    );
    validationController.mNameController = TextEditingController(
        text:
             '${contact.motherName}');
    validationController.addressController = TextEditingController(
        text: '${contact.location}');
    validationController.emailController = TextEditingController(
        text: '${contact.emailAddress}');
  }
  void closeController() {
    validationController.userNameController.dispose();
    validationController.numberController.dispose();
    validationController.fNameController.dispose();
    validationController.mNameController.dispose();
    validationController.addressController.dispose();
    validationController.emailController.dispose();
  }
  void clearController(){
    validationController.userNameController.clear();
    validationController.numberController.clear();
    validationController.fNameController.clear();
    validationController.mNameController.clear();
    validationController.addressController.clear();
    validationController.emailController.clear();
  }
}
