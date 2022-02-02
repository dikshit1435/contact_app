import 'package:dio_practice/constant/constants.dart';
import 'package:dio_practice/controller/EditingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio_practice/controller/validation_controller.dart';

class AddContact extends StatelessWidget {
  final editController = Get.find<EditContact>();
  final controller = Get.find<ValidationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<EditContact>(builder: (controller) {
          return Text(controller.isEdit.value
              ? ' Edit Contact'
              : 'Add Contact'); // If isEdit is true Show EditContact else Show Add Contact in AppBar Text
        }),
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
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "UserName",
                      prefixIcon: Icon(Icons.person_pin_sharp),
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
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "Father Name",
                      prefixIcon: Icon(Icons.perm_contact_calendar_rounded),
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
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "MotherName",
                      prefixIcon: Icon(Icons.person_pin_sharp),
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
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "Address",
                      prefixIcon: Icon(Icons.location_on),
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
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.email_outlined),
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
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      labelText: "Phone no.",
                      prefixIcon: Icon(Icons.phone_iphone_sharp),
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
                  SizedBox(
                    height: 16,
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
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: GetX<EditContact>(builder: (controller) {
                        return Text(
                          controller.isEdit.value
                              ? "Save"
                              : "Add", // Change button text value into 'save' if is edit boolean is true or 'Add' if  False
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        );
                      }),
                      onPressed: () {
                        controller.addData();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
