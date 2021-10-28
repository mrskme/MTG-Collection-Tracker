import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static buildAppTheme() {
    final ThemeData darkTheme = ThemeData(
      fontFamily: 'Berelen',
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Colors.black54,
      ),
      //   backgroundColor: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     stops: const [
      //       0.1,
      //       0.4,
      //       0.6,
      //       0.9,
      //     ],
      //     colors: [
      //       Colors.blue.shade50,
      //       Colors.blue.shade500,
      //     ],
      //   ),
    );
    return darkTheme;
  }
}
