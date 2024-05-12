import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/network/network_info.dart';
import 'package:mobile/features/auth/data/datasources/user_local_data_source.dart';
import 'package:mobile/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:mobile/features/auth/domain/entities/user.dart';
import 'package:mobile/features/auth/domain/repositories/user_repository.dart';
import '../../../../core/error/exception.dart';
import '../models/user_model.dart';

typedef Future<Unit> UserMethods();

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
    return _getMessage(() => remoteDataSource.createUser(userModel));
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> get() async{
    if(await networkInfo.isConnected){
      try {
        final user = await remoteDataSource.getUser();
        localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final user = await localDataSource.getCachedUser();
        return Right(user);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> login(user) {
    final UserModel userModel = UserModel.fromUser(user);
    return _getMessage(() => remoteDataSource.login(userModel));
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

  Future<Either<Failure, Unit>> _getMessage(UserMethods userMethods) async {
    if (await networkInfo.isConnected) {
      try {
        await userMethods();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
