import 'dart:async';

import 'package:byte_wolves/constants/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomContainers.backgroundContainer,
          SizedBox(
            height: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 10),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(ImagesConstants.logoImage),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Byte Wolves',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
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
