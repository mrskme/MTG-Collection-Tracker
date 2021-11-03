import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ApiService extends GetxService {
  final RxList<String> _cardNames = ["Waiting for cards"].obs;
  final RxBool _isLoadingCards = false.obs;

  get cardNames => _cardNames;
  get isLoadingCardNames => _isLoadingCards.value;

  @override
  void onInit() async {
    super.onInit();
    await fetchAndDecodeCardNames();
  }

  Future<void> fetchAndDecodeCardNames() async {
    print("Now we fetch");
    _isLoadingCards.value = true;
    List<dynamic> cardsJson = await fetchCardNames();
    List<String> jsonStringCards = cardsJson.cast<String>();
    _cardNames.value = jsonStringCards;
    _isLoadingCards.value = false;
    print("fetched and saved all card names. Count ${_cardNames.length}");
  }

  Future<List<dynamic>> fetchCardNames() async {
    var cardNames;
    try {
      var response =
          await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
              .get("https://api.scryfall.com/catalog/card-names");
      cardNames = response.data["data"];
    } on Exception catch (e) {
      cardNames = ["Couldn't find cardnames"];
      print(e);
    }
    return cardNames;
  }

//https://api.magicthegathering.io/v1/cards?type=land&&name=cradle  and parameter
  dynamic getOneByName(String name) async {
    var card;
    try {
      var response =
          await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
              .get("https://api.magicthegathering.io/v1/cards?name=$name");
      card = response.data["cards"].firstWhere(
          (card) => card["name"] == name && card["imageUrl"] != null);
      print(card);
    } catch (e) {
      card = "Couldn't find card";
      print(e);
    }
    return card;
  }
}
