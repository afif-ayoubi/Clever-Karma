import 'package:mobile/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.password,
      required super.dateOfBirth,
      required super.phoneNumber,
      required super.gender,
      required super.longitude,
      required super.latitude});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
        dateOfBirth: json['dateOfBirth'],
        phoneNumber: json['phoneNumber'],
        gender: json['gender'],
        longitude: json['longitude'],
        latitude: json['latitude']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'longitude': longitude,
      'latitude': latitude
    };
  }
}
