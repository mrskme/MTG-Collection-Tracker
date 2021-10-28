import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/routes/app_routes.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

var apiController = Get.find<ApiService>();

class CardSearcherPage extends GetView<CardSearcherController> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Obx(() => GestureDetector(
          onTap: () {
            print("Registered screen tap");
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text("Card searcher™"),
              ),
              backgroundColor: Colors.black54,
            ),
            body: Container(
              padding: EdgeInsets.only(top: screenSize.height * 0.10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.15),
                    child: apiController.isLoadingCardNames
                        ? Center(child: CircularProgressIndicator())
                        : AutoCompleteInput(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class AutoCompleteInput extends GetView<CardSearcherController> {
  var _options = apiController.cardNames;
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsMaxHeight: 250,
      displayStringForOption: (String option) => option,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return _options.where(
          (String option) {
            return option.toString().toLowerCase().startsWith(
                  textEditingValue.text.toLowerCase(),
                );
          },
        );
      },
      optionsViewBuilder: (context, Function(String) onSelected, options) {
        return Material(
          elevation: 5,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final selectedString = options.elementAt(index);
              return ListTile(
                title: Text(
                  selectedString.toString(),
                ),
                onTap: () async {
                  var cardJsonMap =
                      await apiController.getOneByName(selectedString);
                  controller.chosenCard = PlayingCard(cardJsonMap);
                  Get.toNamed(Routes.ShowCard);
                },
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            itemCount: options.length,
          ),
        );
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.orange,
              ),
            ),
            //hintText: "Type here",
            // prefixIcon: Icon(
            //   Icons.search,
            //   color: Colors.black,
            // ),
          ),
        );
      },
      onSelected: (String selectedString) async {
        var cardJsonMap = await apiController.getOneByName(selectedString);
        controller.chosenCard = PlayingCard(cardJsonMap);
        Get.toNamed(Routes.ShowCard);
      },
    );
  }
}
