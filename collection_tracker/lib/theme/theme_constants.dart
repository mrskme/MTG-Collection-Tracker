import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSizes {
  static const double marginMicro = 4;
  static const double marginSmall = 8;
  static const double marginDefault = 16;
  static const double margingMedium = 24;
  static const double marginBig = 32;
}

class AppColors {
  static Color primaryColor = Colors.grey.shade800;
  // static Color secondaryColor = Colors.orange;
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
      title: Text(text),
      centerTitle: true,
      // leading: Navigator.canPop(context)
      //     ? IconButton(
      //         icon: Icon(
      //           Icons.arrow_back_rounded,
      //           color: Colors.white,
      //           size: 30,
      //         ),
      //         onPressed: () => Get.back(),
      //       )
      //     : null,
      //iconTheme: IconThemeData(size: 10, color: Colors.white),
    );
  }
}
