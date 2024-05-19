import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject with EquatableMixin {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String email;
  @HiveField(4)
  String password;
  @HiveField(5)
  String? dateOfBirth;
  @HiveField(6)
  String? fcmToken;
  @HiveField(7)
  String? gender;
  @HiveField(8)
  String? phoneNumber;
  @HiveField(9)
  String? profileImage;

  User(
      {this.id,
      this.profileImage,
      this.firstName,
      this.lastName,
      required this.email,
      required this.password,
      this.dateOfBirth,
      this.phoneNumber,
      this.gender,
      this.fcmToken});

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        profileImage,
        password,
        dateOfBirth,
        phoneNumber,
        gender,
      ];
}
