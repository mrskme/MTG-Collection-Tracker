import 'package:collection_tracker/models/playing_card.dart';

class Folder {
  late String name;
  List<PlayingCard>? cards;

  Folder({required this.name, required this.cards});
}
