import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile/core/api/providers/loader_provider.dart';
import 'package:mobile/core/api/providers/notification_provider.dart';
import 'package:mobile/core/api/providers/organization_providers.dart';
import 'package:mobile/features/opportunity/domain/entities/notifications.dart';
import 'package:mobile/features/opportunity/domain/repositories/organization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

import '../util/snackbar_message.dart';

Future<bool> GetOrganizations(BuildContext context, String id) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('token');
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };
  var request =
      http.Request('get', Uri.parse('$BASE_URL/user/volunteering-section/$id'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseBody = await response.stream.bytesToString();

    var decodedResponse = json.decode(responseBody);

    final List<Organization> list = decodedResponse
        .map<Organization>((e) => Organization.fromJson(e))
        .toList();
    for (var i = 0; i < list.length; i++) {
      print(list[i].name);
      print(list.length);
    }
    Provider.of<OrganizationsProvider>(context, listen: false)
        .setOrganizations(list);

    return true;
  } else {
    print(response.reasonPhrase);

    return false;
  }
}
