import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile/core/api/providers/notification_provider.dart';
import 'package:mobile/core/api/providers/user_provider.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';
import 'package:mobile/features/opportunity/domain/entities/notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

import '../util/snackbar_message.dart';

Future<bool> GetUser(BuildContext context) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('token');
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };
  var request = http.Request('get', Uri.parse('$BASE_URL/user'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseBody = await response.stream.bytesToString();

    var decodedResponse = json.decode(responseBody);

    final user =  UserModel.fromJson(decodedResponse);

    Provider.of<UserProvider>(context, listen: false)
        .addUser(user);

    return true;
  } else {
    print(response.reasonPhrase);

    return false;
  }
}
