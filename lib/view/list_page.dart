import 'package:dio_practice/services/control_text.dart';
import 'package:dio_practice/view/view_detail.dart';
import 'package:dio_practice/view/add_or_edit_contact.dart';
import 'package:dio_practice/controller/add_contact_controller.dart';
import 'package:dio_practice/controller/validation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPage extends StatelessWidget {
   //For Using ContactList Data
  final addContactsController =
  Get.find<AddContactInList>();
  final validationController = Get.find<ValidationController>();
  ControlText controlText = ControlText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Contact')),
      ),
      body: Material(
        child: Obx(() {
          return ListView.builder(
              itemCount: addContactsController.contacts.length,
              itemBuilder: (context, index)
              {

                return ListTile(
                  onTap: () {
                    Get.to(ContactDetail(
                        contact: addContactsController.contacts[
                            index])); // On Tap Go to View Detail Page to Show All Element in List
                  },
                  title: Text('${addContactsController.contacts[index].userName}'),
                  subtitle:
                      Text('${addContactsController.contacts[index].phoneNo}'),
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(AddContact(index:index,),arguments: true,);
                          controlText.createController(addContactsController.contacts[
                          index]);
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          addContactsController.contacts.removeAt(
                              index); // Deleting Element From the List
                          addContactsController.saveTodo();
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Get.to(AddContact(index: 0,),arguments: false);
          controlText.createController(addContactsController.contacts[0]);


        },
        child: Icon(Icons.add),
      ),
    );
  }
}
