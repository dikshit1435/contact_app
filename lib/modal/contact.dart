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
}
