import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../repository/base_repository.dart';

class UpdateUseCase<T> {
  final BaseRepository<T> repository;

  UpdateUseCase(this.repository);

  Future<Either<Failure, Unit>> call(T dto) async {
    return repository.update(dto);
  }
}
