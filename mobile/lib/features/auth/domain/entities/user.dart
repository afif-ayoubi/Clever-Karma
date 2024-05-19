import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';
@HiveType(typeId: 0)
class User extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  late final String? firstName;
  @HiveField(2)
  late final String? lastName;
  @HiveField(3)
  late final String email;
  @HiveField(4)
  final String password;
  @HiveField(5)
  late final String? dateOfBirth;
  @HiveField(6)
  final String? fcmToken;
  @HiveField(7)
  late final String? gender;
  @HiveField(8)
  late final String? phoneNumber;

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
