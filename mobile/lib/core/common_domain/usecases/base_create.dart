import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_domain/repository/base_repository.dart';

import '../../error/failures.dart';

class CreateUseCase<T> {
  final BaseRepository repository;

  CreateUseCase(this.repository);

  Future<Either<Failure, Unit>> call(T dto) async {
    return repository.create(dto);
  }
}
