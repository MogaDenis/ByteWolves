import 'package:byte_wolves/constants/constants.dart';
import 'package:byte_wolves/models/question.dart';
import 'package:byte_wolves/models/user.dart';
import 'package:byte_wolves/screens/endquiz_screen.dart';
import 'package:byte_wolves/screens/levels_map.dart';
import 'package:byte_wolves/screens/multiple_answer_question.dart';
import 'package:byte_wolves/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/lecture.dart';
import 'input_question.dart';

class LecturePage extends StatelessWidget {
  final Lecture lecture;
  late final YoutubePlayerController _controller;
  final User user;

  LecturePage({super.key, required this.lecture, required this.user}) {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        textAlign: TextAlign.justify,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () async {
                          final updatedUser = User(
                            id: user.id,
                            username: user.username,
                            email: user.email,
                            level: user.level + 1,
                            password: user.password,
                            experience: user.experience + 100,
                            lectures: user.lectures + 1,
                          );
                          UserService().update(updatedUser);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LevelMapPage(
                                  currentLevel: updatedUser.level.toDouble(), user: updatedUser)));
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const EndQuizScreen(score: 100),
                          ));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const InputQuestion(
                                    question:
                                        "A budget that accounts for emergencies can provide a safety net, reducing _________ stress",
                                    correctAnswer: "financial",
                                  )));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MultipleAnswerQuestion(
                                    question: Question(
                                      id: 1,
                                      type: "multiple",
                                      text:
                                          "What is the primary purpose of budgeting?",
                                      lectureId: 1,
                                      correctAnswer: 'Safety',
                                      wa1: 'Restricting ',
                                      wa2: 'Tracking',
                                      wa3: 'Investing',
                                    ),
                                  )));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const InputQuestion(
                                    question:
                                        "Budgeting is essentially the act of controlling the flow of water into and out of the bucket symbolizing ______ and expenses",
                                    correctAnswer: "income",
                                  )));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MultipleAnswerQuestion(
                                    question: Question(
                                      id: 2,
                                      type: "multiple",
                                      text:
                                          "What does effective budgeting involve?",
                                      lectureId: 1,
                                      correctAnswer: 'Saving up',
                                      wa1: 'Stress',
                                      wa2: 'Risking',
                                      wa3: 'Convenience',
                                    ),
                                  )));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          //make the button in the center
                          alignment: Alignment.center,
                        ),
                        child: const Text(
                          'Go to questions',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          // add a button to go to the questions
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ));
  }
}
