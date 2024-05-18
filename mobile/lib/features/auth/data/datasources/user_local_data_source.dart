import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:mobile/core/constants/constants.dart';
import 'package:mobile/core/error/exception.dart';

import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getCachedUser();

  Future<Unit> cacheUser(UserModel userModel);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Box<UserModel> userBox;

  UserLocalDataSourceImpl({required this.userBox});

  @override
  Future<Unit> cacheUser(UserModel userModel) async {
    await userBox.put(USER_BOX, userModel);
    print(
        'User Cached ${userModel} in "${userBox.name}". Length: ${userBox.length}');
    return Future.value(unit);
  }

  @override
  Future<UserModel> getCachedUser() {
    final cachedUser = userBox.get(USER_BOX);
    if (cachedUser != null) {
      print('User Cached ${cachedUser} in "${userBox.name}".');
      return Future.value(cachedUser);
    } else {
      throw EmptyCacheException();
    }
  }
}
