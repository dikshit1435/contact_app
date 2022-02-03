import 'package:dio_practice/modal/contact.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContactInList extends GetxController {
   late SharedPreferences  sharedPreferences;

  @override
  void onInit() {
    super.onInit();
  }



  List contacts = <Contact>[
    // Default Data for test view ,Delete,Edit Feature

  ].obs;

  //  Add New Element in Contact Data Model
  addContact(
    String userName,
    String phoneNo,
    String fatherName,
    String motherName,
    String email,
    String address,
  ) {
    contacts.add(Contact(
      userName: userName,
      phoneNo: phoneNo,
      fatherName: fatherName,
      motherName: motherName,
      emailAddress: email,
      location: address,
    ));

  }


  updateContact( String userName,
      String phoneNo,
      String fatherName,
      String motherName,
      String email,
      String address,
      int index){
    contacts[index]=Contact(
      userName: userName,
      phoneNo: phoneNo,
      fatherName: fatherName,
      motherName: motherName,
      emailAddress: email,
      location: address,
    );
  }
}
