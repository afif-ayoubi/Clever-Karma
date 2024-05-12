import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final DateTime? dateOfBirth;
  final String? gender;
  final int? phoneNumber;


  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
       this.dateOfBirth,
       this.phoneNumber,
       this.gender,
      });

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

      ];
}
