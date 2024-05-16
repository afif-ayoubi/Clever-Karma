import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/constants/font_manager.dart';

import '../../../../../../core/theme/hex_color.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: HexColor.whiteColor,
        ),
      ),
      title: Text(
        'Afif Ayoubi',
        style: TextStyle(
          color: HexColor.whiteColor,
          fontWeight: FontWeightManager.semiBold
        ),

      ),
      subtitle: Text(
        'Potential Volunteer',
        style: TextStyle(
          fontSize: FontSize.s14,
          color: HexColor.whiteColor,
        ),
      ),
    );
  }
}
