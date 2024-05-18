import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';


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
  final String role;


  User({
    this.id,
    this.firstName,
    required this.role,
    this.lastName,
    required this.email,
    required this.password,

  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        password,
    role,

      ];
}
