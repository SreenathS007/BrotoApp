import 'package:brototype_app/database/functions/models/adminmodel/admin_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:brototype_app/database/functions/models/userdata_model.dart';

ValueNotifier<List<VideoLink>> videoListNotifier = ValueNotifier([]);
Future<void> addVideo(VideoLink value) async {
  final videoBox = await Hive.openBox<VideoLink>('video_links');
  videoBox.add(VideoLink(
      title: 'video 1',
      url: 'https://youtu.be/pDmEYRhyusU?si=RtNtSCbdjf3mCXzh'));
  videoBox.add(VideoLink(
      title: 'video 2',
      url: 'https://youtu.be/XW7HI6ajZfo?si=rVkqVTkta9X1PPQK'));
  videoBox.add(VideoLink(
      title: 'video 3',
      url: 'https://youtu.be/Kyt8gJGFEn4?si=MtMrAHFipLc0kO7H'));

  videoListNotifier.notifyListeners();
}

Future<void> retrieveVideos() async {
  final videoBox = await Hive.openBox<VideoLink>('video_links');
  final VideoLinks = videoBox.values.toList();
  videoListNotifier.value = VideoLinks;
}
