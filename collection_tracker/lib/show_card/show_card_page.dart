import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'show_card_controller.dart';

var apiController = Get.find<ApiService>();

// Enum cardColors = {
//   e: "s",
// }

class ShowCardPage extends GetView<ShowCardController> {
  var cardSearcherController = Get.find<CardSearcherController>();
  var cardWidthPercentageOfHeight = 71.551724137931;

  @override
  Widget build(BuildContext context) {
    var card = cardSearcherController.chosenCard!;
    var screenSize = MediaQuery.of(context).size;
    var cardHeight = screenSize.height * 0.75;
    var cardWidth = cardHeight * cardWidthPercentageOfHeight;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wallpapers/VolcanicMountain.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text("Back"),
              ),
              Text(card.name!),
              if (card.imageUrl != null)
                Image.network(
                  card.imageUrl,
                  height: cardHeight,
                  width: cardWidth,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: Image(
                        image: AssetImage("assets/wallpapers/Placeholder.jpg"),
                      ),
                      // CircularProgressIndicator(
                      //   value: loadingProgress.expectedTotalBytes != null
                      //       ? loadingProgress.cumulativeBytesLoaded /
                      //           loadingProgress.expectedTotalBytes!.toInt()
                      //       : null,
                      // ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
