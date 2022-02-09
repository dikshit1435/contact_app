import 'dart:convert';
import 'package:dio_practice/app/modal/contact.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio_practice/app/controller/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final controller = HomeController();

  // Test addContact Method
  test('It will test the addContact method add  ', () {
    controller.addContact(Contact(
        userName: 'Dikshit',
        phoneNo: '9988529029',
        fatherName: 'Satpal Sharma',
        motherName: 'Simple Sharma',
        emailAddress: 'dikshit.d.k.2002@gmail.com',
        location: 'Ludhiana'));
    expect(controller.contacts.length, 1);
    expect(controller.contacts[0].userName, 'Dikshit');
    expect(controller.contacts[0].phoneNo, '9988529029');
    expect(controller.contacts[0].fatherName, 'Satpal Sharma');
    expect(controller.contacts[0].motherName, 'Simple Sharma');
    expect(controller.contacts[0].emailAddress, 'dikshit.d.k.2002@gmail.com');
    expect(controller.contacts[0].location, 'Ludhiana');
  });
  // Test updateContact Method
  test('It will test updateContact method update data items at 0th index', () {
    controller.updateContact(
        Contact(
            userName: 'Kapil Dev',
            phoneNo: '7889294057',
            fatherName: 'Brijpal Sharma',
            motherName: 'sunita Sharma',
            emailAddress: 'kapil.d.k.2002@gmail.com',
            location: 'Amritsar'),
        0);
    expect(controller.contacts[0].userName, 'Kapil Dev');
    expect(controller.contacts[0].phoneNo, '7889294057');
    expect(controller.contacts[0].fatherName, 'Brijpal Sharma');
    expect(controller.contacts[0].motherName, 'sunita Sharma');
    expect(controller.contacts[0].emailAddress, 'kapil.d.k.2002@gmail.com');
    expect(controller.contacts[0].location, 'Amritsar');
  });
  // Test Delete Contact Method
  test('It will test delete method deleted item from 0th index ', () {
    controller.deleteContact(0);
    expect(controller.contacts.length, 0);
  });

  //Test Shared Preference Method
  test('It will test shared prefernce Set & get value sucessfully', () async {
    controller.addContact(Contact(
        userName: 'Dikshit',
        phoneNo: '9988529029',
        fatherName: 'Satpal Sharma',
        motherName: 'Simple Sharma',
        emailAddress: 'dikshit.d.k.2002@gmail.com',
        location: 'Ludhiana'));
    SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
    List items = controller.contacts.map((e) => e.toJson()).toList();
    sharedPrefrences.setString('contactData', jsonEncode(items));
    String? stringContact = sharedPrefrences.getString('contactData');
    List contactList = jsonDecode(stringContact!);
    for (var contact in contactList) {
      controller.contacts.add(Contact().fromJson(contact));
    }
    expect(sharedPrefrences.getString('contactData'),
        '[{"userName":"Dikshit","phoneNo":"9988529029","fatherName":"Satpal Sharma","motherName":"Simple Sharma","emailAddress":"dikshit.d.k.2002@gmail.com","location":"Ludhiana"}]');
  });
}
