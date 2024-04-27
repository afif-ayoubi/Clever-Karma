part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UsersEvent{}
class LoginUserEvent extends UsersEvent{}
class LogoutUserEvent extends UsersEvent{}
class UpdateUserEvent extends UsersEvent{}
class GetUserEvent extends UsersEvent{}