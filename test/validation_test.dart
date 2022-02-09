import 'package:flutter_test/flutter_test.dart';
import 'package:dio_practice/app/services/validatior/validation.dart';

void main(){
  Validation validation = Validation();

  test("It will test userName  is Empty or not ",(){
    expect(validation.validateUserName('Dikshit Sharma'), isNull);
    expect(validation.validateUserName('Sharma'), isNot('Provide valid name'));

  });

  test("It will test PhoneNumber format  is not  Empty & in proper format ",(){
    expect(validation.validateNumber('9988529029'), isNull);
    expect(validation.validateNumber('9988529029'), isNot('Please Enter valid Phone no.'));
  });

  test("It will test FatherName is Empty or not if it is empty",(){
    expect(validation.validateFName('Satpal Sharma'), isNull);
    expect(validation.validateFName('Satpal Sharma'), isNot('Provide valid Name'));
  });

  test("It will test MotherName is Empty or not ",(){
    expect(validation.validateMName('Simple Sharma'), isNull);
    expect(validation.validateMName('Simple Sharma'), isNot('Provide valid Name'));
  });

  test("It will test Email format  is not  Empty & in proper format ",(){
    expect(validation.validateEmail('dikshit.d.k.2002@gmail.com'), isNull);
    expect(validation.validateEmail('dikshit.d.k.2002@gmail.com'), isNot('Provide valid E-mail'));
  });

  test("It will test address is Empty or not ",(){
    expect(validation.validateAddress('Ludhiana'), isNull);
    expect(validation.validateAddress('Ludhiana'), isNot('"Provide valid Address"'));
  });



}