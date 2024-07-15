import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/device_info.dart';
import 'package:flutter_application_1/data/persistant_storage.dart';
import 'package:flutter_application_1/ui/journey/home/home_screen.dart';
import 'package:flutter_application_1/ui/ui_utils/constants/ui_colors.dart';
import 'package:flutter_application_1/ui/ui_utils/show_toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final height = DeviceInfo.getDeviceHeight;
  final width = DeviceInfo.getDeviceWidth;
  late String _name;
  late String _password;
  // late String _email;
  //   late String _profession;
  // late String _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: height / 4 - 50,
            child: Text(
              'Lets get back.',
              style: TextStyle(fontSize: 15),
            )),
        Container(
          height: 400,
          margin: EdgeInsets.fromLTRB(20, height / 4, 20, height / 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: UiColors.primaryColor),
          child: Center(
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildNameField(),
                    SizedBox(height: 16.0),
                    _buildPasswordField(),
                    SizedBox(height: 50.0),
                    _buildLoginButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Please enter your name';
        }
        _name = value!;
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Please enter a password';
        }
        if (value!.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        _password = value;

        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          signInUser();
        }
      },
      child: Text('Login'),
    );
  }

  signInUser() async {
    if (_name.isNotEmpty && _password.isNotEmpty) {
      Map? creds = await PersistantStorage.getUserCredsIfExist(_name.trim());
      debugPrint('[LogInScreen] creds is $creds');
      if ((creds != null) && _password == (creds[_name.trim()] as String)) {
        debugPrint('[LogInScreen] log in success !');
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (c) => HomeScreen()), (r) => false);
      } else {
        debugPrint('[LogInScreen] log in failed. password does not match !');
        if (mounted) {
          await showAlignedToast(
              'Invalid Credentials', Alignment.bottomCenter, context);
        }
      }
    } else {
      if (mounted) {
        await showAlignedToast('Cant signin with empty name and password',
            Alignment.bottomCenter, context);
      }
      throw "Cant signin with empty name and password";
    }
  }
}
