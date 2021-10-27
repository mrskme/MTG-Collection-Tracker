class Routes {
  Routes._();

  static const Home = Paths.homeMain;
  static const ShowCard = Paths.homeMain + Paths.showCard;
  static const Searcher = Paths.homeMain + Paths.searcher;
}

class Paths {
  Paths._();

  static const String homeMain = '/home';
  static const String showCard = '/showCard';
  static const String searcher = "/searcher";
}
