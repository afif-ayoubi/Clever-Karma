import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/core/constants/failure.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/auth/data/repositories/user_repository_impl.dart';
import 'package:mobile/features/auth/domain/usecases/create_user.dart';
import 'package:mobile/features/auth/domain/usecases/get_user.dart';
import 'package:mobile/features/auth/domain/usecases/login_user.dart';
import 'package:mobile/features/auth/domain/usecases/logout_user.dart';
import 'package:mobile/features/auth/domain/usecases/update_user.dart';

import '../../../../../core/constants/message.dart';
import '../../../domain/entities/user.dart';

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
        final failureOrDoneMessage= await createUserUseCase(event.user);
        emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
      } else if (event is LoginUserEvent) {
        emit(LoadingUsersState());
        final failureOrDoneMessage= await loginUserUseCase(event.user);
        emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage, LOGIN_SUCCESS_MESSAGE));
      } else if (event is LogoutUserEvent) {
        emit(LoadingUsersState());
      } else if (event is UpdateUserEvent) {
        emit(LoadingUsersState());
        final failureOrDoneMessage= await updateUserUseCase(event.user);
        emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE));
      } else if (event is GetUserEvent) {
        emit(LoadingUsersState());
      }
    });
  }
  UsersState  _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
          (failure) => ErrorUsersState(
        message: _mapFailureToMessage(failure),
      ),
          (_) => SuccessUserState(message: message),
    );
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
