part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

final class LoadingUsersState extends UsersState {}

final class LoadedUsersState extends UsersState {
  @override
  List<Object> get props => [];
}

final class ErrorUsersState extends UsersState {
  final String message;
  const ErrorUsersState({required this.message});
  @override
  List<Object> get props => [];
}
final class SuccessUserState extends UsersState {
  final String message;
  const SuccessUserState({required this.message});
  @override
  List<Object> get props => [message];
}
