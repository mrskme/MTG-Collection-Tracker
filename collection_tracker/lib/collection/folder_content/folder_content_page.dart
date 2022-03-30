import 'package:collection_tracker/collection/folder_content/folder_content_controller.dart';
import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FolderContentPage extends GetView<FolderContentController> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<PlayingCard> cardList = Get.arguments;

    double cardHeight = 45;
    return Scaffold(
      appBar: AppWidgets.staticAppBar("Collection", context),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppWidgets.backgreoundGradient,
        ),
        child: ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.orange,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0),
                  )
                ],
              ),
              height: cardHeight,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
              child: Stack(
                children: [
                  Transform(
                    transform: Matrix4.diagonal3Values(1.195, 1.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Align(
                        alignment: Alignment.center,
                        widthFactor: 0.84,
                        heightFactor: 1,
                        child: Image.network(
                          cardList[i].imageUrl!,
                          alignment: Alignment(0, -0.5),
                          fit: BoxFit.cover,
                          height: screenSize.height,
                          width: screenSize.width,
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
                                    text: "${cardList[i].name!}\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                  ),
                                  TextSpan(
                                    text: "${cardList[i].type}",
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
                        cardList[i].addManaSymbolsToString(
                          symbolSize: 16,
                          symbolsString: cardList[i].manaCost,
                          isCenterText: true,
                        ),
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = _getPath(size);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  Path _getPath(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.04, 0);
    path.lineTo(size.width * 0.04, size.height);
    path.lineTo(size.width * 0.96, size.height);
    path.lineTo(size.width * 0.96, 0);
    path.lineTo(size.width * 0.04, 0);
    return path;
  }
}
