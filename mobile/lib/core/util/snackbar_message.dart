import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/theme/hex_color.dart';

class SnackBarMessage{
  SnackBarMessage._();
  static final SnackBarMessage _instance = SnackBarMessage._();
  static SnackBarMessage get instance => _instance;
  void showSuccessSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: HexColor.whiteColor),
        ),
        backgroundColor: HexColor.primaryColor,
      ),
    );
  }
  void showErrorSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: HexColor.whiteColor),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }


}