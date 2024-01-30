import 'package:byte_wolves/constants/constants.dart';
import 'package:byte_wolves/models/answer.dart';
import 'package:flutter/material.dart';

class MultipleAnswerQuestion extends StatefulWidget {
  final String questionText;
  final Answer answer1;
  final Answer answer2;
  final Answer answer3;
  final Answer answer4;

  const MultipleAnswerQuestion(
      {super.key,
      required this.questionText,
      required this.answer1,
      required this.answer2,
      required this.answer3,
      required this.answer4});

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
        widget.questionText,
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
                        _answersGroup(widget.answer1, widget.answer2),
                        const SizedBox(height: 20.0),
                        _answersGroup(widget.answer3, widget.answer4),
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
