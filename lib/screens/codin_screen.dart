import 'package:brototype_app/database/functions/models/adminmodel/admin_model.dart';
import 'package:flutter/material.dart';

class codingVideoScreen extends StatelessWidget {
  final List<VideoLink> videoLinks;
  codingVideoScreen({required this.videoLinks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('coding Videos'),
      ),
      body: ListView.builder(
          itemCount: videoLinks.length,
          itemBuilder: (context, index) {
            final VideoLink = videoLinks[index];
            return ListTile(
              title: Text(VideoLink.title),
              onTap: () {},
            );
          }),
    );
  }
}
