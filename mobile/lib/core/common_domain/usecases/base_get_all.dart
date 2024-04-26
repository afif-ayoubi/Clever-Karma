import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../repository/base_repository.dart';

class GetAllUseCase<T> {
  final BaseRepository<T> repository;

  GetAllUseCase(this.repository);

  Future<Either<Failure, List<T>>> call() async {
    return  repository.getAll();
  }
}
