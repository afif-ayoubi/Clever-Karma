import 'package:mobile/core/common_domain/usecases/base_get.dart';
import 'package:mobile/core/common_domain/usecases/base_get_all.dart';
import 'package:mobile/features/opportunity/domain/entities/opportunity.dart';



class GetOpportunityUseCase extends GetAllUseCase<Opportunity> {
  GetOpportunityUseCase(super.repository);
}
