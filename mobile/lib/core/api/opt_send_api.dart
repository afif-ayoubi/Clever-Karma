import 'dart:convert';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

Future<bool> sendOtpApi({required String email}) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('$BASE_URL/otp/send'));
  request.body = json.encode({"email": "$email"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    return true;
  } else {
    print(response.reasonPhrase);
    return false;
  }
}
