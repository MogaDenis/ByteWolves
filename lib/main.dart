import 'package:byte_wolves/constants/constants.dart';
import 'package:byte_wolves/models/answer.dart';
import 'package:byte_wolves/screens/lectures.dart';
import 'package:byte_wolves/screens/levels_map.dart';
import 'package:byte_wolves/screens/multiple_answer_question.dart';
import 'package:byte_wolves/screens/profile_screen.dart';
import 'package:byte_wolves/screens/login_screen.dart';
import 'package:byte_wolves/screens/signup_screen.dart';
import 'package:byte_wolves/screens/splash_screen.dart';
import 'package:byte_wolves/screens/input_question.dart';

import 'package:flutter/material.dart';

void main() {
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
                    onPressed: () {
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LecturePage(
                              lecture: Lectures(
                                  title: "Lecture dummy",
                                  body:
                                      "Please watch this highly educational video. :)",
                                  youtubeUrl: "J4Zwc6UzxAg"))));
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MultipleAnswerQuestion(
                                  questionText:
                                      "What is the capital of France?",
                                  answer1: Answer(
                                      answerText: "Paris", isCorrect: true),
                                  answer2: Answer(
                                      answerText: "Berlin", isCorrect: false),
                                  answer3: Answer(
                                      answerText: "London", isCorrect: false),
                                  answer4: Answer(
                                      answerText: "Madrid", isCorrect: false),
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
                  ElevatedButton (
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LevelMapPage(
                              currentLevel: 3.0)));
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
