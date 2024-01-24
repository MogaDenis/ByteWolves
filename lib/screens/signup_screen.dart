import 'package:byte_wolves/constants/constants.dart';
import 'package:byte_wolves/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextFieldController =
      TextEditingController();

  Widget _buildUsernameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Username',
          style: CustomTextStyles.labelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: CustomBoxDecorations.boxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _usernameTextFieldController,
            keyboardType: TextInputType.name,
            style: CustomTextStyles.textFieldTextStyle,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Choose an username',
              hintStyle: CustomTextStyles.hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: CustomTextStyles.labelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: CustomBoxDecorations.boxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _passwordTextFieldController,
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Set a password',
              hintStyle: CustomTextStyles.hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Confirm Password',
          style: CustomTextStyles.labelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: CustomBoxDecorations.boxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _confirmPasswordTextFieldController,
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Repeat your password',
              hintStyle: CustomTextStyles.hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {}, // TODO
        child: const Text(
          'Sign Up',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 0.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildAlreadyAnUserButton() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          width: double.infinity,
          child: Center(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          width: double.infinity,
          child: ElevatedButton(
            // Return to the Sign In scrren.
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LogInScreen()));
            },
            child: const Text(
              'Log In',
              style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 0.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // When the keyboard is up, if the screen is pressed then the keyboard is closed.
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            CustomContainers.backgroundContainer,
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 60.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
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
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    _buildUsernameTextField(),
                    const SizedBox(height: 20.0),
                    _buildPasswordTextField(),
                    const SizedBox(height: 20.0),
                    _buildConfirmPasswordTextField(),
                    const SizedBox(height: 20.0),
                    _buildSignUpButton(),
                    _buildAlreadyAnUserButton(),
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
