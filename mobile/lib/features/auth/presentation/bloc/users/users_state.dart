part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

final class LoadingUsersState extends UsersState {}

final class ErrorUsersState extends UsersState {
  final String message;
  const ErrorUsersState({required this.message});
  @override
  List<Object> get props => [];
}
final class SuccessUserState extends UsersState {
  final String role;
  const SuccessUserState({required this.role});
  @override
  List<Object> get props => [role];
}
