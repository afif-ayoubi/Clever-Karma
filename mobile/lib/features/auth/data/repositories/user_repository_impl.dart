import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/network/network_info.dart';
import 'package:mobile/features/auth/data/datasources/user_local_data_source.dart';
import 'package:mobile/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';
import 'package:mobile/features/auth/domain/entities/user.dart';
import 'package:mobile/features/auth/domain/repositories/user_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  UsersRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, Unit>> create(user) {
    final UserModel userModel = UserModel.fromUser(user);
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<User>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> login(user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> update(user) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  Future<Either<Failure, Unit>> _getMessage(Fu) {}
}
