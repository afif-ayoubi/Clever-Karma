import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/opportunities/domain/entities/rive_asset.dart';
import 'package:rive/rive.dart';

class SideMenuTitle extends StatelessWidget {
  const SideMenuTitle(
      {super.key,
        required this.menu,
        required this.press,
        required this.riveonInit,
        required this.isActive});
  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding:const  EdgeInsets.only(left: 24).r,
          child: const Divider(
            color: Colors.white30,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 300),
              height: 56.h,
              left: 0,
              width: isActive ? 288.w : 0,
              child: Container(
                decoration: const BoxDecoration(
                    color:HexColor.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34.h,
                width: 34.w,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveonInit,
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
