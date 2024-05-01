import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/hex_color.dart';

import 'info_card.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
          width: 288.w,
          height: double.infinity,
          color: HexColor.primaryColor,
          child: const SafeArea(
            child: Column(
              children: [
                InfoCard(),
              ],
            ),
          )),
    );
  }
}

