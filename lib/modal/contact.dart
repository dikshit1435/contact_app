// For Storing Personal Information  create Data Model of Contact
class Contact {
  final String? userName;
  final String? phoneNo;
  final String? fatherName;
  final String? motherName;
  final String? emailAddress;
  final String? location;

  Contact(
      {this.userName,
      this.fatherName,
      this.motherName,
      this.emailAddress,
      this.phoneNo,
      this.location});
// constructor that convert json to object instance
  Contact.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        phoneNo = json['phoneNo'],
        fatherName = json['fatherName'],
        motherName = json['motherName'],
        emailAddress = json['emailAddress'],
        location = json['location'];
// method that convert object to json String
  Map<String, dynamic> toJson() => {
        'userName': userName,
        'phoneNo': phoneNo,
        'fatherName': fatherName,
        'motherName': motherName,
        'emailAddress': emailAddress,
        'location': location
      };
}
