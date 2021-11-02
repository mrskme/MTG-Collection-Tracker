import 'package:get/get.dart';

import 'card_searcher/card_searcher_controller.dart';
import 'collection/collection_controller.dart';
import 'profile/profile_controller.dart';
import 'services/api_service.dart';
import 'show_card/show_card_controller.dart';
import 'wishlist/wishlist_controller.dart';

// class AppBindings extends Bindings {
//   @override
//   Future<void> dependencies() async {
//     await Get.putAsync<ApiService>(
//       () async {
//         return await ApiService();
//       },
//     );
//   }
// }
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService(), fenix: true);
    Get.lazyPut<CardSearcherController>(() => CardSearcherController(),
        fenix: true);
    Get.lazyPut<CollectionController>(() => CollectionController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<WishlistController>(() => WishlistController());
    Get.lazyPut<ShowCardController>(() => ShowCardController());
  }
}
