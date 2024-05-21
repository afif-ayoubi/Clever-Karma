import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

import '../util/snackbar_message.dart';

Future<bool> sendOtpApi(
    {required String email, required BuildContext context}) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('$BASE_URL/otp/send'));
  request.body = json.encode({"email": "$email"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 201) {
    print(await response.stream.bytesToString());
    SnackBarMessage.instance.showSuccessSnackBar(
      message: 'Check Your Email ',
      context: context,
    );
    return true;
  } else {

    print(response.reasonPhrase);
    SnackBarMessage.instance.showErrorSnackBar(
      message: 'User not found',
      context: context,
    );
    return false;
  }
}
