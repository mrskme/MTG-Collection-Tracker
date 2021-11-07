import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static final headline1 = TextStyle(
    fontSize: 26,
    color: AppColors.darkGrey,
    fontFamily: "Berelen",
  );
  static final headline2 = TextStyle(
    fontSize: 20,
    color: AppColors.darkGrey,
    fontFamily: "Berelen",
  );
  static final headline3 = TextStyle(
      fontSize: 20, color: AppColors.darkGrey, fontWeight: FontWeight.w700);

  static final bodyText1 = TextStyle(
    fontSize: 16,
    color: AppColors.darkGrey,
    fontFamily: "Berelen",
  );
  static final bodyText2 = TextStyle(
    fontSize: 17,
    color: AppColors.darkGrey,
  );

  static final TextTheme appTextTheme = TextTheme(
    headline1: AppTextTheme.headline1,
    headline2: AppTextTheme.headline2,
    headline3: AppTextTheme.headline3,
    bodyText2: AppTextTheme.bodyText2,
  );
}
