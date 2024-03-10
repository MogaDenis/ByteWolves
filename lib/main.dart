import 'package:byte_wolves/constants/constants.dart';
import 'package:byte_wolves/models/question.dart';
import 'package:byte_wolves/screens/endquiz_screen.dart';
import 'package:byte_wolves/screens/input_question.dart';
import 'package:byte_wolves/screens/lectures.dart';
import 'package:byte_wolves/screens/levels_map.dart';
import 'package:byte_wolves/screens/login_screen.dart';
import 'package:byte_wolves/screens/multiple_answer_question.dart';
import 'package:byte_wolves/screens/profile_screen.dart';
import 'package:byte_wolves/screens/signup_screen.dart';
import 'package:byte_wolves/screens/splash_screen.dart';
import 'package:byte_wolves/service/lecture_serive.dart';
import 'package:byte_wolves/service/question_service.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const MyApp(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  late Question question;
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomContainers.backgroundContainer,
          SizedBox(
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Developers navigator',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LogInScreen()));
                    },
                    child: const Text(
                      'Go to "Log In" screen',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 0.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      'Go to "Sign Up" screen',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 0.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final lecture = await LectureService().getById(3);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LecturePage(
                              lecture: Lectures(
                                  title: lecture.title,
                                  body:
                                      lecture.body,
                                  youtubeUrl: lecture.youtubeUrl))));
                    },
                    child: const Text(
                      'Go to "Lecture" screen',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 0.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                    },
                    child: const Text(
                      'Go to "Profile" screen',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 0.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InputQuestion(
                              question: "What is the capital of France?",
                              correctAnswer: "paris")));
                    },
                    child: const Text(
                      'Go to "Input Question" screen',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 0.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        final question = await QuestionService().getById(1);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MultipleAnswerQuestion(
                                  question: question,
                                )));
                      },
                      child: const Text(
                        'Go to "Multiple Answer Question" screen',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          letterSpacing: 0.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const LevelMapPage(currentLevel: 3.0)));
                    },
                    child: const Text(
                      'Go to "Level Map" screen',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 0.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const EndQuizScreen(score: 100)));
                    },
                    child: const Text(
                      'Go to "EndQuiz" screen',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 0.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),

                  // Add here a button to navigate to the new screen that you have created.
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
