
import 'package:flutter/cupertino.dart';

class Contact {
  String? userName;
  String? phoneNo;
  String? fatherName;
  String? motherName;
  String? emailAddress;
  String? location;

  Contact({
      this.userName,
     this.fatherName,
     this.motherName,
     this.emailAddress,
      this.phoneNo,
     this.location,
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

  // Function convert json data into list
  fromJson(json) {
    return Contact(
        userName: json['userName'],
        phoneNo: json['phoneNo'],
        fatherName: json['fatherName'],
        motherName: json['motherName'],
        emailAddress: json['emailAddress'],
        location: json['location']);
  }
}
