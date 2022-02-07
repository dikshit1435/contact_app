
import 'package:dio_practice/app/controller/home_controller.dart';
import 'package:dio_practice/app/services/validatior/validation.dart';
import 'package:dio_practice/app/ui/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditPage extends GetView<HomeController> {

  final contact = Get.find<HomeController>();
  Validation validation = Validation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    controller: contact.userNameController,
                    onSaved: (value) {
                      validation.userName = value!;
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
                    controller: contact.fNameController,
                    onSaved: (value) {
                      validation.fName = value!;
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
                    controller: contact.mNameController,
                    onSaved: (value) {
                      validation.mName = value!;
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "Address",
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                    keyboardType: TextInputType.name,
                    controller: contact.addressController,
                    onSaved: (value) {
                      validation.address = value!;
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
                    controller: contact.emailController,
                    onSaved: (value) {
                      validation.email = value!;
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "Phone no.",
                      prefixIcon: const Icon(Icons.phone_iphone_sharp),
                    ),
                    keyboardType: TextInputType.phone,
                    controller: contact.numberController,
                    onSaved: (value) {
                      validation.number = value!;
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
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue),
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
                        Get.arguments
                            ? validation.editContact(controller.index)
                            : validation.addData();
                        validation.clearController();
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