part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UsersEvent{
  final User user;
  CreateUserEvent({required this.user});
  @override
  List<Object> get props => [user];

}
class LoginUserEvent extends UsersEvent{
  final User user;
  LoginUserEvent({required this.user});
  @override
  List<Object> get props => [user];
}
class LogoutUserEvent extends UsersEvent{
  
}
class UpdateUserEvent extends UsersEvent{
  final User user;
  UpdateUserEvent({required this.user});
  @override
  List<Object> get props => [user];
}
class GetUserEvent extends UsersEvent{}