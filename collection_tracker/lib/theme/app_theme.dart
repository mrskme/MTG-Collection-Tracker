import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData buildAppTheme() {
    final ThemeData theme = ThemeData(
      fontFamily: 'Berelen',
      primaryColor: AppColors.primaryColor,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.darkGreyBlue,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkGrey,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.mediumBlueGrey,
        selectedItemColor: AppColors.darkGrey,
        unselectedItemColor: Colors.grey.shade200,
      ),
    );
    return theme;
  }
}
