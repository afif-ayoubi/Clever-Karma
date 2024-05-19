import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

import '../util/snackbar_message.dart';

Future<bool> UpdateApi(
  String email,
  String firstName,
  String lastname,
  String phone,
  String gender,
  DateTime dataOfBirth,
  String image,
  BuildContext context,
) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('token');
  var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
  var request =
      http.Request('PATCH', Uri.parse('$BASE_URL/user'));
  request.body = json.encode({
    "firstName": "$firstName",
    "lastName": "$lastname",
    "email": "$email",
    "userInfo": {
      "phone": "$phone",
      "gender": "$gender",
      "dateOfBirth": "$dataOfBirth",
      "image": "$image"
    }
  });

  request.headers.addAll(headers);
  print(request.body);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    return true;
  } else {
    print(response.reasonPhrase);
    SnackBarMessage.instance.showErrorSnackBar(
      message: 'you should pick all fields',
      context: context,
    );
    return false;
  }
}
