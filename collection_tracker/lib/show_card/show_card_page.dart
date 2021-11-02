import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'show_card_controller.dart';

var apiController = Get.find<ApiService>();

class ShowCardPage extends GetView<ShowCardController> {
  final cardSearcherController = Get.find<CardSearcherController>();
  final cardWidthPercentageOfHeight = 71.551724137931;

  @override
  Widget build(BuildContext context) {
    var card = controller.card;
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var cardHeight = screenSize.height * 0.47;
    var cardWidth = cardHeight * (cardWidthPercentageOfHeight / 100);
    return Scaffold(
      appBar: AppWidgets.staticAppBar("", context),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Container(
                // height: screenSize.height,
                decoration:
                    BoxDecoration(gradient: AppWidgets.backgreoundGradient),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    Text(
                      card.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    Text(
                      card.type!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    if (card.imageUrl != null)
                      Padding(
                        padding:
                            EdgeInsets.only(top: screenSize.height * 0.015),
                        child: Align(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              card.imageUrl!,
                              height: cardHeight,
                              width: cardWidth,
                              fit: BoxFit.contain,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.05),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.height * 0.03),
                          card.showCardText(screenHeight),
                          Text(
                            "Card info",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 21,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          card.showCMC(screenHeight),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  // cardCMC() {
  //   if ()
  // }
}
