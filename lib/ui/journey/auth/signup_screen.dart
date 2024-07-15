import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/configs/device_info.dart';
import 'package:flutter_application_1/data/persistant_storage.dart';
import 'package:flutter_application_1/ui/journey/auth/login_screen.dart';
import 'package:flutter_application_1/ui/journey/welcome/welcome_screen.dart';
import 'package:flutter_application_1/ui/ui_utils/constants/ui_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final height = DeviceInfo.getDeviceHeight;
  final width = DeviceInfo.getDeviceWidth;
  final _formKey = GlobalKey<FormState>();
  final List<String> professions = <String>[
    'Profession',
    'Engineer',
    'Doctor',
    'Teacher',
    'Other'
  ];
  String _currentProfession = 'Profession';
  late String _name;
  late String _email;
  late String _password;
  late String _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: 20,
            child: Text(
              'To signup, fill following details.',
              style: TextStyle(fontSize: 15),
            )),
        Container(
          height: height * 0.75,
          padding: const EdgeInsets.all(16.0),
          margin: EdgeInsets.fromLTRB(20, height * 0.10, 20, 0),
          decoration: BoxDecoration(
            color: UiColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNameField(),
                SizedBox(height: 16.0),
                _buildEmailField(),
                SizedBox(height: 16.0),
                _buildPasswordField(),
                SizedBox(height: 16.0),
                _buildPhoneField(),
                SizedBox(height: 16.0),
                _buildProfessionDropdown(),
                SizedBox(height: 70.0),
                _buildSignUpButton(),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Please enter your name';
        }
        _name = value!;
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value!)) {
          return 'Please enter a valid email address';
        }
        _email = value;
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

  Widget _buildPhoneField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone Number'),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Please enter your phone number';
        }
        if (value!.length != 10) {
          return 'Please enter a valid phone number';
        }
        _phone = value;
        return null;
      },
    );
  }

  Widget _buildProfessionDropdown() {
    return DropdownButtonFormField<String>(
      value: _currentProfession,
      items: professions.map((String profession) {
        return DropdownMenuItem<String>(
          value: profession,
          child: Text(profession),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _currentProfession = newValue ?? _currentProfession;
        });
      },
      validator: (value) {
        if (value == 'Profession') {
          return 'Please select your profession';
        }
        return null;
      },
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          debugPrint(
              '[SignUpScreen] name:${_name}, email:${_email}, phone:${_phone}, password:${_password}, profession:${_currentProfession}');
          await PersistantStorage.storeUserAndPass(
              _name.trim(), _password.trim());
          await PersistantStorage.storeUserAndInfo(_name.trim(), [
            "phone",
            _phone.trim(),
            "email",
            _email.trim(),
            "profession",
            _currentProfession.trim()
          ]);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (c) => WelcomeScreen()),
              (route) => false);
        }
      },
      child: Text('Sign Up'),
    );
  }
}
