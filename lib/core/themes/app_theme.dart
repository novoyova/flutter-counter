import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_counter/core/constants/app_colors.dart';

class AppTheme {
  const AppTheme._();

  //* If we use ColorScheme, we need to use ThemeData.from for it to take effect
  static final lightTheme = ThemeData.from(
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimaryColor,
      secondary: AppColors.lightAccentColor,
      background: AppColors.lightBackgroundColor,
    ),
  );

  static final darkTheme = ThemeData.from(
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimaryColor,
      secondary: AppColors.darkAccentColor,
      background: AppColors.darkBackgroundColor,
    ),
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // Status bar
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,

        // Navigation bar
        systemNavigationBarColor: themeMode == ThemeMode.light
            ? AppColors.lightBackgroundColor
            : AppColors.darkBackgroundColor,
        systemNavigationBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }
}
