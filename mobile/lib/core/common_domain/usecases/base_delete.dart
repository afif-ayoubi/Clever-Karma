import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../repository/base_repository.dart';

class DeleteUseCase<T> {
  final BaseRepository repository;

  DeleteUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int id) {
    return repository.delete(id);
  }
}
