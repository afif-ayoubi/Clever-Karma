import 'dart:convert';

import '../constants/constants.dart';
import 'package:http/http.dart' as http;

Future<bool> verifyOtpApi({required String number,}) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('$BASE_URL/otp/verify'));
  request.body = json.encode({"otp": "$number"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 201) {
    String responseBody = await response.stream.bytesToString();

    var decodedResponse = json.decode(responseBody);
    final bool stringResponse = decodedResponse['isValid'];

    return stringResponse;
  } else {
    print(response.reasonPhrase);
    return false;
  }
}
