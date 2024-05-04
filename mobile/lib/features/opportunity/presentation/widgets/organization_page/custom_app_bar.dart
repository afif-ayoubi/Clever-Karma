import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/icons_manager.dart';
import 'package:mobile/core/theme/hex_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.isLast = false});

  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: HexColor.whiteColor,
        ),
        child: const Icon(
          IconManager.arrowBack,
        ),
      ),
    );
  }
}
