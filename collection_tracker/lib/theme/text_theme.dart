import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static final headline1 = TextStyle(fontSize: 34, color: AppColors.darkGrey);
  static final headline2 = TextStyle(fontSize: 21, color: AppColors.darkGrey);
  static final headline3 = TextStyle();

  static final bodyText2 = TextStyle(fontSize: 17, color: AppColors.darkGrey);

  static final TextTheme appTextTheme = TextTheme(
    headline1: AppTextTheme.headline1,
    headline2: AppTextTheme.headline2,
    headline3: AppTextTheme.headline3,
    bodyText2: AppTextTheme.bodyText2,
  );
}
