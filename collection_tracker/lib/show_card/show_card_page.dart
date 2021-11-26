import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/collection/collection_controller.dart';
import 'package:collection_tracker/deck/deck_controller.dart';
import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/services/api_service.dart';
import 'package:collection_tracker/theme/text_theme.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:collection_tracker/wishlist/wishlist_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'show_card_controller.dart';
import 'dart:math';

var apiController = Get.find<ApiService>();

class ShowCardPage extends GetView<ShowCardController> {
  final cardSearcherController = Get.find<CardSearcherController>();
  final cardWidthPercentageOfHeight = 71.551724137931;

  double getRaidiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    var card = controller.card;
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var cardHeight = screenSize.height * 0.50;
    var cardWidth = cardHeight * (cardWidthPercentageOfHeight / 100);
    var largeSymbolSize = screenHeight * 0.026;
    var smallSymbolSize = screenHeight * 0.017;
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
                //centerTitle: true,
                ),
            body: Stack(
              children: [
                LayoutBuilder(
                  builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    var defaultHeight = screenHeight * AppSizes.marginDefault;
                    var smallHeight = screenHeight * AppSizes.marginSmall;
                    var microHeight = screenHeight * AppSizes.marginMicro;
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight),
                        child: Container(
                          // height: screenSize.height,
                          decoration: BoxDecoration(
                              gradient: AppWidgets.backgreoundGradient),
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
                                    largeSymbolSize,
                                    card.manaCost,
                                    false,
                                    false),
                              ),
                              SizedBox(
                                height: microHeight,
                              ),
                              Text(
                                card.type!,
                                textAlign: TextAlign.center,
                                style: AppTextTheme.headline2,
                              ),
                              if (card.imageUrl != null)
                                SizedBox(height: smallHeight),
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
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: SizedBox(
                                            height: screenSize.height * 0.04,
                                            width: screenSize.height * 0.35,
                                            child: LinearProgressIndicator(
                                              color: AppColors.darkGreyBlue,
                                              backgroundColor:
                                                  AppColors.lightBlueGrey,
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultHeight),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: defaultHeight),
                                    if (card.text != null)
                                      Center(
                                        child: card.addManaSymbolsToString(
                                            smallSymbolSize,
                                            card.text!,
                                            false,
                                            true),
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
                                    card.showRulings(
                                        screenSize, smallSymbolSize),
                                    // SizedBox(
                                    //   height: smallHeight, //or defaultHeight?
                                    // )
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
              ],
            ),
          ),
          MenuButtons(screenSize),
        ],
      ),
    );
  }
}

class MenuButtons extends StatefulWidget {
  final screenSize;
  MenuButtons(this.screenSize);

  @override
  _MenuButtonsState createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<MenuButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  late Animation rotationAnimation;
  bool isOpenMenu = false;
  var controller = Get.find<ShowCardController>();

  _MenuButtonsState();

  double getRaidiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
    );
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.1), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.1, end: 1.0), weight: 65.0)
    ]).animate(
      animationController,
    );
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.1), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.1, end: 1.0), weight: 45.0)
    ]).animate(
      animationController,
    );
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.1), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.1, end: 1.0), weight: 25.0)
    ]).animate(
      animationController,
    );
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
    animationController.addListener(
      () {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      left: widget.screenSize.width * 0.85,
      top: widget.screenSize.height * 0.063,
      //right: widget.screenSize.width * 0.03,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IgnorePointer(
                  child: Container(
                    alignment: Alignment.topLeft,
                    color: Colors.transparent,
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRaidiansFromDegree(90),
                      degThreeTranslationAnimation.value * 150),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRaidiansFromDegree(rotationAnimation.value)),
                    //..scale(degThreeTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      size: 38,
                      color: Colors.purple.shade900,
                      icon: Icon(
                        Icons.collections_bookmark_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () => {
                        print("Clicked collection button"),
                        controller.addCardToCollection(),
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRaidiansFromDegree(90),
                      degTwoTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRaidiansFromDegree(rotationAnimation.value)),
                    //..scale(degTwoTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      size: 38,
                      color: Colors.indigo.shade800,
                      icon: Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () => {
                        print("Clicked wishlist button"),
                        controller.addCardToWishlist(),
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRaidiansFromDegree(90),
                      degOneTranslationAnimation.value * 50),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRaidiansFromDegree(rotationAnimation.value)),
                    //..scale(degOneTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      size: 38,
                      color: Colors.lightBlue.shade900,
                      icon: Icon(
                        CupertinoIcons.layers_alt_fill,
                        color: Colors.white,
                      ),
                      onPressed: () => {
                        // print("Clicked collection button"),
                        // controller.addCardToCollection()
                      },
                    ),
                  ),
                ),
                CircularButton(
                  size: 38,
                  color: Colors.teal.shade800,
                  icon: Icon(
                    isOpenMenu ? Icons.remove : Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () => {
                    print("Clicked green button"),
                    setState(() {
                      isOpenMenu = !isOpenMenu;
                    }),
                    if (!isOpenMenu)
                      {
                        animationController.reverse(),
                      }
                    else
                      {
                        animationController.forward(),
                      }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularButton extends GetView<ShowCardController> {
  final Color color;
  final Icon icon;
  final Function onPressed;
  final double size;

  CircularButton({
    required this.color,
    required this.icon,
    required this.onPressed,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    //double size = 35;
    return
        // Container(
        //   decoration: BoxDecoration(
        //     color: color,
        //     shape: BoxShape.circle,
        //   ),
        //   width: size,
        //   height: size,
        //   child: IconButton(
        //     enableFeedback: true,
        //     icon: icon,
        //     onPressed: () => {
        //       onPressed(),
        //     },
        //   ),

        Container(
      height: size,
      width: size,
      child: FloatingActionButton(
          heroTag: null,
          backgroundColor: color,
          onPressed: () => {
                onPressed(),
              },
          child: icon),
    );
  }
}
