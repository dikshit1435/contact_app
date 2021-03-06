import 'package:dio_practice/modal/contact.dart';
import 'package:dio_practice/constant/constants.dart';
import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  final Contact contact;

  ContactDetail({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Detail"),
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
                Text("Name", style: kTextStyle1),
                Text('${contact.userName}', style: kTextStyle2),
                Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                Text("Father Name", style: kTextStyle1),
                Text('${contact.fatherName}', style: kTextStyle2),
                Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                Text("Mother Name", style: kTextStyle1),
                Text('${contact.motherName}', style: kTextStyle2),
                Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                Text("Contact", style: kTextStyle1),
                Text('${contact.phoneNo}', style: kTextStyle2),
                Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                Text("E-mail", style: kTextStyle1),
                Text('${contact.emailAddress}', style: kTextStyle2),
                Divider(
                  height: 30,
                  color: Colors.black,
                  endIndent: 5,
                ),
                Text("Address", style: kTextStyle1),
                Text('${contact.location}', style: kTextStyle2),
                Divider(
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
