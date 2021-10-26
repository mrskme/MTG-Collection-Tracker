import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ApiService extends GetxService {
  late List<String> _cardNames = ["Waiting for cards"];
  get cardNames => _cardNames;
  @override
  void onInit() async {
    super.onInit();
    await decodeCards();
  }

  Future<void> decodeCards() async {
    var cards = await getCardNames();
    var dynamicToString = cards.map((e) => e.toString()).toList();
    print(dynamicToString.length);
    _cardNames = dynamicToString;
    //print(_cardNames);
  }

  Future<List<dynamic>> getCardNames() async {
    var cardNames;
    try {
      var response =
          await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
              .get("https://api.scryfall.com/catalog/card-names");
      cardNames = response.data["data"];
    } on Exception catch (e) {
      print(e);
    }
    return cardNames;
  }

  getOneByName(String name) async {
    var card;
    try {
      var response =
          await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
              .get("https://api.magicthegathering.io/v1/cards?name=$name");
      card = response.data["cards"][0];
      print(card);
    } on Exception catch (e) {
      print(e);
    }
    return card;
  }
}
