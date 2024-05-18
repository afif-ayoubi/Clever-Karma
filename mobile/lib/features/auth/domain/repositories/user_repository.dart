import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';

import 'package:mobile/core/common_domain/repository/base_repository.dart';
import 'package:mobile/features/auth/domain/entities/volunteer.dart';

abstract class UsersRepository extends BaseRepository<Volunteer> {
  Future<Either<Failure, Unit>> login(Volunteer volunteer);
  Future<Either<Failure,Unit>> logout();
}
