import 'package:hive/hive.dart';
part 'register_model.g.dart';

@HiveType(typeId: 1)
class RegisterModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String address;

  @HiveField(5)
  final String photo;

  RegisterModel({
    required this.name,
    required this.age,
    required this.phone,
    required this.address,
    required this.photo,
    required this.id,
  });
}