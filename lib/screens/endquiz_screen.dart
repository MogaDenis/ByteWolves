
import 'package:flutter/material.dart';
import 'package:byte_wolves/constants/constants.dart';

class EndQuizScreen extends StatelessWidget {
  final int score;

  const EndQuizScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomContainers.backgroundContainer,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                Text(
                  'Quiz Score:',
                  style: CustomTextStyles.labelStyle
                      .copyWith(fontSize: 28), // Increase font size
                ),
                Text(
                  '$score',
                  style: CustomTextStyles.labelStyle
                      .copyWith(fontSize: 48), // Increase font size
                ),
                const SizedBox(
                    height:
                        70), // Add some space between the score and the image
                Image.asset(
                  ImagesConstants
                      .trophyImage, // Replace with the path to your image
                  height: 250, // Adjust the height of the image as needed
                ),
                const SizedBox(
                    height:
                        90), // Add some space between the image and the button
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to the quiz screen or any other screen
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Go Back',
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
        ],
      ),
    );
  }
}
