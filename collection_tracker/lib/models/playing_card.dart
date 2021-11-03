import 'package:flutter/material.dart';

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
  late int? loyality;
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
    this.loyality = json["loyality"]?.toInt();
    this.layout = json["layout"];
    this.multiverseId = json["multiverseid"];
    this.imageUrl = json["imageUrl"];
    this.printings = json["printings"].cast<String>();
    this.id = json["id"];
    this.gameFormat = json["gameFormat"];
    this.legalities = json["legalities"];
    printCard();
  }

  showCardText(double screenHight) {
    if (text != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: screenHight * 0.03),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      );
    }
    return nothing;
  }

  showManaCostImages() {
    Map<String, String> images = {
      // "W" :
      // "2/W" : "",
      "G/U": "assets/manaSymbols/GU.png",
    };
    List<Widget> row = [];
    if (manaCost != null) {
      var parts = manaCost!.split('}{');
      parts[0] = parts[0].substring(1);
      var lastIndex = parts.length - 1;
      parts[lastIndex] =
          parts[lastIndex].substring(0, parts[lastIndex].length - 1);
      var image = images["G/U"];
      row.add(Image(image: AssetImage(image!)));
    }
    print(row);
    return Row(
      children: row,
    );
  }

  showTotalCMC(double screenHight) {
    if (cmc != null && cmc != 0) {
      return Padding(
        padding: EdgeInsets.only(top: screenHight * 0.02),
        child: Text(
          "CMC: " + cmc!.toString(),
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      );
    }
    return nothing;
  }

  printCard() {
    print("name: " + name.toString());
    print("names: " + names.toString());
    print("mana cost: " + manaCost.toString());
    print("cmc: " + cmc.toString());
    print("varations: " + variations.toString());
    print("rulings: " + rulings.toString());
    print("type: " + type.toString());
    print("rarity: " + rarity.toString());
    print("text: " + text.toString());
    print("set: " + set.toString());
    print("setName: " + setName.toString());
    print("flavor: " + flavor.toString());
    print("artist: " + artist.toString());
    print("number: " + number.toString());
    print("power: " + power.toString());
    print("toughness: " + toughness.toString());
    print("loyality: " + loyality.toString());
    print("life: " + life.toString());
    print("layout: " + layout.toString());
    print("multiverseId: " + multiverseId.toString());
    print("imageUrl: " + imageUrl.toString());
    print("printing: " + printings.toString());
    print("Id: " + id.toString());
    print("gameFormat: " + gameFormat.toString());
    print("legalities: " + legalities.toString());
  }
}
