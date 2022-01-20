import 'package:flutter/cupertino.dart';
import 'package:flutter_anime_demo/provider/app_state_manager.dart';
import 'package:flutter_anime_demo/screens/details_screen.dart';
import 'package:flutter_anime_demo/screens/landing_screen.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager appStateManager;

  AppRouter({required this.appStateManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    appStateManager.removeListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(key: navigatorKey, onPopPage: _handlePopPage, pages: [
      if (appStateManager.selectedIndex != -1)
        DetailsScreen.page(
            anime: appStateManager.selectedMovieItem!,
            index: appStateManager.selectedIndex)
      else
        LandingScreen.page()
    ]);
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
