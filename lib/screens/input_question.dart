import 'package:flutter/material.dart';
import 'package:byte_wolves/constants/constants.dart';

class InputQuestion extends StatefulWidget {
  final String question;
  final String correctAnswer;

  const InputQuestion(
      {super.key, required this.question, required this.correctAnswer});

  @override
  State<InputQuestion> createState() => _InputQuestionState();
}

class _InputQuestionState extends State<InputQuestion> {
  final TextEditingController _inputAnswerController = TextEditingController();

  Widget _inputAnswer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Provide your answer:',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
            fontSize: 15.00,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xFF6CA8F1),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            controller: _inputAnswerController,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            ),
          ),
        ),
      ],
    );
  }

  void _checkAnswer() {
    String userAnswer = _inputAnswerController.text.trim();
    if (userAnswer.toLowerCase() == widget.correctAnswer.toLowerCase()) {
      //print("Correct\n");
    } else {
      //print("Incorrect\n");
    }
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
                    Center(
                      child: Text(
                        widget.question,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20.0), // Add some spacing
                    // Add the image here
                    Image.asset(
                      ImagesConstants.fullWolfImage,
                      height: 200.0, // Adjust the height as needed
                    ),
                    const SizedBox(height: 15.00),
                    _inputAnswer(),
                    const SizedBox(height: 150.0),
                    ElevatedButton(
                      onPressed: () {
                        _checkAnswer();
                      },
                      child: const Text(
                        'Submit your answer',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          letterSpacing: 0.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
