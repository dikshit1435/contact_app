
import 'package:flutter/cupertino.dart';

class Contact {
  String userName;
  String phoneNo;
  String fatherName;
  String motherName;
  String emailAddress;
  String location;

  Contact({
    required this.userName,
    required this.fatherName,
    required this.motherName,
    required this.emailAddress,
    required this.phoneNo,
    required this.location,
  });



// Function to convert List into json Data
  toJson() => {
        "userName": userName,
        "phoneNo": phoneNo,
        "fatherName": fatherName,
        "motherName": motherName,
        "emailAddress": emailAddress,
        "location": location
      };


}
