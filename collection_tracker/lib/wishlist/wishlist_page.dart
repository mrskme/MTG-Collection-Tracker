import 'package:collection_tracker/services/api_service.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

import 'wishlist_controller.dart';

var apiController = Get.find<ApiService>();

class WishlistPage extends GetView<WishlistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Wishlist")),
      ),
    );
  }
}
