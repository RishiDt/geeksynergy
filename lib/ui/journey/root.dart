import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/device_info.dart';
import 'package:flutter_application_1/ui/journey/welcome/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _storeDeviceDimensions(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }

  _storeDeviceDimensions(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    DeviceInfo.setHeight(screenHeight);
    DeviceInfo.setWidth(screenWidth);
  }
}
