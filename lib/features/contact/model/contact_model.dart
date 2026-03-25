import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ContactModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  ContactModel({required this.name, required this.phone});
}

class ContactModelAdapter extends TypeAdapter<ContactModel> {
  static const int adapterTypeId = 0;

  @override
  int get typeId => adapterTypeId;

  @override
  ContactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return ContactModel(
      name: fields[0] as String,
      phone: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContactModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone);
  }
}
