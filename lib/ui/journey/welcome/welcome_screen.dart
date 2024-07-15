import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/journey/auth/login_screen.dart';
import 'package:flutter_application_1/ui/journey/auth/signup_screen.dart';
import 'package:flutter_application_1/ui/ui_utils/constants/ui_colors.dart';
import 'package:flutter_application_1/ui/ui_utils/show_toast.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('WELCOME'),
        ),
      ),
      body: Stack(children: [
        Positioned(
          child: Container(
            width: 300,
            height: 300,
            margin: EdgeInsets.fromLTRB(50, 200, 50, 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: UiColors.primaryColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLoginButton(context),
                  SizedBox(height: 16.0),
                  _buildSignUpButton(context),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 100,
            right: 0,
            child: Image.asset(
              'assets/images/par-light-right.png',
              height: 200,
            ))
      ]),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Text('Login'),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      },
      child: Text('Sign Up'),
    );
  }
}
