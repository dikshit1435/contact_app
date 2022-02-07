import 'package:dio_practice/constant/constants.dart';
import 'package:dio_practice/services/control_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio_practice/controller/validation_controller.dart';

class AddContact extends StatelessWidget {
  final controller = Get.find<ValidationController>();
   int? index;

ControlText controlText = ControlText();
  AddContact({this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments ? ' Edit Contact'
            : 'Add Contact'), // If isEdit is true Show EditContact else Show Add Contact in AppBar Text
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
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
                      controller.userName = value!;
                    },
                    validator: (value) {
                      return controller.validateUserName(value!);
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
                      controller.fName = value!;
                    },
                    validator: (value) {
                      return controller.validateFName(value!);
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
                      controller.mName = value!;
                    },
                    validator: (value) {
                      return controller.validateMName(value!);
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
                    controller: controller.addressController,
                    onSaved: (value) {
                      controller.address = value!;
                    },
                    validator: (value) {
                      return controller.validateAddress(value!);
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
                      controller.email = value!;
                    },
                    validator: (value) {
                      return controller.validateEmail(value!);
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
                    controller: controller.numberController,
                    onSaved: (value) {
                      controller.number = value!;
                    },
                    validator: (value) {
                      return controller.validateNumber(value!);
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
                        Get.arguments?
                          controller.editContact(index!)
                          :controller.addData();
                        controlText.clearController();



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
