import 'dart:io';

import 'package:flutter/material.dart';

class DeviceInfo {
  static double? _deviceHeight;
  static double? _deviceWidth;

  static setHeight(double h) => _deviceHeight = h;
  static setWidth(double w) => _deviceWidth = w;

  static double get getDeviceHeight {
    if (_deviceHeight == null) throw "Device height has not been inserted";
    return _deviceHeight!;
  }

  static double get getDeviceWidth {
    if (_deviceWidth == null) throw "Device height has not been inserted";
    return _deviceWidth!;
  }
}
