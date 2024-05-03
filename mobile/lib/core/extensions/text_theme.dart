import 'package:flutter/material.dart';

extension BodyLarge on BuildContext {
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
}

extension BodyMedium on BuildContext {
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
}

extension DisplayLarge on BuildContext {
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
}

extension DisplayMedium on BuildContext {
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
}
