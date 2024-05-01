import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/hex_color.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
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
        ),

      ),
      subtitle: Text(
        'Potential Volunteer',
        style: TextStyle(
          color: HexColor.whiteColor,
        ),
      ),
    );
  }
}
