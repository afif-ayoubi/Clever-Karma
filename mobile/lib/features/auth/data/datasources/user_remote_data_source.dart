import 'package:dartz/dartz.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<Unit> createUser(UserModel user);
  Future<Unit> login(UserModel user);
  Future<Unit> logout();
  Future<Unit> updateUser(UserModel user);
  Future<UserModel> getUser();
}
const baseURL="http://localhost:3000";
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});
  @override
  Future<Unit> createUser(UserModel user) async {
    final body = user.toJson();
    final response = await client.post(Uri(path: '$baseURL/user'), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    }else{
      throw Exception();
    }
  }

  @override
  Future<UserModel> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Unit> login(UserModel user) {
    // TODO: implement login
    throw UnimplementedError();
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
