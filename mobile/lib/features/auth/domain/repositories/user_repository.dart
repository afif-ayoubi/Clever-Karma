import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/auth/domain/entities/user.dart';

import 'package:mobile/core/common_domain/repository/base_repository.dart';

abstract class UsersRepository extends BaseRepository<User> {
  Future<Either<Failure, Unit>> login(User user);
  Future<Either<Failure,Unit>> logout();
}
