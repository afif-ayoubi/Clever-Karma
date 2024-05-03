import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/opportunity/domain/entities/opportunity.dart';

class BackgroundCard extends StatelessWidget {

  const BackgroundCard({super.key, required this.translation, required this.opportunity});
  final double translation;
  final Opportunity opportunity;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0, 80 * translation, 0),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: HexColor.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(-7, 7),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

          ],
        ),
      ),
    );
  }
}

