import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/auth/domain/repositories/user_repository.dart';

import '../entities/user.dart';



class LoginUserUseCase {
  final UsersRepository repository;
  LoginUserUseCase(this.repository);

  Future<Either<Failure, Unit>> call(User user) async {
    return repository.login(user);
  }
}
