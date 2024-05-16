import 'package:flutter/material.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/core/common_domain/entities/rive_asset.dart';
import 'package:rive/rive.dart';

import '../../../../core/util/rive_utils.dart';
import '../widgets/org_entry_page/animated_bar.dart';
import 'graph_page.dart';
import 'org_profile_page.dart';

class OrgEntryPage extends StatefulWidget {
  const OrgEntryPage({Key? key}) : super(key: key);

  @override
  State<OrgEntryPage> createState() => _OrgEntryPageState();
}

class _OrgEntryPageState extends State<OrgEntryPage>
    with SingleTickerProviderStateMixin {
  RiveAsset selectedBottomNav = bottomNavs.first;

  late Animation<double> animation;
  late AnimationController _animationController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<Widget> pages = [
    GraphPage(),
    OrganizationProfilePage(),
    OrganizationProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[pageIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: Material(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              color: HexColor.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                bottomNavs.length,
                    (index) => GestureDetector(
                  onTap: () {
                    bottomNavs[index].input!.change(true);
                    if (bottomNavs[index] != selectedBottomNav) {
                      setState(() {
                        selectedBottomNav = bottomNavs[index];
                      });
                    }
                    Future.delayed(const Duration(seconds: 1), () {
                      bottomNavs[index].input!.change(false);
                    });
                    setState(() {
                      pageIndex = bottomNavs[index].number ?? 0;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedBar(
                        isActive: bottomNavs[index] == selectedBottomNav,
                      ),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Opacity(
                          opacity: bottomNavs[index] == selectedBottomNav
                              ? 1
                              : 0.5,
                          child: RiveAnimation.asset(
                            bottomNavs[index].src,
                            artboard: bottomNavs[index].artboard,
                            onInit: (artboard) {
                              StateMachineController controller =
                              RiveUtils.getRiveController(
                                artboard,
                                stateMachineName:
                                bottomNavs[index].stateMacineName,
                              );
                              bottomNavs[index].input =
                              controller.findSMI("active") as SMIBool;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
List<RiveAsset> bottomNavs = [
  RiveAsset(
      artboard: "HOME",
      stateMacineName: "HOME_interactivity",
      title: "Home",
      src: 'assets/RiveAssets/icons.riv',
      number: 0),
  // RiveAsset(
  //     artboard: "SEARCH",
  //     stateMacineName: "SEARCH_Interactivity",
  //     title: "Search",
  //     src: 'assets/RiveAssets/icons.riv',
  //     number: 1),
  RiveAsset(
      artboard: "TIMER",
      stateMacineName: "TIMER_Interactivity",
      title: "Timer",
      src: 'assets/RiveAssets/icons.riv',
      number: 1),
  RiveAsset(
      artboard: "USER",
      stateMacineName: "USER_Interactivity",
      title: "Profile",
      src: 'assets/RiveAssets/icons.riv',
      number: 2),
];