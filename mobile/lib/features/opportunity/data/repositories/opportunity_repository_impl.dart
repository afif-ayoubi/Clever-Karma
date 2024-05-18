import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/opportunity/domain/entities/opportunity.dart';
import 'package:mobile/features/opportunity/domain/repositories/opportunity_repository.dart';

import '../../../../core/network/network_info.dart';

class OpportunityRepositoryImpl implements OpportunityRepository {
  final NetworkInfo networkInfo;

  OpportunityRepositoryImpl({required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> create(Opportunity dto) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Opportunity>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Opportunity>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> update(Opportunity dto) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
