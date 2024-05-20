import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

import '../util/snackbar_message.dart';

Future<bool> SendNotification(
    {required String title,
    required BuildContext context,
    required String body}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };
  var request =
      http.Request('POST', Uri.parse('$BASE_URL/firebase/send-notification'));
  request.body = json.encode({"title": "$title", "body": "$body"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 201) {
    print(await response.stream.bytesToString());
    SnackBarMessage.instance.showSuccessSnackBar(
      message: 'Notification sent successfully',
      context: context,
    );
    return true;
  } else {
    print(response.reasonPhrase);
    SnackBarMessage.instance.showErrorSnackBar(
      message: 'Error',
      context: context,
    );
    return false;
  }
}
