// For Storing Personal Information  create Data Model of Contact
import 'dart:convert';
class Contact {
   String? userName;
   String? phoneNo;
   String? fatherName;
   String? motherName;
   String? emailAddress;
   String? location;

  Contact(
      {this.userName,
      this.fatherName,
      this.motherName,
      this.emailAddress,
      this.phoneNo,
      this.location});
// constructor that convert json to object instance
//   Contact.fromJson(Map<String, dynamic> json)
//       : userName = json['userName'],
//         phoneNo = json['phoneNo'],
//         fatherName = json['fatherName'],
//         motherName = json['motherName'],
//         emailAddress = json['emailAddress'],
//         location = json['location'];
// // method that convert object to json String
//   Map<String, dynamic> toJson() => {
//         'userName': userName,
//         'phoneNo': phoneNo,
//         'fatherName': fatherName,
//         'motherName': motherName,
//         'emailAddress': emailAddress,
//         'location': location
//       };
   toJson() => {
    "userName": userName,
    "phoneNo": phoneNo,
    "fatherName": fatherName,
    "motherName": motherName,
    "emailAddress": emailAddress,
    "location": location
  };
  fromJson(json){
    return Contact(
        userName : json['userName'],
        phoneNo :json['phoneNo'],
        fatherName : json['fatherName'],
        motherName : json['motherName'],
        emailAddress : json['emailAddress'],
        location : json['location']);


  }

}
