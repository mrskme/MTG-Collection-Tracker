// import 'dart:convert';

// import 'package:collection_tracker/routes/app_routes.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'dart:async';

// import 'home_page_controller.dart';

// class HomePage extends GetView<HomePageController> {
//   HomePage() {}
//   @override
//   Widget build(BuildContext context) {
//     fetchCards();
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: TextButton(
//                 child: Text("Go to searcher"),
//                 onPressed: () => {
//                   Get.toNamed(Routes.Searcher),
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:collection_tracker/card_searcher/card_searcher_page.dart';
import 'package:collection_tracker/collection/collection_page.dart';
import 'package:collection_tracker/profile/profile_page.dart';
import 'package:collection_tracker/wishlist/wishlist_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:get/get.dart';

import 'home_page_controller.dart';

class HomeMain extends StatefulWidget {
  @override
  State createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  GlobalKey _bottomNavigationBarKey = GlobalKey();

  Size bottomNavigationBarSize = Size(0, 0);

  @override
  Widget build(BuildContext context) {
    bottomNavigationBarSize = MediaQuery.of(context).size;
    return GetBuilder<HomeMainController>(
      builder: (controller) {
        return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  CardSearcherPage(),
                  WishlistPage(),
                  CollectionPage(),
                  ProfilePage(),
                ],
              ),
            ),
            bottomNavigationBar: Stack(children: <Widget>[
              Positioned(
                child: BottomNavigationBar(
                  key: _bottomNavigationBarKey,
                  //funksjonaliteten til navigasjonsbaren ligger i controller
                  onTap: controller.changeTabIndex,
                  currentIndex: controller.tabIndex,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  //her er hvert element i navigasjonsbaren, du kan bytte ut ikonene med andre.
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.manage_search_rounded),
                        label: "Search"),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_rounded),
                      label: "Wishlist",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.collections_bookmark_rounded),
                      label: "Collection",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_rounded),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: (bottomNavigationBarSize.width / 4) * controller.tabIndex,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 3,
                      width: (bottomNavigationBarSize.width - 80) / 5,
                    )),
              ),
            ]));
      },
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
