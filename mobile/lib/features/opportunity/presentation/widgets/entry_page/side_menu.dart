import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/opportunity/core/rive_utils.dart';
import 'package:mobile/features/opportunity/domain/entities/rive_asset.dart';
import 'package:mobile/features/opportunity/presentation/widgets/entry_page/side_menu_title.dart';
import 'package:rive/rive.dart';

import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = RiveAsset.sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 288.w,
          height: double.infinity,
          color: HexColor.backgroundColor,
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
                    style: context.displayMedium!
                        .copyWith(color: HexColor.textInputColor),
                  ),
                ),
                ...RiveAsset.sideMenus.map((menu) => SideMenuTitle(
                      menu: menu,
                      press: () async {
                        menu.input!.change(true);
                        Future.delayed(const Duration(milliseconds: 2), () {
                          menu.input!.change(false);
                        });
                        setState(() {
                          selectedMenu = menu;
                        });
                        switch (menu.number) {
                          case 1:
                            print(selectedMenu == menu);
                            break;
                          case 2:
                            print(selectedMenu == menu);
                            break;
                          case 3:
                            print(selectedMenu == menu);
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
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: ListTile(
                        onTap: () {},
                        leading: SizedBox(
                          height: 34.h,
                          width: 34.w,
                          child: const Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text(
                          'Sign Out',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
