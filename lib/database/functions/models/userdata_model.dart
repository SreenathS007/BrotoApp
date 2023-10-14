import 'package:hive/hive.dart';
part 'userdata_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;

  User({required this.email, required this.password, this.id});
}
