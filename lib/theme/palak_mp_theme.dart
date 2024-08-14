import 'package:flutter/material.dart';

import 'color_schemes1.dart';

class PalakMpTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: darkColorScheme,
      useMaterial3: true,
      fontFamily: 'OpenSans',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: lightColorScheme,
      useMaterial3: true,
      fontFamily: 'OpenSans',
      appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: lightColorScheme.primary),
        elevation: 0,
        color: Colors.white,
      ),
    );
  }
}
