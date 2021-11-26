import 'dart:async';

import 'package:collection_tracker/models/playing_card.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionController extends GetxController {
  RxList<PlayingCard> allFolder = <PlayingCard>[].obs;

  Color getBorderColor(List<String> colorIdentity) {
    if (colorIdentity.length > 1) return Colors.amber.shade400;
    var c = colorIdentity[0];
    if (c == "W") return Colors.white;
    if (c == "U") return Colors.blue;
    if (c == "B") return Colors.black;
    if (c == "G") return Colors.green;
    if (c == "R")
      return Colors.red;
    else
      return Colors.black;
  }
}
