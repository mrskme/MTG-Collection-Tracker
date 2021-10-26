import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/models/card.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

var apiController = Get.find<ApiService>();

class CardSearcherPage extends GetView<CardSearcherController> {
  CardSearcherPage() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AutoCompleteInput(),
      ),
    );
  }
}

class AutoCompleteInput extends GetView<CardSearcherController> {
  var _options = apiController.cardNames;

  static String _displayStringForOption(String option) => option;
  @override
  Widget build(BuildContext context) {
    print(apiController.cardNames.length);
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
        var cardMap = await apiController.getOneByName(selection);
        var aCard = PlayingCard(cardMap);
        print(aCard);
      },
    );
  }
}
