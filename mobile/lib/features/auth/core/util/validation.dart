import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';

abstract class Validation {
  static String? validate(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String? validateEmail(String? email, BuildContext context) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    }
    if (!EmailValidator.validate(email)) {
      return "Invalid email format";
    }
    return null;
  }

  static String? validatePassword(String? password, BuildContext context) {
    if (password == null || password.isEmpty) {
      return "Password cannot be empty";
    }
    if (password.length <= 7) {
      return "Password must be at least 8 characters long";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
