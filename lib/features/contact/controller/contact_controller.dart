import 'package:course_online/features/contact/model/contact_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ContactController extends GetxController {
  var contacts = <ContactModel>[].obs;

  late Box<ContactModel> contactBox;

  @override
  void onInit() {
    super.onInit();
    contactBox = Hive.box<ContactModel>('contacts');
    loadContacts();
  }

  void loadContacts() {
    contacts.value = contactBox.values.toList();
  }

  void addContact(String name, String phone) {
    final contact = ContactModel(name: name, phone: phone);
    contactBox.add(contact);
    loadContacts();
  }
}
