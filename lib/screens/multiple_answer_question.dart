import 'package:byte_wolves/constants/constants.dart';
import 'package:byte_wolves/models/answer.dart';
import 'package:byte_wolves/models/question.dart';
import 'package:flutter/material.dart';

class MultipleAnswerQuestion extends StatefulWidget {
  final Question? question;
  const MultipleAnswerQuestion({super.key, required this.question});

  @override
  // ignore: library_private_types_in_public_api
  _MultipleAnswerQuestionState createState() => _MultipleAnswerQuestionState();
}

class _MultipleAnswerQuestionState extends State<MultipleAnswerQuestion> {
  void _checkAnswer(Answer answer) {
    if (!answer.isCorrect) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Wrong!"),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Correct!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Widget _question() {
    return Center(
      child: Text(
        widget.question!.text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _answersGroup(Answer answer1, Answer answer2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            _checkAnswer(answer1);
            Navigator.pop(context);
          },
          child: Text(
            answer1.answerText,
            style: const TextStyle(
              color: Color(0xFF527DAA),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              _checkAnswer(answer2);
            },
            child: Text(answer2.answerText,
                style: const TextStyle(
                  color: Color(0xFF527DAA),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                textAlign: TextAlign.center)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            CustomContainers.backgroundContainer,
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _question(),
                    const Image(
                        image: AssetImage(ImagesConstants.fullWolfImage)),
                    const SizedBox(height: 20.0),
                    Column(
                      children: <Widget>[
                        _answersGroup(
                            Answer(
                                answerText: widget.question!.correctAnswer,
                                isCorrect: true),
                            Answer(
                                answerText: widget.question!.wa1,
                                isCorrect: false)),
                        const SizedBox(height: 20.0),
                        _answersGroup(
                            Answer(
                                answerText: widget.question!.wa2,
                                isCorrect: false),
                            Answer(
                                answerText: widget.question!.wa3,
                                isCorrect: false)),
                      ],
                    ),
                  ],
                ),
                // const SizedBox(height: 150.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
