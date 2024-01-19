import 'package:byte_wolves/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Lectures {
  String title;
  String body;
  String youtubeUrl;

  Lectures({required this.title, required this.body, required this.youtubeUrl});
}

class LecturePage extends StatelessWidget {
  final Lectures lecture;
  late final YoutubePlayerController _controller;

  LecturePage({super.key, required this.lecture}) {
    _controller = YoutubePlayerController(
      initialVideoId: lecture.youtubeUrl,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomContainers.backgroundContainer,
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              // Makes the page scrollable
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 28.0, vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            lecture.title,
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Image.asset(
                          ImagesConstants.logoImage,
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      lecture.body,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
