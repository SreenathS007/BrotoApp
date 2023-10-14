import 'package:hive/hive.dart';
part 'admin_model.g.dart';

@HiveType(typeId: 0)
class VideoLink {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String url;

  VideoLink({required this.title, required this.url});
}
