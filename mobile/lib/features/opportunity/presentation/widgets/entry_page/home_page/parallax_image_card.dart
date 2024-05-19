import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ParallaxImageCard extends StatelessWidget {
  const ParallaxImageCard({
    super.key,
    required this.imageUrl,
    this.parallaxValue = 0,
  });

  final String imageUrl;
  final double parallaxValue;

  BoxDecoration get _parallaxUrlImageDecoration => BoxDecoration(
    borderRadius: BorderRadius.all(const Radius.circular(12).w),
    color: HexColor.lightColor,
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 12,
        offset: Offset(-7, 7),
      ),
    ],
    image: DecorationImage(
      image: CachedNetworkImageProvider(imageUrl),
      fit: BoxFit.cover,
    ),
  );

  BoxDecoration get _vignetteDecoration => BoxDecoration(
    borderRadius: BorderRadius.all(const Radius.circular(12).w),
    gradient: const RadialGradient(
      radius: 2,
      colors: [Colors.transparent, Colors.black],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(decoration: _parallaxUrlImageDecoration),
        DecoratedBox(decoration: _vignetteDecoration),
      ],
    );
  }
}
