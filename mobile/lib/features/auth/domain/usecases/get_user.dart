import 'package:mobile/core/common_domain/usecases/base_get.dart';

import '../entities/user.dart';


class GetUserUseCase extends GetUseCase<User> {
  GetUserUseCase(super.repository);
}
