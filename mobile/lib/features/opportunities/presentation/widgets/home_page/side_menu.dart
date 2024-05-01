import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/opportunities/core/rive_utils.dart';
import 'package:mobile/features/opportunities/domain/entities/rive_asset.dart';
import 'package:mobile/features/opportunities/presentation/widgets/home_page/side_menu_title.dart';
import 'package:rive/rive.dart';

import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    RiveAsset selectedMenu = sideMenus.first;

    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
          width: 288.w,
          height: double.infinity,
          color: HexColor.primaryColor,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoCard(),
                Gap(50.h),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, top: 24, bottom: 16).r,
                  child: Text(
                    "Browse".toUpperCase(),
                    style: theme.displayMedium!
                        .copyWith(color: HexColor.textInputColor),
                  ),
                ),
                ...sideMenus.map((menu) => SideMenuTitle(
                      menu: menu,
                      press: () async {
                        menu.input!.change(true);
                        Future.delayed(const Duration(milliseconds: 1), () {
                          menu.input!.change(false);
                        });
                        setState(() {
                          selectedMenu = menu;
                        });
                        switch (menu.number) {
                          case 1:
                            break;
                          case 2:
                            break;
                          case 3:
                            break;
                        }
                      },
                      riveonInit: (artboard) {
                        StateMachineController controller =
                            RiveUtils.getRiveController(artboard,
                                stateMachineName: menu.stateMacineName);
                        menu.input = controller.findSMI("active") as SMIBool;
                      },
                      isActive: selectedMenu == menu,
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, top: 40, bottom: 16).r,
                  child: Text("History".toUpperCase(),
                      style: theme.displayMedium!.copyWith(
                        color: HexColor.textInputColor,
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
