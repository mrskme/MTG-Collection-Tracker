import 'package:collection_tracker/collection/collection/collection_controller.dart';
import 'package:get/get.dart';
import 'card_searcher/card_searcher_controller.dart';
import 'collection/folder_content/folder_content_controller.dart';
import 'deck/deck_controller.dart';

import 'profile/profile_controller.dart';
import 'services/api_service.dart';
import 'show_card/show_card_controller.dart';
import 'wishlist/wishlist_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ApiService(),
      fenix: true,
    );
    Get.lazyPut<CardSearcherController>(
      () => CardSearcherController(),
      fenix: true,
    );
    Get.lazyPut<CollectionController>(
      () => CollectionController(),
      fenix: true,
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
      fenix: true,
    );
    Get.lazyPut<WishlistController>(
      () => WishlistController(),
      fenix: true,
    );
    Get.lazyPut<DeckController>(
      () => DeckController(),
      fenix: true,
    );

    Get.lazyPut<FolderContentController>(() => FolderContentController(),
        fenix: true);
    Get.lazyPut<ShowCardController>(() => ShowCardController());
  }
}
