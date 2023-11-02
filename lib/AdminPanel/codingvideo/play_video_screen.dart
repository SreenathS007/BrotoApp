import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoLink;
  final String title;

  VideoPlayerScreen({required this.videoLink, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(videoLink)!,
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
            builder: (context, player) {
              return Column(
                children: [
                  // some widgets before the player
                  player,
                  // some widgets after the player
                ],
              );
            },
            onEnterFullScreen: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    FullScreenVideoPlayer(videoLink: videoLink, title: title),
              ));
            },
            onExitFullScreen: () {
              // You can add any necessary logic here when the video exits full screen
            },
          ),
        ],
      ),
    );
  }
}

class FullScreenVideoPlayer extends StatelessWidget {
  final String videoLink;
  final String title;

  FullScreenVideoPlayer({required this.videoLink, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Video Player'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(videoLink)!,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          ),
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
