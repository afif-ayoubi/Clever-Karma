import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/opportunity/core/utils/rive_utils.dart';
import 'package:rive/rive.dart';

import '../widgets/entry_page/side_menu/menu_btn.dart';
import 'side_menu.dart';
import 'home_page.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage>
    with SingleTickerProviderStateMixin {
  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;
  int pageIndex = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isSideMenuClosed ? HexColor.primaryColor : HexColor.backgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? -288.r : 0,
            width: 288.w,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu()),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(animation.value - 30 * animation.value * pi / 180),
          child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: ClipRRect(
                      borderRadius: isSideMenuClosed
                          ? BorderRadius.all(const Radius.circular(0).w)
                          : BorderRadius.all(const Radius.circular(24).w),
                      child: const HomePage()))),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          top: 16.h,
          left: isSideMenuClosed ? 0 : 220.w,
          child: MenuBtn(
            riveOnInit: (artboard) {
              StateMachineController controller = RiveUtils.getRiveController(
                  artboard,
                  stateMachineName: "State Machine");
              isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
              isSideBarClosed.value = true;
            },
            press: () {
              isSideBarClosed.value = !isSideBarClosed.value;
              if (isSideMenuClosed) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              setState(() {
                isSideMenuClosed = isSideBarClosed.value;
              });
            },
          ),
        )
      ],
    );
  }
}
