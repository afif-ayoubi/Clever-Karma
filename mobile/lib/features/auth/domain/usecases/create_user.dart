import 'package:mobile/core/common_domain/usecases/base_create.dart';
import 'package:mobile/features/auth/domain/entities/volunteer.dart';

class CreateUserUseCase extends CreateUseCase<Volunteer>{
  CreateUserUseCase(super.repository);
}