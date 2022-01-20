import 'package:flutter/cupertino.dart';
import 'package:flutter_anime_demo/data/sample_data.dart';
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
    for (dynamic obj in RE_DATA) {
      AnimeModel animeModel = AnimeModel(
          id: obj['id'].toString(),
          imageUrl: obj['image'],
          overview: obj['description'],
          rating: 4.5,
          title: 'Hello World');
      _animeItems.add(animeModel);
    }
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
