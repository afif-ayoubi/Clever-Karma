import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/auth/domain/repositories/user_repository.dart';

class LogoutUserUseCase {
  final UsersRepository repository;
  LogoutUserUseCase(this.repository);
  Future<Either<Failure, Unit>> call() async {
    return repository.logout();
  }
}
