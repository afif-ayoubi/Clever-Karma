import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_domain/repository/base_repository.dart';
import 'package:mobile/core/error/failures.dart';

class BaseRepositoryImpl extends BaseRepository{
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
  Future<Either<Failure, Unit>> update(dto) {
    // TODO: implement update
    throw UnimplementedError();
  }

}