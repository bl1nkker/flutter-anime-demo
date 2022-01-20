import 'package:flutter/cupertino.dart';
import 'package:flutter_anime_demo/models/anime_model.dart';

class AppStateManager extends ChangeNotifier {
  List<AnimeModel> _animeItems = <AnimeModel>[];
  int _selectedIndex = -1;

  List<AnimeModel> get animeItems => List.unmodifiable(_animeItems);
  int get selectedIndex => _selectedIndex;
  AnimeModel? get selectedMovieItem =>
      selectedIndex != -1 ? _animeItems[selectedIndex] : null;

  void getAnimeItems() {
    // TODO: Retrieve data here
    _animeItems = [];
    print('Retrieving data...');
    notifyListeners();
  }

  void getMoreItems(int page) {
    // TODO: Retrieve more data
    _animeItems = [];
    print('Retrieving more data...');
    notifyListeners();
  }

  void setSelectedMovieItem(String animeId) {
    final index = _animeItems.indexWhere((anime) => anime.id == animeId);
    print('Selecting movie item...');
    notifyListeners();
  }
}
