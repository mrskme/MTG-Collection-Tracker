import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/widgets/autocomplete_search.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CardSearcherPage extends GetView<CardSearcherController> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Obx(
      () => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppWidgets.staticAppBar("Card searcher™", context),
          body: Container(
            decoration: BoxDecoration(gradient: AppWidgets.backgreoundGradient),
            padding: EdgeInsets.only(top: screenSize.height * 0.075),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.15),
                  child: controller.apiController.isLoadingCardNames
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : AutoCompleteInput(
                          onSelected: controller.onSelectedOption,
                          options: controller.apiController.cardNames),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
