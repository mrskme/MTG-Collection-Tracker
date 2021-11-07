import 'package:collection_tracker/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSizes {
  static const double marginMicro = 0.01;
  static const double marginSmall = 0.02;
  static const double marginDefault = 0.04;
  static const double marginDefaultPlus = 0.06;
  static const double margingMedium = 0.08;
  static const double marginBig = 0.16;
}

class AppColors {
  static Color primaryColor = Colors.grey.shade800;
  static Color darkGreyBlue = Colors.blueGrey.shade600;
  static Color mediumBlueGrey = Colors.blueGrey.shade400;
  static Color lightBlueGrey = Colors.blueGrey.shade100;
  static Color darkGrey = Colors.grey.shade900;
}

class AppWidgets {
  static LinearGradient backgreoundGradient =
      LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
          // colors: [
          //   Colors.grey.shade500,
          //   Colors.grey.shade800,
          // ],
          colors: [
        AppColors.lightBlueGrey,
        AppColors.mediumBlueGrey,
      ]);

  static AppBar staticAppBar(String text, BuildContext context) {
    return AppBar(
      title: Text(text,
          style: AppTextTheme.headline2.copyWith(color: Colors.white)),
      centerTitle: true,
    );
  }
}
