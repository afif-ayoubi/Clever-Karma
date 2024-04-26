import 'package:dartz/dartz.dart';

import '../../error/failures.dart';


abstract class BaseRepository<T>{
  Future<Either<Failure, List<T>>> getAll();
  Future<Either<Failure, T>> get();
  Future<Either<Failure, Unit>> delete(int id);
  Future<Either<Failure, Unit>> update(T dto);
  Future<Either<Failure, Unit>> create(T dto);
}