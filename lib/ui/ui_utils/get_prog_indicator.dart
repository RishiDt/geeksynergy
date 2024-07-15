import 'package:flutter/material.dart';

Widget getProgressIndicator(
    {Color? color, Alignment? align, EdgeInsets? padding}) {
  return Align(
    alignment: align ?? Alignment.center,
    child: Padding(
      padding: padding ?? EdgeInsets.all(8.0),
      child: CircularProgressIndicator(
        color: color ?? Colors.white,
      ),
    ),
  );
}
