import 'dart:async';

import 'package:collection_tracker/models/playing_card.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionController extends GetxController {
  RxList<PlayingCard> ownedCards = <PlayingCard>[].obs;
}
