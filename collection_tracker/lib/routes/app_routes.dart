class Routes {
  Routes._();

  static const Home = Paths.homeMain;
  static const ShowCard = Paths.homeMain + Paths.showCard;
  static const Searcher = Paths.homeMain + Paths.searcher;
  static const Collection = Paths.homeMain + Paths.collection;
  static const FolderContent = Collection + Paths.folderContent;
}

class Paths {
  Paths._();

  static const String homeMain = '/home';
  static const String showCard = '/showCard';
  static const String searcher = '/searcher';
  static const String collection = '/collection';
  static const String folderContent = '/folderContent';
}
