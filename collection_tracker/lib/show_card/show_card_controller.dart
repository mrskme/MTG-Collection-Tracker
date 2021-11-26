import 'dart:async';

import 'package:collection_tracker/collection/collection_controller.dart';
import 'package:collection_tracker/deck/deck_controller.dart';
import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/wishlist/wishlist_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowCardController extends GetxController {
  late PlayingCard card;

  var wishlistController = Get.find<WishlistController>();
  var collectionController = Get.find<CollectionController>();
  var deckController = Get.find<DeckController>();

  addCardToCollection() {
    collectionController.allFolder.add(card);
  }

  addCardToWishlist() {
    wishlistController.wishlist.add(card);
  }
}
