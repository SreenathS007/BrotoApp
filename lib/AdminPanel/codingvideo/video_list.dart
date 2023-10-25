import 'package:brototype_app/database/functions/models/adminmodel/video_add_model.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<VideoModel> videos = getVideos(); // Retrieve videos
    return Scaffold(
      appBar: AppBar(
        title: Text('Video List'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(videos[index].link),
          );
        },
      ),
    );
  }

  List<VideoModel> getVideos() {
    // Make sure to call Hive.openBox before accessing the box
    Hive.openBox<VideoModel>('videos');
    var box = Hive.box<VideoModel>('videos');
    return box.values.toList();
  }
}
