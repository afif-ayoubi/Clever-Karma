import 'package:mobile/core/constants/assets_manager.dart';

class Opportunity {
  final int id;
  final String name;
  final String imageUrl;

  const Opportunity(
      {required this.id, required this.name, required this.imageUrl});

  static List<Opportunity> fakeData = [
    const Opportunity(
        id: 1, name: 'blood Donation', imageUrl: AppImages.onBoardingImg1),
    const Opportunity(
        id: 2, name: 'blood Section', imageUrl: AppImages.onBoardingImg1),
    const Opportunity(
        id: 3, name: 'blood Room', imageUrl: AppImages.onBoardingImg1),
  ];
}
