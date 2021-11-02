// import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
// import 'package:collection_tracker/collection/collection_controller.dart';
// import 'package:collection_tracker/profile/profile_controller.dart';
// import 'package:collection_tracker/show_card/show_card_controller.dart';
// import 'package:collection_tracker/wishlist/wishlist_controller.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';

class HomeMainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMainController>(() => HomeMainController());
  }
}
