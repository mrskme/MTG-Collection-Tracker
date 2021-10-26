class PlayingCard {
  late String? name;
  late int? cmc;
  late String? type;
  late List<dynamic>? types;
  late String? rarity;
  late String? set;
  late String? setName;
  late String? text;
  late String? flavor;
  late String? artist;
  late String? number;
  late String? layout;
  var multiverseId;
  var imageUrl;
  var printings;
  var originalType;
  var Id;
  var legalities;

  PlayingCard(var json) {
    this.name = json["name"];
    this.cmc = json["cmc"];
    this.type = json["type"];
    this.types = json["types"];
    this.rarity = json["rarity"];
    this.set = json["set"];
    this.setName = json["setName"];
    this.text = json["text"];
    this.flavor = json["flavor"];
    this.artist = json["artist"];
    this.number = json["number"];
    this.layout = json["layout"];
    this.multiverseId = json["multiverseid"];
    this.imageUrl = json["imageUrl"];
    this.printings = json["printings"];
    this.originalType = json["originalType"];
    this.Id = json["id"];
    this.legalities = json[legalities];
    printCard();
  }
  printCard() {
    print(name);
    print(cmc);
    print(type);
    print(types);
    print(rarity);
    print(text);
    print(set);
    print(setName);
    print(flavor);
    print(artist);
    print(number);
    print(layout);
    print(multiverseId);
    print(imageUrl);
    print(printings);
    print(originalType);
    print(Id);
    print(legalities);
  }
}
