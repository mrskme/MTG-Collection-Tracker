import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/models/card.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'show_card_controller.dart';

var apiController = Get.find<ApiService>();

class ShowCardPage extends GetView<ShowCardController> {
  var cardSearcherController = Get.find<CardSearcherController>();
  @override
  Widget build(BuildContext context) {
    var card = cardSearcherController.chosenCard!;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text("Back"),
              ),
              Text(card.name!),
              if (card.imageUrl != null) Image.network(card.imageUrl),
            ],
          ),
        ),
      ),
    );
  }
}
