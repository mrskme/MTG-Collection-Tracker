import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static const headline1 = TextStyle(fontSize: 34);
  static const headline2 = TextStyle(fontSize: 21);
  static const headline3 = TextStyle();

  static const TextTheme appTextTheme = TextTheme(
    headline1: AppTextTheme.headline1,
    headline2: AppTextTheme.headline2,
    headline3: AppTextTheme.headline3,

  );
}
