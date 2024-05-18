import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../core/constants/assets_manager.dart';

@HiveType(typeId: 1)
class Opportunity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
    final String imageUrl;
  @HiveField(3)
  final String description;

   Opportunity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  static List<Opportunity> fakeData = [
     Opportunity(
        id: 1, name: 'blood Donation', imageUrl: AppImages.imgImg1, description: ''),
     Opportunity(
        id: 2, name: 'blood Section', imageUrl: AppImages.onBoardingImg3, description: ''),
     Opportunity(
        id: 3, name: 'blood Room', imageUrl: AppImages.onBoardingImg1, description: ''),
  ];

  @override
  List<Object?> get props => [id, name, imageUrl, description];
}
