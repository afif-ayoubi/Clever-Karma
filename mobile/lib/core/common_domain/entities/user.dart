import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../features/auth/domain/entities/volunteer.dart';
@HiveType(typeId: 1)
class Volunteer extends HiveObject with EquatableMixin {
  @HiveField(0)
  final User user;
  @HiveField(1)
  final DateTime? dateOfBirth;
  @HiveField(2)
  final String? fcmToken;
  @HiveField(3)
  final String? gender;
  @HiveField(4)
  final int? phoneNumber;

  Volunteer({
    required this.user,
    this.dateOfBirth,
    this.phoneNumber,
    this.fcmToken,
    this.gender,
  });

  List<Object?> get props => [user, dateOfBirth, phoneNumber, fcmToken, gender];
}
