import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? firstName;
  @HiveField(2)
  final String? lastName;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final DateTime? dateOfBirth;
  @HiveField(6)
  final String? fcmToken;
  @HiveField(6)
  final String? gender;
  @HiveField(7)
  final int? phoneNumber;

  User({
    this.id,
    this.firstName,
    this.lastName,
    required this.email,
    required this.password,
    this.dateOfBirth,
    this.phoneNumber,
    this.gender,
    this.fcmToken
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
