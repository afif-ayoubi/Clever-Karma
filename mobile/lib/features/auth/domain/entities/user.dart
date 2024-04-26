import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final DateTime dateOfBirth;
  final String gender;
  final int phoneNumber;
  final double longitude;
  final double latitude;

  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.dateOfBirth,
      required this.phoneNumber,
      required this.gender,
      required this.longitude,
      required this.latitude});

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        password,
        dateOfBirth,
        phoneNumber,
        gender,
        longitude,
        latitude
      ];
}
