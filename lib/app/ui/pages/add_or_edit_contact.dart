import 'package:dio_practice/app/controller/home_controller.dart';
import 'package:dio_practice/app/modal/contact.dart';
import 'package:dio_practice/app/services/validatior/validation.dart';
import 'package:dio_practice/app/ui/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditPage extends GetView<HomeController> {
  Validation validation = Validation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMyColor,
        title: Text(Get.arguments
            ? ' Edit Contact'
            : 'Add Contact'), // If isEdit is true Show EditContact else Show Add Contact in AppBar Text
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: validation.loginFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: kSizeBoxHeight,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "UserName",
                      prefixIcon: const Icon(Icons.person_pin_sharp),
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.userNameController,
                    onSaved: (value) {
                      controller.userNameController.text = value!;
                    },
                    validator: (value) {
                      return validation.validateUserName(value!);
                    },
                  ),
                  const SizedBox(
                    height: kSizeBoxHeight,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "Father Name",
                      prefixIcon:
                          const Icon(Icons.perm_contact_calendar_rounded),
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.fNameController,
                    onSaved: (value) {
                      controller.fNameController.text = value!;
                    },
                    validator: (value) {
                      return validation.validateFName(value!);
                    },
                  ),
                  const SizedBox(
                    height: kSizeBoxHeight,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "MotherName",
                      prefixIcon: const Icon(Icons.person_pin_sharp),
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.mNameController,
                    onSaved: (value) {
                      controller.mNameController.text = value!;
                    },
                    validator: (value) {
                      return validation.validateMName(value!);
                    },
                  ),
                  const SizedBox(
                    height: kSizeBoxHeight,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIconColor: Colors.pink,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "Address",
                      prefixIcon: const Icon(Icons.location_on,),
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.addressController,
                    onSaved: (value) {
                      controller.addressController.text = value!;
                    },
                    validator: (value) {
                      return validation.validateAddress(value!);
                    },
                  ),
                  const SizedBox(
                    height: kSizeBoxHeight,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "E-mail",
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.emailController.text = value!;
                    },
                    validator: (value) {
                      return validation.validateEmail(value!);
                    },
                  ),
                  const SizedBox(
                    height: kSizeBoxHeight,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusColor: Colors.blueAccent,
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: kMyColor, width: 2.0),
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),

                      labelText: "Phone no.",
                      prefixIcon: const Icon(Icons.phone_iphone_sharp),
                    ),
                    keyboardType: TextInputType.phone,
                    controller: controller.numberController,
                    onSaved: (value) {
                      controller.numberController.text = value!;
                    },
                    validator: (value) {
                      return validation.validateNumber(value!);
                    },
                  ),
                  const SizedBox(
                    height: kSizeBoxHeight,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kMyColor),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(14)),
                      ),
                      child: Text(
                        Get.arguments
                            ? "Save"
                            : "Add", // Change button text value into 'save' if is edit boolean is true or 'Add' if  False
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        if (Get.arguments == true) {
                          validation.validateData();
                          if (validation.isValid == true) {
                            controller.updateContact(
                                Contact(
                                    userName: controller.userNameController.text,
                                    phoneNo: controller.numberController.text,
                                    fatherName: controller.fNameController.text,
                                    motherName: controller.mNameController.text,
                                    emailAddress: controller.emailController.text,
                                    location: controller.addressController.text),
                                controller.index);
                            controller.clearController();
                          } else {
                            return;
                          }
                        } else {
                          validation.validateData();
                          if (validation.isValid == true) {
                            controller.addContact(Contact(
                                userName: controller.userNameController.text,
                                phoneNo: controller.numberController.text,
                                fatherName: controller.fNameController.text,
                                motherName: controller.mNameController.text,
                                emailAddress: controller.emailController.text,
                                location: controller.addressController.text),);
                          } else {
                            return;
                          }
                        }

                        controller.saveTodo();
                        Get.back();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: kSizeBoxHeight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
