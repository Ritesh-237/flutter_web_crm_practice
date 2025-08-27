import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get themeRef => Theme.of(this);
}

extension MediaqueryExtension on BuildContext {
  Size get media {
    return MediaQuery.of(this).size;
  }
}
