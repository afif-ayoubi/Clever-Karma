import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';

abstract class Validation{

  static String? validate(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      // return AppLocalizations.of(context).required_field;
    }
    return null;
  }

  // static String? validateEmail(String? email, BuildContext context) {
  //   return (email != null && !EmailValidator.validate(email))
  //       ? AppLocalizations.of(context).email_validation
  //       : null;
  // }

  static String? validatePassword(String? password, BuildContext context) {
    if (password!.length <= 7) {
      // return AppLocalizations.of(context).password_validation;
    }
    if (password.isEmpty) {
      // return AppLocalizations.of(context).required_field;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password, BuildContext context) {
    if (value == null || value.isEmpty) {
      // return AppLocalizations.of(context).required_field;
    }
    if (value != password) {
      // return AppLocalizations.of(context).repeat_password_validation;
    }
    return null;
  }
}