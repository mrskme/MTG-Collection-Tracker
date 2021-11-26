import 'package:collection_tracker/services/api_service.dart';
import 'package:collection_tracker/theme/text_theme.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'collection_controller.dart';
// import 'package:image/image.dart' as ImagePackage;

var apiController = Get.find<ApiService>();

class CollectionPage extends GetView<CollectionController> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    //   var imageUrl = controller.ownedCards[i].imageUrl!;
    //   var image2 = Image.network(imageUrl);
    //   var image = ImagePackage.Image(data: image2);
    // var image = ImagePackage.copyCrop(image2, x, y, w, h)
    double cardHeight = 45;
    return Scaffold(
      appBar: AppWidgets.staticAppBar("Collection", context),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppWidgets.backgreoundGradient,
        ),
        child: ListView.builder(
          itemCount: controller.allFolder.length,
          itemBuilder: (context, i) {
            return Container(
              color: Colors.orange,
              height: cardHeight,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: ClipRect(
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        child: Image.network(
                          controller.allFolder[i].imageUrl!,
                          alignment: Alignment(0, -0.5),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${controller.allFolder[i].name!}\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                  ),
                                  TextSpan(
                                    text: "${controller.allFolder[i].type}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 11,
                                          color: Colors.white,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        controller.allFolder[i].addManaSymbolsToString(
                            20, controller.allFolder[i].manaCost, true, false),
                      ],
                    ),
                  )
                ],
              ),
            );
            //     Container(
            //   height: cardHeight,
            //   margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       width: 2,
            //       color: controller.getBorderColor(
            //         controller.allFolder[i].colorIdentity ??
            //             ["no color identity"],
            //       ),
            //     ),
            //     image: DecorationImage(
            //       alignment: Alignment(0, -0.5),
            //       fit: BoxFit.cover,
            //       image: NetworkImage(
            //         controller.allFolder[i].imageUrl!,
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
            //           controller.allFolder[i].name!,
            //           style: AppTextTheme.bodyText1.copyWith(
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ),
            //     trailing: controller.allFolder[i].addManaSymbolsToString(
            //         20, controller.allFolder[i].manaCost, true, false),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
