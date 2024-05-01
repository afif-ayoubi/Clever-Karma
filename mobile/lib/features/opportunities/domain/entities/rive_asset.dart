import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMacineName, title, src;
  late SMIBool? input;
  final int? number;

  RiveAsset(
      {required this.artboard,
        this.number,
        required this.stateMacineName,
        required this.title,
        required this.src});

  set setInput(SMIBool status) {
    input = status;
  }

}
List<RiveAsset> sideMenus = [
  RiveAsset(
      artboard: "HOME",
      stateMacineName: "HOME_interactivity",
      title: "Home",
      src: 'assets/RiveAssets/icons.riv'),
  RiveAsset(
      artboard: "SEARCH",
      stateMacineName: "SEARCH_Interactivity",
      title: "Search",
      src: 'assets/RiveAssets/icons.riv',
      number: 4),
  RiveAsset(
      artboard: "LIKE/STAR",
      stateMacineName: "STAR_Interactivity",
      title: "Favorites",
      src: 'assets/RiveAssets/icons.riv',
      number: 1),

  RiveAsset(
      artboard: "BELL",
      stateMacineName: "BELL_Interactivity",
      title: "BMI",
      src: 'assets/RiveAssets/icons.riv',number: 2),
  RiveAsset(
      artboard: "CHAT",
      stateMacineName: "CHAT_Interactivity",
      title: "Help",
      src: 'assets/RiveAssets/icons.riv',number: 3),
];
