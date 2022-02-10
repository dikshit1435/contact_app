import 'package:dio_practice/app/controller/home_controller.dart';
import 'package:dio_practice/app/routes/app_pages.dart';
import 'package:dio_practice/app/services/validatior/validation.dart';
import 'package:dio_practice/app/ui/components/drawer.dart';
import 'package:dio_practice/app/ui/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPage extends GetView<HomeController> {
  //For Using ContactList Data
  Validation validation = Validation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(child: Text('Contact App')),
      ),
      endDrawer: Sidebar(),
      body: Material(
        child: GetBuilder<HomeController>(builder: (controller) {
          return ListView.builder(
              itemCount: controller.contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    controller.viewpage(controller.contacts[index]);
                    // On Tap Go to View Detail Page to Show All Element in List
                  },
                  title: Text('${controller.contacts[index].userName}'),
                  subtitle: Text('${controller.contacts[index].phoneNo}'),
                  leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text('${controller.contacts[index].userName[0]}',
                          style: kContactlogo)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller
                              .createEditController(controller.contacts[index]);
                          controller.editPage(index);
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.deleteContact(index);
                          // Deleting Element From the List
                          controller.saveTodo();
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
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          controller.createcontroller();
          Get.toNamed(Routes.addOrEditPage, arguments: false);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
