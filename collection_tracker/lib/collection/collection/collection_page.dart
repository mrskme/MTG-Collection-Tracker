import 'package:collection_tracker/collection/collection/collection_controller.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:collection_tracker/widgets/Autocomplete_search.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            children: [
              AutoCompleteInput(
                  onSelected: controller.onSelectedOption,
                  options: controller.folders)
            ],
          )),
    );
  }
}
