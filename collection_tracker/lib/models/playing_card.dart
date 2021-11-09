import 'package:collection_tracker/theme/text_theme.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayingCard {
  late String? name;
  late List<String>? names;
  late String? manaCost;
  late int? cmc;
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
    print(json);
    this.name = json["name"];
    this.names = json["names"]?.cast<String>();
    this.manaCost = json["manaCost"];
    this.cmc = json["cmc"]?.toInt();
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
    printCard();
  }

  addManaSymbolsToString(double imageSize, String? symbolsString,
      bool isCenterText, bool shouldTransform) {
    if (symbolsString != null) {
      var replaceNewLine = symbolsString.replaceAll("\n", "#");
      var removedSlash = replaceNewLine.replaceAll("/", "");
      var split = removedSlash.split(RegExp("[{}]"));
      split.removeWhere((item) => item == "");
      List<InlineSpan> widgets = [];
      for (var i = 0; i < split.length; i++) {
        var item = split[i];
        item = item.replaceAll("#", "\n");
        if (item.contains("(") && item.contains(")")) {
          //colossus hammer bug
          int start = item.indexOf("(");
          int end = item.indexOf(")");
          var preParenthesisText = item.substring(0, start);
          var textInParenthesis = item.substring(start, end + 1);
          var postParenthesisText = item.substring(end + 1, item.length);
          widgets.add(TextSpan(text: preParenthesisText));
          widgets.add(TextSpan(
              text: textInParenthesis,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              )));
          widgets.add(TextSpan(text: postParenthesisText));
        } else if (item.contains(RegExp("^[A-Z0-9]")) && item.length < 3) {
          widgets.add(WidgetSpan(
            baseline: TextBaseline.ideographic,
            child: Container(
              transform: shouldTransform
                  ? Matrix4.translationValues(0, -2.5, 0)
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
          ));
        } else {
          widgets.add(TextSpan(text: item));
        }
      }
      return Text.rich(
        TextSpan(
          children: widgets,
        ),
        textAlign: isCenterText ? TextAlign.center : TextAlign.start,
      );
    }
    return nothing;
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

  showRulings(Size screenSize, double imageSize) {
    var widgets = [];
    if (rulings != null) {
      var smallSize = screenSize.height * AppSizes.marginSmall;
      rulings!.forEach((rule) {
        widgets
            .add(addManaSymbolsToString(imageSize, rule["text"], true, true));
      });
      // print(widgets);

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

  printCard() {
    // print("name: " + name.toString());
    // print("names: " + names.toString());
    //print("mana cost: " + manaCost.toString());
    // print("cmc: " + cmc.toString());
    //print("varations: " + variations.toString());
    //print("rulings: " + rulings.toString());
    // print("type: " + type.toString());
    // print("rarity: " + rarity.toString());
    //print("text: " + text.toString());
    // print("set: " + set.toString());
    // print("setName: " + setName.toString());
    // print("flavor: " + flavor.toString());
    // print("artist: " + artist.toString());
    //print("number: " + number.toString());
    //print("power: " + power.toString());
    //print("toughness: " + toughness.toString());
    //print("loyality: " + loyalty.toString());
    //print("life: " + life.toString());
    //print("layout: " + layout.toString());
    // print("multiverseId: " + multiverseId.toString());
    // print("imageUrl: " + imageUrl.toString());
    //print("printing: " + printings.toString());
    // print("Id: " + id.toString());
    // print("gameFormat: " + gameFormat.toString());
    print("legalities: " + legalities.toString());
  }
}
