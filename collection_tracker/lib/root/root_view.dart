import 'package:collection_tracker/routes/app_routes.dart';
import "package:get/get.dart";
import 'package:flutter/material.dart';
import 'root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return Scaffold(
          drawer: null,
          appBar: null,
          body: GetRouterOutlet(
            initialRoute: Routes.Home,
            // anchorRoute: '/',
            filterPages: (afterAnchor) {
              return afterAnchor.take(1);
            },
          ),
        );
      },
    );
  }
}
