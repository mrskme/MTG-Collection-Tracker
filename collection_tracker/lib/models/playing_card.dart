import 'package:collection_tracker/theme/text_theme.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayingCard {
  late String? name;
  late List<String>? names;
  late String? manaCost;
  late int? cmc;
  late List<String>? colorIdentity;
  late List<String>? variations;
  late List<dynamic>? rulings;
  late String? type;
  late String? rarity;
  late String? set;
  late String? setName;
  late String? text;
  late String? flavor;
  late String? artist;
  late String? number;
  late String? power;
  late String? toughness;
  late String? life;
  late String? loyalty;
  late List<String>? gameFormat;
  late List<dynamic>? legalities;
  late String? layout;
  late String? multiverseId;
  late String? imageUrl;
  late List<String>? printings;
  late String? id;

  var nothing = SizedBox.shrink();

  PlayingCard(var json) {
    this.name = json["name"];
    this.names = json["names"]?.cast<String>();
    this.manaCost = json["manaCost"];
    this.cmc = json["cmc"]?.toInt();
    print(json["colorIdentity"].toString());
    this.colorIdentity = json["colorIdentity"]?.cast<String>();
    this.variations = json["variations"]?.cast<String>();
    this.rulings = json["rulings"];
    this.type = json["type"];
    this.rarity = json["rarity"];
    this.set = json["set"];
    this.setName = json["setName"];
    this.text = json["text"];
    this.flavor = json["flavor"];
    this.artist = json["artist"];
    this.number = json["number"];
    this.power = json["power"];
    this.toughness = json["toughness"];
    this.life = json["life"];
    this.loyalty = json["loyalty"];
    this.layout = json["layout"];
    this.multiverseId = json["multiverseid"];
    this.imageUrl = json["imageUrl"];
    this.printings = json["printings"].cast<String>();
    this.id = json["id"];
    this.gameFormat = json["gameFormat"];
    this.legalities = json["legalities"];
  }

  dynamic addManaSymbolsToString(
      {required double symbolSize,
      String? symbolsString,
      bool isCenterText = false,
      bool shouldTransform = false,
      bool isCardText = false}) {
    if (symbolsString != null) {
      List<String> items = treatString(symbolsString);
      List<InlineSpan> widgets = [];
      for (var i = 0; i < items.length; i++) {
        var item = items[i];
        item = item.replaceAll("#", "\n");
        var isItemSymbolAsText =
            item.contains(RegExp("^[A-Z0-9]")) && item.length < 3;
        var isItemContainsParenthesis =
            item.contains("(") && item.contains(")");

        if (isItemContainsParenthesis) {
          //colossus hammer bug
          //drogskol reaver bug
          List<InlineSpan> a = ChangeTextInParenthesisToItalic(item);
          widgets.addAll(a);
        } else if (isItemSymbolAsText) {
          widgets.add(AddSymbol(shouldTransform, item, symbolSize));
        } else {
          widgets.add(TextSpan(text: item));
        }
      }
      return Text.rich(
        TextSpan(
            children: widgets,
            style:
                isCardText ? AppTextTheme.bodyText1 : AppTextTheme.bodyText2),
        textAlign: isCenterText ? TextAlign.center : TextAlign.start,
      );
    }
    return nothing;
  }

  List<String> treatString(String symbolsString) {
    var StringWithoutLineBreak = symbolsString.replaceAll("\n", "#");
    var removedSlash = StringWithoutLineBreak.replaceAll("/", "");
    var items = removedSlash.split(RegExp("[{}]"));
    items.removeWhere((item) => item == "");
    return items;
  }

  ChangeTextInParenthesisToItalic(String item) {
    int start = item.indexOf("(");
    int end = item.indexOf(")");
    var preParenthesisText = item.substring(0, start);
    var textInParenthesis = item.substring(start, end + 1);
    var postParenthesisText = item.substring(end + 1, item.length);
    List<InlineSpan> textSpan = [];
    textSpan.add(TextSpan(text: preParenthesisText));
    textSpan.add(TextSpan(
        text: textInParenthesis,
        style: TextStyle(
          fontStyle: FontStyle.italic,
        )));
    textSpan.add(TextSpan(text: postParenthesisText));

    return textSpan;
  }

  AddSymbol(bool shouldTransform, String item, double imageSize) {
    return WidgetSpan(
      child: Container(
        transform: shouldTransform
            ? Matrix4.translationValues(0, -2.25, 0)
            : Matrix4.translationValues(0, 0, 0),
        child: SvgPicture.asset(
          "assets/symbols/$item.svg",
          fit: BoxFit.fill,
          alignment: Alignment.bottomLeft,
          clipBehavior: Clip.none,
          height: imageSize,
          width: imageSize,
          allowDrawingOutsideViewBox: true,
        ),
      ),
    );
  }

  showFlavor(double paddingBottom) {
    if (flavor != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: Row(
          children: [
            Text("Flavor: "),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: paddingBottom),
                child: Container(
                  child: Text(
                    flavor!,
                    overflow: TextOverflow.visible,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return nothing;
  }

  //showLegalitiesWithLoop
  showLegalities(Size screenSize) {
    if (legalities != null) {
      var tinySizeMultiplier = 0.005;
      return Wrap(
        spacing: screenSize.height * tinySizeMultiplier,
        runSpacing: screenSize.height * tinySizeMultiplier,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: <Widget>[
          SizedBox(
            height: screenSize.height *
                (AppSizes.marginDefault -
                    tinySizeMultiplier -
                    AppSizes.marginSmall),
          ),
          Center(
            child: Text(
              "Legalities",
              style: AppTextTheme.headline3,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: screenSize.height *
                    (AppSizes.marginSmall - tinySizeMultiplier)),
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.height * AppSizes.marginDefault),
            child: Divider(
              color: Colors.black,
            ),
          ),
          for (var i = 0; i < legalities!.length; i++)
            Card(
              color: Colors.green,
              // shape: RoundedRectangleBorder(
              //   side: BorderSide(
              //     color: AppColors.darkGreyBlue,
              //   ),
              //   borderRadius: BorderRadius.circular(8),
              // ),
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: AppColors.darkGreyBlue,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              // shape: StadiumBorder(
              //   side: BorderSide(
              //     color: AppColors.darkGreyBlue,
              //     //width: 2.0,
              //   ),
              // ),
              child: Container(
                height: screenSize.height * 0.07,
                width: screenSize.width * 0.42,
                child: Center(
                  child: Text(
                    "${legalities![i]["format"]}: ${legalities![i]["legality"]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
        ],
      );
    }
    return nothing;
  }

  showRulings(Size screenSize, double symbolSize) {
    var widgets = [];
    if (rulings != null) {
      var smallSize = screenSize.height * AppSizes.marginSmall;
      rulings!.forEach(
        (rule) {
          widgets.add(addManaSymbolsToString(
            symbolSize: symbolSize,
            symbolsString: rule["text"],
            isCenterText: true,
            shouldTransform: true,
          ));
        },
      );

      return Container(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height *
                  (AppSizes.marginDefault - AppSizes.marginMicro),
            ),
            Text(
              "Rulings",
              style: AppTextTheme.headline3,
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: screenSize.height * AppSizes.marginSmall,
            ),
            for (var i = 0; i < widgets.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${rulings![i]["date"]}"),
                  widgets[i],
                  SizedBox(
                    height: smallSize,
                  ),
                ],
              )
          ],
        ),
      );
    }
    return nothing;
  }

  showAttributeStatsThingys(double paddingBottom) {
    var str = "";
    if (toughness != null && power != null)
      str = "Toughness and power: $toughness/$power";
    else if (life != null)
      str = "Life: $life";
    else if (loyalty != null)
      str = "Loyalty: $loyalty";
    else
      return nothing;
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Text(str),
    );
  }

  showSet(double paddingBottom) {
    if (set != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: Text("Set: " + setName!),
      );
    }
    return nothing;
  }

  showArtist(double paddingBottom) {
    if (artist != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: Text("Artist: " + artist!),
      );
    }
    return nothing;
  }

  showRarity(double paddingBottom) {
    if (rarity != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: Text("Rarity: " + rarity!),
      );
    }
    return nothing;
  }

  showTotalCMC(double paddingBottom) {
    if (cmc != null && cmc != 0) {
      return Padding(
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: Text(
          "CMC: " + cmc!.toString(),
        ),
      );
    }
    return nothing;
  }
}
