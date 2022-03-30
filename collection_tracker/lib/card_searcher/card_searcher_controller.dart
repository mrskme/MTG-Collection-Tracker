import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/routes/app_routes.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSearcherController extends GetxController {
  ApiService get apiController => Get.find<ApiService>();

  void onSelectedOption(String selectedOption) async {
    try {
      var cardJsonMap = await apiController.getOneByName(selectedOption);
      var card = PlayingCard(cardJsonMap);
      Get.toNamed(Routes.ShowCard, arguments: card);
    } catch (e) {
      print(e);
      Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 18),
        titleStyle: TextStyle(color: Colors.red),
        title: "Error",
        content: Text("Found no cards with that name"),
      );
    }
  }
}
