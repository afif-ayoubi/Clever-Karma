import 'package:mobile/core/common_domain/usecases/base_create.dart';
import 'package:mobile/features/auth/domain/entities/user.dart';

class CreateUserUseCase extends CreateUseCase<User>{
  CreateUserUseCase(super.repository);
}