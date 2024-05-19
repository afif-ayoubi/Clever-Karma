import 'package:mobile/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    super.id,
    super.firstName,
    super.lastName,
    required super.email,
    required super.password,
    super.fcmToken,
    super.dateOfBirth,
    super.phoneNumber,
    super.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        firstName: json['firstName'] ?? "",
        lastName: json['lastName'] ?? '',
        email: json['email'] ?? '',
        password: json['password'] ?? '',
        dateOfBirth: json['dateOfBirth'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        gender: json['gender'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'notifications': {
          'fcm_token': fcmToken ?? "",
        },
      };

  Map<String, dynamic> toJson1() => {
        'email': email,
        'password': password,
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
