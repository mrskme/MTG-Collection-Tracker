import 'package:collection_tracker/services/api_service.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'profile_controller.dart';

var apiController = Get.find<ApiService>();

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.staticAppBar("Profile", context),
      body: Container(
        decoration: BoxDecoration(gradient: AppWidgets.backgreoundGradient),
        child: Center(child: Text("Profile")),
      ),
    );
  }
}
