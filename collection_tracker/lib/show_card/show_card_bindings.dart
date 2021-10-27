import 'package:get/get.dart';
import 'show_card_controller.dart';

class ShowCardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowCardController>(
      () => ShowCardController(),
    );
  }
}
