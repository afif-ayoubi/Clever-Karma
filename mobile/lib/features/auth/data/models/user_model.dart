import 'package:mobile/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.password,
       super.dateOfBirth,
       super.phoneNumber,
       super.gender,});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      dateOfBirth: json['dateOfBirth'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
     );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
        'gender': gender,

      };

  UserModel.fromUser(User user)
      : super(
            id: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            password: user.password,
            dateOfBirth: user.dateOfBirth,
            phoneNumber: user.phoneNumber,
            gender: user.gender,
          );
}
