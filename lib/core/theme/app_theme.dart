import 'package:flutter/material.dart';
import 'package:shiv_super_app/core/theme/pallete.dart';

class AppTheme {
  static var lightModeAppTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Pallete.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Pallete.blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Pallete.whiteColor,
    ),
    primaryColor: Pallete.blackColor,
  );
}
