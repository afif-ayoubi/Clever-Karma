import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/core/constants/failure.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/auth/domain/usecases/create_user.dart';
import 'package:mobile/features/auth/domain/usecases/get_user.dart';
import 'package:mobile/features/auth/domain/usecases/login_user.dart';
import 'package:mobile/features/auth/domain/usecases/logout_user.dart';
import 'package:mobile/features/auth/domain/usecases/update_user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final CreateUserUseCase createUserUseCase;
  final LoginUserUseCase loginUserUseCase;
  final LogoutUserUseCase logoutUserUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final GetUserUseCase getUserUseCase;
  UsersBloc(
      {required this.createUserUseCase,
      required this.getUserUseCase,
      required this.loginUserUseCase,
      required this.logoutUserUseCase,
      required this.updateUserUseCase})
      : super(UsersInitial()) {
    on<UsersEvent>((event, emit) async {
      if (event is CreateUserEvent) {
        emit(LoadingUsersState());
      } else if (event is LoginUserEvent) {
        emit(LoadingUsersState());
      } else if (event is LogoutUserEvent) {
        emit(LoadingUsersState());
      } else if (event is UpdateUserEvent) {
        emit(LoadingUsersState());
      } else if (event is GetUserEvent) {
        emit(LoadingUsersState());
      }
    });
  }
   String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure _:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected  Error, Please try again later";
    }
  }
}
