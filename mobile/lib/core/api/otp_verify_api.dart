import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

import '../util/snackbar_message.dart';

Future<bool> verifyOtpApi({required String number,required BuildContext context}) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('$BASE_URL/otp/verify'));
  request.body = json.encode({"otp": "$number"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 201) {
    String responseBody = await response.stream.bytesToString();

    var decodedResponse = json.decode(responseBody);
    final bool stringResponse = decodedResponse['isValid'];
    SnackBarMessage.instance.showSuccessSnackBar(
      message: 'OTP verified successfully. ',
      context: context,
    );
    return stringResponse;
  } else {
    print(response.reasonPhrase);
    SnackBarMessage.instance.showErrorSnackBar(
      message: 'Wrong Otp',
      context: context,
    );
    return false;
  }
}
