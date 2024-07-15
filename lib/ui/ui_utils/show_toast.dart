import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/ui_utils/constants/ui_colors.dart';

showAlignedToast(String msg, Alignment alignment, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: UiColors.primaryColor,
      showCloseIcon: true,
      closeIconColor: Colors.black,
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      duration: Duration(seconds: 5),
      content: Text(
        msg,
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    ),
  );
}
