import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:collection_tracker/theme/text_theme.dart';
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
    var cardHeight = screenSize.height * 0.50;
    var cardWidth = cardHeight * (cardWidthPercentageOfHeight / 100);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          var defaultHeight = screenHeight * AppSizes.marginDefault;
          var smallHeight = screenHeight * AppSizes.marginSmall;
          var microHeight = screenHeight * AppSizes.marginMicro;
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Container(
                // height: screenSize.height,
                decoration:
                    BoxDecoration(gradient: AppWidgets.backgreoundGradient),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: defaultHeight,
                    ),
                    Text(
                      card.name!,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.headline1,
                    ),
                    Center(
                      child: card.addManaSymbolsToString(
                          screenHeight * 0.026, card.manaCost),
                    ),
                    SizedBox(
                      height: microHeight,
                    ),
                    Text(
                      card.type!,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.headline2,
                    ),
                    if (card.imageUrl != null) SizedBox(height: smallHeight),
                    Align(
                      child: Container(
                        height: cardHeight,
                        width: cardWidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            card.imageUrl!,
                            height: cardHeight,
                            width: cardWidth,
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: SizedBox(
                                  height: screenSize.height * 0.15,
                                  width: screenSize.height * 0.15,
                                  child: LinearProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: defaultHeight),
                          Center(
                            child: card.addManaSymbolsToString(
                                screenHeight * 0.019, card.text!),
                          ),
                          SizedBox(
                            height: defaultHeight,
                          ),
                          Center(
                            child: Text(
                              "Card info",
                              style: AppTextTheme.headline3,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: smallHeight,
                          ),
                          card.showFlavor(microHeight),
                          card.showTotalCMC(microHeight),
                          card.showAttributeStatsThingys(microHeight),
                          card.showRarity(microHeight),
                          card.showSet(microHeight),
                          card.showArtist(microHeight),
                          card.showRulings(screenSize),
                          SizedBox(
                            height: smallHeight, //or defaultHeight?
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: card.showLegalities(screenSize),
                    ),
                    SizedBox(
                      height: smallHeight, //or defaultHeight?
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
