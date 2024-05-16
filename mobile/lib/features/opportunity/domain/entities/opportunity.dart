import 'package:mobile/core/constants/assets_manager.dart';

class Opportunity {
  final int id;
  final String name;
  final String imageUrl;
  final String description;

  const Opportunity(
      {required this.id, required this.name, required this.imageUrl, required this.description});

  static List<Opportunity> fakeData = [
    const Opportunity(
        id: 1, name: 'blood Donation', imageUrl: AppImages.imgImg1, description: ''),
    const Opportunity(
        id: 2, name: 'blood Section', imageUrl: AppImages.onBoardingImg3, description: ''),
    const Opportunity(
        id: 3, name: 'blood Room', imageUrl: AppImages.onBoardingImg1, description: ''),
  ];
}
