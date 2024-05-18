import 'package:mobile/core/common_domain/usecases/base_get.dart';
import 'package:mobile/features/auth/domain/entities/volunteer.dart';



class GetUserUseCase extends GetUseCase<Volunteer> {
  GetUserUseCase(super.repository);
}
