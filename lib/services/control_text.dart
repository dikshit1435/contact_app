import 'package:dio_practice/controller/validation_controller.dart';
import 'package:dio_practice/modal/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final validationController = Get.find<ValidationController>();
class ControlText {

  void createController(Contact contact) {
    validationController.userNameController = TextEditingController(
        text: Get.arguments
            ? '${contact.userName}'
            : null);
    validationController.numberController = TextEditingController(
        text: Get.arguments
            ? '${contact.phoneNo}'
            : null);
    validationController.fNameController = TextEditingController(
        text: Get.arguments
            ? '${contact.fatherName}'
            : null);
    validationController.mNameController = TextEditingController(
        text: Get.arguments
            ? '${contact.motherName}'
            : null);
    validationController.addressController = TextEditingController(
        text: Get.arguments
            ? '${contact.location}'
            : null);
    validationController.emailController = TextEditingController(
        text: Get.arguments
            ? '${contact.emailAddress}'
            : null);
  }
  void closeController() {
    validationController.userNameController.dispose();
    validationController.numberController.dispose();
    validationController.fNameController.dispose();
    validationController.mNameController.dispose();
    validationController.addressController.dispose();
    validationController.emailController.dispose();
  }
}
