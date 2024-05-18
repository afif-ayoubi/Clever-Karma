import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';

abstract class UserRemoteDataSource {
  Future<Unit> createUser(UserModel user);

  Future<Unit> login(UserModel user);

  Future<Unit> logout();

  Future<Unit> updateUser(UserModel user);

  Future<UserModel> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  UserRemoteDataSourceImpl(
      {required this.client, required this.sharedPreferences});

  @override
  Future<Unit> createUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? fcmToken = prefs.getString('fcmToken');

    final userWithToken = UserModel(
      email: user.email,
      password: user.password,
      fcmToken: fcmToken,
    );

    final body = jsonEncode(userWithToken.toJson());

    try {
      final response = await client.post(
        Uri.parse('$BASE_URL/user/create'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        final String token = jsonResponse[TOKEN];
        await prefs.setString(TOKEN, token);
        return Future.value(unit);
      } else if (response.statusCode == 422) {
        throw EmailAlreadyTakenException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      print("Caught an exception: $e");
      throw e;
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final response = await client.get(
        Uri.parse(BASE_URL + "/user"),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        final UserModel userModel = UserModel.fromJson(decodedJson);
        return userModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print("Caught an exception: $e");
      throw e;
    }
  }

  @override
  Future<Unit> login(UserModel user) async {
    SharedPreferences sp;

    sp = await SharedPreferences.getInstance();
    String? token = sp.getString(TOKEN);
    final body = user.toJson1();
    print(body);
    try {
      final response = await client.post(
        Uri.parse('$BASE_URL/user/login'),
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        final String token = jsonResponse[TOKEN];
        final String role = jsonResponse[ROLE];

        sharedPreferences.setString(TOKEN, token);
        sharedPreferences.setString(ROLE, role);

        return Future.value(unit);
      } else if (response.statusCode == 422) {
        throw WrongCredentialException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      print("Caught an exception: $e");
      throw e;
    }
  }

  @override
  Future<Unit> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Unit> updateUser(UserModel user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
