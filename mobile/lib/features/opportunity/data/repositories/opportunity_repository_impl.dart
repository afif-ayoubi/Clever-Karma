import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/opportunity/data/datasources/opportunity_local_data_source.dart';
import 'package:mobile/features/opportunity/data/datasources/opportunity_remote_data_source.dart';
import 'package:mobile/features/opportunity/data/models/opportunity_model.dart';
import 'package:mobile/features/opportunity/domain/entities/opportunity.dart';
import 'package:mobile/features/opportunity/domain/repositories/opportunity_repository.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';

class OpportunityRepositoryImpl implements OpportunityRepository {
  final NetworkInfo networkInfo;
  final OpportunityRemoteDataSource remoteDataSource;
  final OpportunityLocalDataSource localDataSource;

  OpportunityRepositoryImpl(
      {required this.networkInfo, this.remoteDataSource, this.localDataSource});

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
  Future<Either<Failure, List<Opportunity>>> getAll() async {
    if (await networkInfo.isConnected) {
      try {
        final List<OpportunityModel> list =
            await remoteDataSource.getOpportunities();
        localDataSource.casheOpportunities(list);
        return Right(list);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final opportunity = await localDataSource.getCashedOpportunities();
        return Right(opportunity);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> update(Opportunity dto) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
