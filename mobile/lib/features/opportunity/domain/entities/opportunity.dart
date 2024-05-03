import 'package:mobile/core/constants/assets_manager.dart';

class Opportunity {
  final int id;
  final String name;
  final String imageUrl;

  const Opportunity(
      {required this.id, required this.name, required this.imageUrl});

  static List<Opportunity> fakeData = [
    const Opportunity(
        id: 1, name: 'blood1', imageUrl: AppImages.onBoardingImg1),
    const Opportunity(
        id: 2, name: 'blood12', imageUrl: AppImages.onBoardingImg1),
    const Opportunity(
        id: 3, name: 'blood13', imageUrl: AppImages.onBoardingImg1),
  ];
}
