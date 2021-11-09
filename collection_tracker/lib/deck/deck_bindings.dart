import 'package:get/get.dart';
import 'deck_controller.dart';

class DeckBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeckController>(
      () => DeckController(),
    );
  }
}
