import 'dart:async';
import 'package:collection_tracker/collection/collection/collection_controller.dart';
import 'package:collection_tracker/deck/deck_controller.dart';

import 'package:collection_tracker/collection/folder_content/folder_content_controller.dart';
import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/wishlist/wishlist_controller.dart';
import 'package:get/get.dart';

class ShowCardController extends GetxController {
  var wishlistController = Get.find<WishlistController>();
  var foldersController = Get.find<CollectionController>();
  var deckController = Get.find<DeckController>();
  var folderContentController = Get.find<FolderContentController>();

  addCardToCollection(PlayingCard card) {
    folderContentController.allCards.add(card);
  }

  addCardToWishlist(PlayingCard card) {
    wishlistController.wishlist.add(card);
  }
}
