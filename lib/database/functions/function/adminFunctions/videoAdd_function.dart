import 'package:brototype_app/database/functions/models/adminmodel/video_add_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<VideoModel>> videoListNotifier = ValueNotifier([]);

Future<void> addVideo(VideoModel value) async {
  final videoDB = await Hive.openBox<VideoModel>("video_db");

  videoDB.put(value.id, value);
}
