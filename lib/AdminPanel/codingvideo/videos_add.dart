import 'package:brototype_app/AdminPanel/codingvideo/video_list.dart';
import 'package:brototype_app/database/functions/models/adminmodel/video_add_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class addVideos extends StatelessWidget {
  final List<String> videoLinks = [
    'https://youtu.be/sNYbNwNAONM?si=N695GanfyXjo-Cpj',
    'https://youtu.be/v-GqjW5-aZQ?si=gct1Cjf4gNT_TcbN'
  ];
  // const addVideos({super.key});

  @override
  Widget build(BuildContext context) {
    saveVideoLinks(videoLinks);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Videos"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoListScreen()),
              );
            },
            child: Text("Goto Video List")),
      ),
    );
  }

  void saveVideoLinks(List<String> links) {
    var box = Hive.box<VideoModel>('videos');
    int index = 0;
    for (var link in links) {
      var video =
          VideoModel(id: index.toString(), title: 'Video $index', link: link);
      box.add(video);
      index++;
    }
  }
}
