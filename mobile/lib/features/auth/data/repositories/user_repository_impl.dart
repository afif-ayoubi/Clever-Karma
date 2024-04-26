import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/auth/data/datasources/user_local_data_source.dart';
import 'package:mobile/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:mobile/features/auth/domain/entities/user.dart';
import 'package:mobile/features/auth/domain/repositories/user_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  // final UserRemoteDataSource postRemoteDataSource;
// final UserLocalDataSource postLocalDataSource;
  @override
  Future<Either<Failure, Unit>> create(dto) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> login(User user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> update(dto) {
    // TODO: implement update
    throw UnimplementedError();
  }



}
