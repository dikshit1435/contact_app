import 'package:dio_practice/app/controller/home_controller.dart';
import 'package:dio_practice/app/modal/contact.dart';
import 'package:dio_practice/app/ui/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewDetail extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name", style: kTextStyle1),
                Text('${controller.contactDetail.userName}', style: kTextStyle2),
                const Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                const Text("Father Name", style: kTextStyle1),
                Text('${controller.contactDetail.fatherName}', style: kTextStyle2),
                const Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                const Text("Mother Name", style: kTextStyle1),
                Text('${controller.contactDetail.motherName}', style: kTextStyle2),
                const Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                const Text("Contact", style: kTextStyle1),
                Text('${controller.contactDetail.phoneNo}', style: kTextStyle2),
                const Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                const Text("E-mail", style: kTextStyle1),
                Text('${controller.contactDetail.emailAddress}', style: kTextStyle2),
                const Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                const Text("Address", style: kTextStyle1),
                Text('${controller.contactDetail.location}', style: kTextStyle2),
                const Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
