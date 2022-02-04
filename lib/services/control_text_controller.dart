import 'package:dio_practice/controller/editingController.dart';
import 'package:dio_practice/controller/validation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final validationController = Get.find<ValidationController>();
final editController = Get.find<EditContact>();

class ControlText {
  void createController() {
    validationController.userNameController = TextEditingController(
        text: editController.isEdit.value
            ? '${editController.contactList.userName}'
            : null);
    validationController.numberController = TextEditingController(
        text: editController.isEdit.value
            ? '${editController.contactList.phoneNo}'
            : null);
    validationController.fNameController = TextEditingController(
        text: editController.isEdit.value
            ? '${editController.contactList.fatherName}'
            : null);
    validationController.mNameController = TextEditingController(
        text: editController.isEdit.value
            ? '${editController.contactList.motherName}'
            : null);
    validationController.addressController = TextEditingController(
        text: editController.isEdit.value
            ? '${editController.contactList.location}'
            : null);
    validationController.emailController = TextEditingController(
        text: editController.isEdit.value
            ? '${editController.contactList.emailAddress}'
            : null);
  }
}
