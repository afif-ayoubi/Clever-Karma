import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/opportunity/domain/entities/opportunity.dart';
import 'package:mobile/features/opportunity/presentation/widgets/home_page/parallax_image_card.dart';

import 'background_card.dart';
import 'shimmer_arrows.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({
    required this.percent,
    required this.opportunity,
    required this.expand,
    required this.onSwipeUp,
    required this.onSwipeDown,
    required this.onTap,
    super.key,
  });

  final double percent;
  final Opportunity opportunity;
  final VoidCallback onSwipeUp;
  final VoidCallback onSwipeDown;
  final VoidCallback onTap;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      tween: Tween(begin: 0, end: expand ? 1 : 0),
      builder: (_, value, __) => Stack(
        fit: StackFit.expand,
        children: [

          Transform.scale(
            scale: lerpDouble(.85, 1.2, value),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 180),
              child:
                  BackgroundCard(opportunity: opportunity, translation: value),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 170,top: 40).r,
            child: Transform(
              transform: Matrix4.translationValues(0, -90 * value, 0),
              child: GestureDetector(
                onTap: onTap,
                onVerticalDragUpdate: (details) {
                  if (details.primaryDelta! < -10) onSwipeUp();
                  if (details.primaryDelta! > 10) onSwipeDown();
                },
                child: Hero(
                  tag: opportunity.id,
                  flightShuttleBuilder: (_, animation, __, ___, ____) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) => Material(
                        type: MaterialType.transparency,
                        child: Container()
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      ParallaxImageCard(
                        imageUrl: opportunity.imageUrl,
                        parallaxValue: percent,
                      ),
                      VerticalOpportunityTitle(opportunity: opportunity),
                      const AnimatedUpwardArrows()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedUpwardArrows extends StatelessWidget {
  const AnimatedUpwardArrows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const ShimmerArrows(),
          Gap(24.h),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 4.h,
            width: 120.w,
            decoration:  BoxDecoration(
              color: HexColor.whiteColor,
              borderRadius: BorderRadius.all(const Radius.circular(8).w),
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalOpportunityTitle extends StatelessWidget {
  const VerticalOpportunityTitle({
    required this.opportunity,
    super.key,
  });

  final Opportunity opportunity;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RotatedBox(
        quarterTurns: -1,
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 40.h, right: 20.h, top: 12.w),
            child: Text(
              opportunity.name,
              maxLines: 1,
              style: context.displayLarge!.copyWith(color: HexColor.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
