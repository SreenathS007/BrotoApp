import 'package:hive/hive.dart';
part 'video_model.g.dart';

@HiveType(typeId: 3)
class Video {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String videoUrl;

  Video({required this.title, required this.videoUrl});
}
