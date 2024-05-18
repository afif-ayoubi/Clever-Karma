import 'package:equatable/equatable.dart';

class User with EquatableMixin {
  final int? id;

  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final String role;
  final String? fcmToken;

  User(
      {this.id,
      this.firstName,
      required this.role,
      this.lastName,
      required this.email,
      required this.password,
      this.fcmToken});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? '',
      email: json['email'],
      password: json['password'] ?? '',
      role: json['role'],
      fcmToken: json['fcmToken'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
    'email': email,
    'password':password,
    'role':role,

  };
  @override
  List<Object?> get props =>
      [id, firstName, lastName, email, password, role, fcmToken];
}
