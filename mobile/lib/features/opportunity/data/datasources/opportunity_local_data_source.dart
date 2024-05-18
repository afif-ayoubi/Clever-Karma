import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:mobile/core/constants/constants.dart';
import 'package:mobile/core/error/exception.dart';
import 'package:mobile/features/opportunity/data/models/opportunity_model.dart';

abstract class OpportunityLocalDataSource {
  Future<List<OpportunityModel>> getCachedOpportunities();

  Future<Unit> cacheOpportunities(List<OpportunityModel> opportunityModels);
}

class OpportunityLocalDataSourceImpl implements OpportunityLocalDataSource {
  final Box<List<OpportunityModel>> opportunityBox;

  OpportunityLocalDataSourceImpl({required this.opportunityBox});

  @override
  Future<Unit> cacheOpportunities(List<OpportunityModel> opportunityModels) async {
    try {
      await opportunityBox.put('cached_opportunities', opportunityModels);
      print('Opportunities Cached ${opportunityModels} in "${opportunityBox.name}". Length: ${opportunityBox.length}');
      return Future.value(unit);
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<List<OpportunityModel>> getCachedOpportunities() {
    try {
      final cachedOpportunities = opportunityBox.get('cached_opportunities');
      if (cachedOpportunities != null) {
        print('Opportunities Cached ${cachedOpportunities} in "${opportunityBox.name}".');
        return Future.value(cachedOpportunities);
      } else {
        throw EmptyCacheException();
      }
    } catch (e) {
      throw EmptyCacheException();
    }
  }
}
