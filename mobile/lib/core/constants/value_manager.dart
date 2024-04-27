import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class LayoutConstrains {
  LayoutConstrains._();

  static const s1 = 2.0;
  static const s2 = 4.0;
  static const s3 = 8.0;
  static const m1 = 12.0;
  static const m2 = 16.0;
  static const m3 = 20.0;
  static const m4 = 24.0;
  static const l1 = 30.0;
  static const l2 = 40.0;
  static const l3 = 48.0;
  static const xl1 = 64.0;
  static const xl2 = 72.0;
  static const xl3 = 80.0;
  static const xxl1 = 96.0;
  static const xxl2 = 128;
  static const xxl3 = 160;
}

abstract class Space {
  Space._();

  static const vS1 = RSizedBox.vertical(LayoutConstrains.s1);
  static const vS2 = RSizedBox.vertical(LayoutConstrains.s2);
  static const vS3 = RSizedBox.vertical(LayoutConstrains.s3);
  static const vM1 = RSizedBox.vertical(LayoutConstrains.m1);
  static const vM2 = RSizedBox.vertical(LayoutConstrains.m2);
  static const vM3 = RSizedBox.vertical(LayoutConstrains.m3);
  static const vM4 = RSizedBox.vertical(LayoutConstrains.m4);
  static const vL1 = RSizedBox.vertical(LayoutConstrains.l1);
  static const vL2 = RSizedBox.vertical(LayoutConstrains.l2);
  static const vL3 = RSizedBox.vertical(LayoutConstrains.l3);
  static const vXL1 = RSizedBox.vertical(LayoutConstrains.xl1);
  static const vXL2 = RSizedBox.vertical(LayoutConstrains.xl2);
  static const vXL3 = RSizedBox.vertical(LayoutConstrains.xl3);

  ///////////////////////////////////////////////////////////
  static const hS1 = RSizedBox.horizontal(LayoutConstrains.s1);
  static const hS2 = RSizedBox.horizontal(LayoutConstrains.s2);
  static const hS3 = RSizedBox.horizontal(LayoutConstrains.s3);
  static const hM1 = RSizedBox.horizontal(LayoutConstrains.m1);
  static const hM2 = RSizedBox.horizontal(LayoutConstrains.m2);
  static const hM3 = RSizedBox.horizontal(LayoutConstrains.m3);
  static const hM4 = RSizedBox.horizontal(LayoutConstrains.m4);
  static const hL1 = RSizedBox.horizontal(LayoutConstrains.l1);
  static const hL2 = RSizedBox.horizontal(LayoutConstrains.l2);
  static const hL3 = RSizedBox.horizontal(LayoutConstrains.l3);
  static const hXL1 = RSizedBox.horizontal(LayoutConstrains.xl1);
  static const hXL2 = RSizedBox.horizontal(LayoutConstrains.xl2);
  static const hXL3 = RSizedBox.horizontal(LayoutConstrains.xl3);
}

abstract class PRadius {
  PRadius._();

  static const button = 24.0;
  static const container = 12.0;
  static const texFiled = 12.0;
  static const chip = 12.0;
  static const checkBox = 6.0;
  static const card = 8.0;
  static const circular = 24.0;
}

abstract class PEdgeInsets {
  PEdgeInsets._();

  static final allSmall = REdgeInsets.all(LayoutConstrains.m2);
  static final all = REdgeInsets.all(LayoutConstrains.l1);
  static final allBig = REdgeInsets.all(LayoutConstrains.m4);
  static final horizontal =
      REdgeInsets.symmetric(horizontal: LayoutConstrains.m3);

  static final vertical = REdgeInsets.symmetric(vertical: LayoutConstrains.m3.h,horizontal: 0);
  static final dVertical = REdgeInsets.symmetric(vertical: LayoutConstrains.xxl1,horizontal: 0);
  static final dHorizontal =
      REdgeInsets.symmetric(horizontal: LayoutConstrains.l1);
}
