import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Organization extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final String aboutUs;
  @HiveField(6)
  final String howToVolunteer;
  @HiveField(7)
  final String image;
  @HiveField(8)
  final String liveStreamingId;
  @HiveField(9)
  final bool LiveStreamingIsActivated;
  @HiveField(10)


  Organization({
    this.id,
    required this.firstName,
    required this.lastName,
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
      ];
}
