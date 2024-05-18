import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:mobile/core/error/exception.dart';
import 'package:mobile/features/opportunity/data/models/opportunity_model.dart';


abstract class OpportunityLocalDataSource {
  Future<List<OpportunityModel>> getCashedOpportunities();

  Future<Unit> casheOpportunities(List<OpportunityModel> opportunityModels);
}

const CACHED_OPPORTUNITY = "CACHED_USER";

class OpportunityLocalDataSourceImpl implements OpportunityLocalDataSource {
  final Box<List<OpportunityModel>> opportunityBox;

  OpportunityLocalDataSourceImpl({required this.opportunityBox});
  @override
  Future<Unit> casheOpportunities(List<OpportunityModel> opportunityModels) async {
    await opportunityBox.put(CACHED_OPPORTUNITY, opportunityModels);
    print(
        'User Cached ${opportunityModels} in "${opportunityBox.name}". Length: ${opportunityBox.length}');
    return Future.value(unit);
  }
  @override
  Future<List<OpportunityModel>> getCashedOpportunities() {
    final cashedOpportunity = opportunityBox.get(CACHED_OPPORTUNITY);
    if (cashedOpportunity != null) {
      print('User Cached ${cashedOpportunity} in "${opportunityBox.name}".');
      return Future.value(cashedOpportunity);
    } else {
      throw EmptyCacheException();
    }
  }


}


