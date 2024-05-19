import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../../routes/class_routes.dart';
import '../../../../domain/entities/opportunity.dart';
import 'opportunity_card.dart';

class OpportunityView extends StatelessWidget {
  const OpportunityView({
    super.key,
    required this.pageNotifier,
    required this.roomSelectorNotifier,
    required this.controller,
    required this.opportunities,
  });

  final ValueNotifier<double> pageNotifier;
  final ValueNotifier<int> roomSelectorNotifier;
  final PageController controller;
  final List<Opportunity> opportunities;

  double _getOffsetX(double percent) => percent.isNegative ? 30.0.r : -30.0.r;

  Matrix4 _getOutTranslate(double percent, int selected, int index) {
    final x = selected != index && selected != -1 ? _getOffsetX(percent) : 0.0;
    return Matrix4.translationValues(x, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: pageNotifier,
      builder: (_, page, __) => ValueListenableBuilder<int>(
        valueListenable: roomSelectorNotifier,
        builder: (_, selected, __) => PageView.builder(
          clipBehavior: Clip.none,
          itemCount: opportunities.length,
          controller: controller,
          itemBuilder: (_, index) {
            final percent = page - index;
            final isSelected = selected == index;
            final opportunity = opportunities[index];
            return AnimatedContainer(
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              transform: _getOutTranslate(percent, selected, index),
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: OpportunityCard(
                percent: percent,
                expand: isSelected,
                opportunity: opportunity,
                onSwipeUp: () => roomSelectorNotifier.value = index,
                onSwipeDown: () => roomSelectorNotifier.value = -1,
                onTap: () async {
                  context.push(Routes.organizationsPage);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
