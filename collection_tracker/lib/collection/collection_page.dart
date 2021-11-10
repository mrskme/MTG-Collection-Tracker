import 'package:collection_tracker/services/api_service.dart';
import 'package:collection_tracker/theme/text_theme.dart';
import 'package:collection_tracker/theme/theme_constants.dart';

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
      appBar: AppWidgets.staticAppBar("Collection", context),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppWidgets.backgreoundGradient,
        ),
        child: ListView.builder(
          itemCount: controller.ownedCards.length,
          itemBuilder: (context, i) {
            return Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment(0, -0.5),
                    fit: BoxFit.cover,
                    image: NetworkImage(controller.ownedCards[i].imageUrl!),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(100), blurRadius: 4.0),
                  ]),
              child: ListTile(
                title: Text(controller.ownedCards[i].name!,
                    style:
                        AppTextTheme.bodyText1.copyWith(color: Colors.white)),
                trailing: controller.ownedCards[i].addManaSymbolsToString(
                    20, controller.ownedCards[i].manaCost, true, false),
              ),
            );
          },
        ),
      ),
    );
  }
}
