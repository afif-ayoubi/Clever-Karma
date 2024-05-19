import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../../core/wdigets/loading_widget.dart';

class ParallaxImageCard extends StatelessWidget {
  const ParallaxImageCard({
    super.key,
    required this.imageUrl,
    this.parallaxValue = 0,
  });

  final String imageUrl;
  final double parallaxValue;

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
        ClipRRect(
          borderRadius: BorderRadius.all(const Radius.circular(12).w),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                color: HexColor.lightColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(-7, 7),
                  ),
                ],
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                color: HexColor.lightColor,
                borderRadius: BorderRadius.all(const Radius.circular(12).w),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(-7, 7),
                  ),
                ],
              ),
              child: const Center(
                child: LoadingWidget(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                color: HexColor.lightColor,
                borderRadius: BorderRadius.all(const Radius.circular(12).w),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(-7, 7),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.error, color: Colors.red),
              ),
            ),
          ),
        ),
        DecoratedBox(decoration: _vignetteDecoration),
      ],
    );
  }
}
