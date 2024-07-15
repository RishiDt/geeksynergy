import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/device_info.dart';
import 'package:flutter_application_1/ui/ui_utils/constants/ui_colors.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = DeviceInfo.getDeviceHeight;
    final width = DeviceInfo.getDeviceWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Container(
          height: height / 2,
          width: width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: UiColors.primaryColor,
                blurRadius: 10.0,
                spreadRadius: 5.0,
              ),
              BoxShadow(
                color: UiColors.primaryColor,
                blurRadius: 20.0,
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Company Name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: UiColors.primaryColor,
                  ),
                ),
                Text(' Geeksynergy Technologies Pvt Ltd'),
                SizedBox(height: 16),
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: UiColors.primaryColor,
                  ),
                ),
                Text('Sanjayanagar, Bengaluru-56'),
                SizedBox(height: 8),
                Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: UiColors.primaryColor,
                  ),
                ),
                Text('XXXXXXXX09'),
                SizedBox(height: 8),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: UiColors.primaryColor,
                  ),
                ),
                Text('xxxx@gmail.com')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
