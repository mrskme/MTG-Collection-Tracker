import 'package:collection_tracker/services/api_service.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

import 'collection_controller.dart';

var apiController = Get.find<ApiService>();

class CollectionPage extends GetView<CollectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Collection")),
      ),
    );
  }
}
