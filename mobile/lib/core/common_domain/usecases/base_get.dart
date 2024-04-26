import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../repository/base_repository.dart';

class GetUseCase<T> {
  final BaseRepository<T> repository;

  GetUseCase(this.repository);
  Future<Either<Failure, T>> call() async {
    return  repository.get();
  }
}
