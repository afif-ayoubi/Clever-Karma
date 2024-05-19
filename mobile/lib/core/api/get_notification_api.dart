import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile/core/api/providers/loader_provider.dart';
import 'package:mobile/core/api/providers/notification_provider.dart';
import 'package:mobile/features/opportunity/domain/entities/notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

import '../util/snackbar_message.dart';

Future<bool> GetNotifications(BuildContext context) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('token');
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };
  var request = http.Request('get', Uri.parse('$BASE_URL/firebase'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseBody = await response.stream.bytesToString();

    var decodedResponse = json.decode(responseBody);

    final List<Notifications> list = decodedResponse
        .map<Notifications>((e) => Notifications.fromJson(e))
        .toList();

    Provider.of<NotificationsProvider>(context, listen: false)
        .setNotifications(list);

    return true;
  } else {
    print(response.reasonPhrase);

    return false;
  }
}
