import 'package:course_online/app.dart';
import 'package:course_online/features/contact/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(ContactModelAdapter.adapterTypeId)) {
    Hive.registerAdapter(ContactModelAdapter());
  }
  await Hive.openBox<ContactModel>('contacts');

  runApp(const CourseOnline());
}
