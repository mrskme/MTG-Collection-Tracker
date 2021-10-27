import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/models/card.dart';
import 'package:collection_tracker/routes/app_routes.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

var apiController = Get.find<ApiService>();

class CardSearcherPage extends GetView<CardSearcherController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Registered screen tap");
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AutoCompleteInput(),
            ),
          ),
        ),
      ),
    );
  }
}

class AutoCompleteInput extends GetView<CardSearcherController> {
  var _options = apiController.cardNames;

  static String _displayStringForOption(String option) => option;
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _options.where((String option) {
          return option
              .toString()
              .toLowerCase()
              .startsWith(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) async {
        var cardJsonMap = await apiController.getOneByName(selection);
        controller.chosenCard = PlayingCard(cardJsonMap);
        Get.toNamed(Routes.ShowCard);
      },
    );
  }
}
