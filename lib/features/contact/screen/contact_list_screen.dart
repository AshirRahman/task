import 'package:course_online/features/add_contact/add_contact_screen.dart';
import 'package:course_online/features/contact/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListScreen extends StatelessWidget {
  final controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacts")),
      body: Obx(() {
        if (controller.contacts.isEmpty) {
          return const Center(child: Text("No Contacts"));
        }

        return ListView.builder(
          itemCount: controller.contacts.length,
          itemBuilder: (context, index) {
            final contact = controller.contacts[index];
            return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.phone),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddContactScreen()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
