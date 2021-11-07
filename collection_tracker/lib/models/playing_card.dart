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

//få ekstra linjeavstand på \n?
  addManaSymbolsToString(double imageSize, String? manaCostString) {
    if (manaCostString != null) {
      var replaceNewLine = manaCostString.replaceAll("\n", "#");
      var removedSlash = replaceNewLine.replaceAll("/", "");
      var split = removedSlash.split(RegExp("[{}]"));
      split.removeWhere((item) => item == "");
      List<InlineSpan> widgets = [];
      for (var i = 0; i < split.length; i++) {
        var item = split[i];
        item = item.replaceAll("#", "\n");
        if (item.contains("(") && item.contains(")")) {
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
            child: SvgPicture.asset(
              "assets/symbols/$item.svg",
              fit: BoxFit.fill,
              alignment: Alignment.bottomLeft,
              clipBehavior: Clip.none,
              height: imageSize,
              width: imageSize,
              allowDrawingOutsideViewBox: true,
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
      return Wrap(
        spacing: 4,
        runSpacing: 4,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Legalities",
              style: AppTextTheme.headline3,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.height * AppSizes.marginDefault),
            child: Divider(
              color: Colors.black,
            ),
          ),
          // SizedBox(
          //   height: screenSize.height * AppSizes.marginSmall,
          // ),
          for (var i = 0; i < legalities!.length; i++)
            Card(
              color: Colors.green,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(8),
              // ),
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: AppColors.darkGreyBlue,
                 ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              // shape: StadiumBorder(
              //   side: BorderSide(
              //     color: Colors.black,
              //     width: 2.0,
              //   ),
              // ),
              child: Container(
                height: screenSize.height * 0.07,
                width: screenSize.width * 0.40,
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

  showRulings(Size screenSize) {
    if (rulings != null) {
      var microSize = screenSize.height * AppSizes.marginMicro;
      return Padding(
        padding: EdgeInsets.only(bottom: microSize),
        child: Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: microSize),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * AppSizes.marginDefault,
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
                  for (var i = 0; i < rulings!.length; i++)
                    Column(
                      children: [
                        Text("${rulings![i]["date"]}"),
                        Text("${rulings![i]["text"]}"),
                        SizedBox(
                          height: microSize,
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
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
    ;
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
