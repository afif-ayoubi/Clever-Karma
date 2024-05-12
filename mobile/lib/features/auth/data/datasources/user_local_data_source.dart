import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:mobile/core/error/exception.dart';
import 'package:mobile/features/auth/domain/entities/user.dart';

import '../../../../core/constants/constants.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getCachedUser();

  Future<Unit> cacheUser(UserModel userModel);
}

final _userBox = Hive.box<UserModel>(USER_BOX);
const CACHED_USER = "CACHED_USER";

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<Unit> cacheUser(UserModel userModel) async {
    await _userBox.put(CACHED_USER, userModel);
    print(
        'User Cached ${userModel} in "${_userBox.name}". Length: ${_userBox.length}');
    return Future.value(unit);
  }

  @override
  Future<UserModel> getCachedUser() {
 
  }


}


