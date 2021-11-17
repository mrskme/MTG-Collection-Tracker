import 'package:collection_tracker/services/api_service.dart';
import 'package:collection_tracker/theme/text_theme.dart';
import 'package:collection_tracker/theme/theme_constants.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'collection_controller.dart';
import 'package:image/image.dart' as ImagePackage;

var apiController = Get.find<ApiService>();

class CollectionPage extends GetView<CollectionController> {
  
  @override
  Widget build(BuildContext context) {
    var imageUrl = controller.ownedCards[i].imageUrl!;
    var image2 = Image.network(imageUrl);
    var image = ImagePackage.Image(data: image2);
  var image = ImagePackage.copyCrop(image2, x, y, w, h)
    double cardHeight = 55;
    return Scaffold(
      appBar: AppWidgets.staticAppBar("Collection", context),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppWidgets.backgreoundGradient,
        ),
        child: ListView.builder(
          itemCount: controller.ownedCards.length,
          itemBuilder: (context, i) {
            return Container(
              color: Colors.orange,
              height: cardHeight,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      controller.ownedCards[i].imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            );
            // Container(
            //   height: cardHeight,
            //   margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       width: 2,
            //       color: controller.getBorderColor(
            //         controller.ownedCards[i].colorIdentity ??
            //             ["no color identity"],
            //       ),
            //     ),
            //     image: DecorationImage(
            //       alignment: Alignment(0, -0.5),
            //       fit: BoxFit.cover,
            //       image: NetworkImage(
            //         controller.ownedCards[i].imageUrl!,
            //       ),
            //     ),
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(6.0),
            //     ),
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //           color: Colors.black.withAlpha(100), blurRadius: 3.0),
            //     ],
            //   ),
            //   child: ListTile(
            //     onTap: () => {
            //       print("Tapped card"),
            //     },
            //     leading: Card(
            //       color: AppColors.primaryColor.withOpacity(0.5),
            //       child: Padding(
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            //         child: Text(
            //           controller.ownedCards[i].name!,
            //           style: AppTextTheme.bodyText1.copyWith(
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ),
            //     trailing: controller.ownedCards[i].addManaSymbolsToString(
            //         20, controller.ownedCards[i].manaCost, true, false),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
