import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

import '../util/snackbar_message.dart';

Future<bool> changePasswordApi(
    {required String email,
    required BuildContext context,
    required String password}) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('PATCH', Uri.parse('$BASE_URL/user/change-password'));
  request.body = json.encode({"email": "$email", "newPassword": "$password"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    return true;
  } else {
    print(response.reasonPhrase);
    SnackBarMessage.instance.showErrorSnackBar(
      message: 'Something Wrong',
      context: context,
    );
    return false;
  }
}
