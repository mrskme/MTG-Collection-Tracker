import 'package:get/get.dart';

import 'card_searcher_controller.dart';

class CardSearcherBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardSearcherController>(
      () => CardSearcherController(),
    );
  }
}
