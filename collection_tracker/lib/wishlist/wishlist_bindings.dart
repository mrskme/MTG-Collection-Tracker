import 'package:get/get.dart';
import 'wishlist_controller.dart';

class WishlistBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(
      () => WishlistController(),
    );
  }
}
