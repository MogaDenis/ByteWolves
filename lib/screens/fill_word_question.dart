import 'package:byte_wolves/constants/constants.dart';
import 'package:byte_wolves/models/answer.dart';
import 'package:flutter/material.dart';

class FillWordQuestion extends StatefulWidget {
  final String text;
  final Answer answer;
  const FillWordQuestion({super.key, required this.text, required this.answer});

  @override
  // ignore: library_private_types_in_public_api
  _FillWordQuestionState createState() => _FillWordQuestionState();
}

class _FillWordQuestionState extends State<FillWordQuestion> {
  void _checkAnswer(Answer ans) {
    if (!ans.isCorrect) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Incorrect!'),
        duration: Duration(seconds: 1),
      ));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Correct!'),
      duration: Duration(seconds: 1),
    ));
  }

  Widget _question() {
    return Text(
      widget.text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextField(TextEditingController tcontroller) {
    return TextField(
      controller: tcontroller,
      decoration: const InputDecoration(
        labelText: 'Answer',
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _submitButton(Function onPrssd) {
    return ElevatedButton(
      onPressed: () {
        onPrssd();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      child: const Text('Submit'),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tcontroller = TextEditingController();

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(children: <Widget>[
              CustomContainers.backgroundContainer,
              SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 100, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _question(),
                          const SizedBox(height: 20),
                          const Image(
                              image: AssetImage(ImagesConstants.fullWolfImage)),
                          _buildTextField(tcontroller),
                          const SizedBox(height: 20),
                          _submitButton(() {
                            _checkAnswer(Answer(
                                answerText: tcontroller.text,
                                isCorrect: tcontroller.text ==
                                    widget.answer.answerText));
                          }),
                        ],
                      )))
            ])));
  }
}
