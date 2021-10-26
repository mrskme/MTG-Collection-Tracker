import 'package:collection_tracker/card_searcher/card_searcher_bindings.dart';
import 'package:collection_tracker/card_searcher/card_searcher_page.dart';
import 'package:collection_tracker/home_page/home_page.dart';
import 'package:collection_tracker/home_page/home_page_bindings.dart';
import 'package:collection_tracker/root/root_bindings.dart';
import 'package:collection_tracker/root/root_view.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Home;

  static final routes = [
    GetPage(
        name: '/',
        page: () => RootView(),
        binding: RootBinding(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: [
          GetPage(
              name: Paths.home,
              page: () => HomePage(),
              binding: HomePageBindings(),
              children: [
                GetPage(
                    name: Paths.searcher,
                    page: () => CardSearcherPage(),
                    binding: CardSearcherBindings()),
              ]),
        ]),
  ];
}
