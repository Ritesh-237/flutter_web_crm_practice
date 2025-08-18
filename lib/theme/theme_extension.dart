import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get themeRef => Theme.of(this);
}
