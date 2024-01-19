import 'package:flutter/material.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Lectures {
  String title;
  String body;
  String youtubeUrl;

  Lectures({required this.title, required this.body, required this.youtubeUrl});
}

class LecturePage extends StatelessWidget {
  final Lectures lecture;
  //final YoutubePlayerController _controller;

  LecturePage({Key? key, required this.lecture})
      : /* _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(lecture.youtubeUrl)!,
    flags: const YoutubePlayerFlags(autoPlay: false),
  ), */
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView( // Makes the page scrollable
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        lecture.title,
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    // Image.asset('lib/assets/images/face_logo2.png',
                    //   width: 100,
                    //   height: 100,
                    // ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  lecture.body,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 8),
                // YoutubePlayer(
                //   controller: _controller,
                //   showVideoProgressIndicator: true,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
