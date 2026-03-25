import 'package:get/get.dart';
import '../features/contact/screen/contact_list_screen.dart';

class AppRoute {
  static String contactListScreen = "/contactListScreen";
  static String addContactScreen = "/addContactScreen";

  static String getContactListScreen() => contactListScreen;
  static String getAddContactScreen() => addContactScreen;

  static List<GetPage> routes = [
    GetPage(name: contactListScreen, page: () => ContactListScreen()),
    GetPage(name: addContactScreen, page: () => ContactListScreen()),
  ];
}
