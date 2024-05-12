import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class UserRemoteDataSource {
  Future<Unit> createUser(UserModel user);

  Future<Unit> login(UserModel user);

  Future<Unit> logout();

  Future<Unit> updateUser(UserModel user);

  Future<UserModel> getUser();
}

const BASE_URL = "http://localhost:3000";

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> createUser(UserModel user) async {
    final body = user.toJson();
    try {
      final response = await client.post(Uri(path: '$BASE_URL/user'), body: body);
      if (response.statusCode == 201) {
        return Future.value(unit);
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
    final body = user.toJson();
    try {
      final response = await client.post(Uri(path: '$BASE_URL/user'), body: body);
      if (response.statusCode == 201) {
        return Future.value(unit);
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
