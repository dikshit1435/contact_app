import 'package:dio_practice/controller/EditingController.dart';
import 'package:dio_practice/controller/validation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TextController{
  final editController = Get.find<EditContact>();
 final validationController = Get.find<ValidationController>();
  void createController(){
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
    validationController. mNameController = TextEditingController(
        text: editController.isEdit.value
            ? '${editController.contactList.motherName}'
            : null);
    validationController. addressController = TextEditingController(
        text: editController.isEdit.value
            ? '${editController.contactList.location}'
            : null);
    validationController.emailController = TextEditingController(
        text: editController.isEdit.value
            ? '${editController.contactList.emailAddress}'
            : null);
  }
  void destroyController(){
    validationController.userNameController.dispose();
    validationController.numberController.dispose();
    validationController.fNameController.dispose();
    validationController.mNameController.dispose();
    validationController.addressController.dispose();
    validationController.emailController.dispose();
    }
}

