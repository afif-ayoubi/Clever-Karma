import 'package:dartz/dartz.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<Unit> createUser(UserModel user);
  Future<Unit> login(UserModel user);
  Future<Unit> logout();
  Future<Unit> updateUser(UserModel user);
  Future<UserModel> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<Unit> createUser(UserModel user) {
    // TODO: implement createUser
    throw UnimplementedError();
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
