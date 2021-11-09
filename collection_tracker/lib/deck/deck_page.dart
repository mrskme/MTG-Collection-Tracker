import 'package:collection_tracker/deck/deck_controller.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeckPage extends GetView<DeckController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.staticAppBar("Decks", context),
      body: Container(
        decoration: BoxDecoration(gradient: AppWidgets.backgreoundGradient),
        child: Center(child: Text("Decks")),
      ),
    );
  }
}
