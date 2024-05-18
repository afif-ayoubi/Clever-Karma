import 'dart:convert';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../models/opportunity_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class OpportunityRemoteDataSource {
  Future<List<OpportunityModel>> getOpportunities();
}

class OpportunityRemoteDataSourceImpl implements OpportunityRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  OpportunityRemoteDataSourceImpl(
      {required this.client, required this.sharedPreferences});

  @override
  Future<List<OpportunityModel>> getOpportunities() async {
    SharedPreferences sp;

    sp = await SharedPreferences.getInstance();
    String? token = sp.getString(TOKEN);
    try {
      final response = await client.get(
        Uri.parse(BASE_URL + "/section"),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        final List<OpportunityModel> opportunities = decodedJson
            .map<OpportunityModel>((e) => OpportunityModel.fromJson(e))
            .toList();
        return opportunities;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print("Caught an exception: $e");
      throw e;
    }
  }
}
