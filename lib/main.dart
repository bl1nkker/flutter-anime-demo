import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/navigation/app_router.dart';
import 'package:flutter_anime_demo/provider/app_state_manager.dart';
import 'package:flutter_anime_demo/screens/landing_screen.dart';
import 'package:flutter_anime_demo/utils/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:provider/provider.dart';

void main() async {
  await DotEnv.dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppStateManager _appStateManager = AppStateManager();
  late AppRouter _appRouter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width of our device
    double screenWidth = window.physicalSize.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateManager)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: COLOR_WHITE,
          accentColor: COLOR_DARK_BLUE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          // TODO: Add font here
        ),
        home: Router(
          backButtonDispatcher: RootBackButtonDispatcher(),
          routerDelegate: _appRouter,
        ),
      ),
    );
  }
}
