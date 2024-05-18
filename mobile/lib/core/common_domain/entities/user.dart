import 'package:equatable/equatable.dart';


class User  with EquatableMixin {
  final int? id;

  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final String role;


  User({
    this.id,
    this.firstName,
    required this.role,
    this.lastName,
    required this.email,
    required this.password,

  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    password,
    role,

  ];
}
