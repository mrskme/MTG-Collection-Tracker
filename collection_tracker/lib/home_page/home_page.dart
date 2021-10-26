import 'dart:convert';

import 'package:collection_tracker/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

import 'home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  HomePage() {}
  @override
  Widget build(BuildContext context) {
    fetchCards();
    return Scaffold(
      body: Row(
        children: [
          TextButton(
            onPressed: () => {},
            child: Text("Hent ut kort"),
          ),
          Container(
            child: TextButton(
              child: Text("Go to searcher"),
              onPressed: () => {
                Get.toNamed(Routes.Searcher),
              },
            ),
          ),
        ],
      ),
    );
  }
}

void fetchCards() async {
  // try {
  //   // var response =
  //   //     await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
  //   //         .get("https://api.magicthegathering.io/v1/sets?name=khans");
  //   var response =
  //       await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
  //           .get("https://api.scryfall.com/catalog/card-names");
  //   print(response.data);
  //   List<dynamic> stuff = response.data["data"];
  //   //final json1 = "[" + response.data.toString() + "]";
  //   // var data = response.data['cards'].toString();
  //   // print(response.data['cards'][0]["name"]);
  //   // String rawJson = jsonEncode(data);
  //   // var decode = json.decode(json1);
  //   // print(decode);
  //   // print(data);
  //   // var decoded = json.decode(rawJson);
  //   // print(decoded);
  //   var haha = 1;
  // } catch (error) {
  //   print(error);
  // }
}
