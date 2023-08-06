import 'package:flutter/material.dart';
import 'package:build_manager/ui/theme/app_colors.dart';

abstract class AppColorTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: AppColors.text,
        fontSize: 20,
        height: 30 / 20,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        fontSize: 17,
        color: AppColors.text,
        height: 20 / 17,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        height: 20 / 14,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    
  );
}
