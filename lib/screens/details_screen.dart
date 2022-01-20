import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/models/anime_model.dart';
import 'package:flutter_anime_demo/utils/constants.dart';
import 'package:flutter_anime_demo/widgets/border_box.dart';
import 'package:flutter_anime_demo/widgets/details_panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsScreen extends StatelessWidget {
  static MaterialPage page({required AnimeModel anime, int index = -1}) {
    return MaterialPage(child: DetailsScreen(itemData: anime));
  }

  final AnimeModel itemData;

  const DetailsScreen({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PanelController panelController = PanelController();
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          controller: panelController,
          // backdropColor: Colors.red.withAlpha(1),
          color: Colors.transparent,
          minHeight: 200,
          // maxHeight: 300,
          parallaxEnabled: true,
          parallaxOffset: .1,

          panelBuilder: (controller) => DetailsPanelWidget(
              controller: controller, panelController: panelController),
          body: Container(
              // TODO: Change content padding value to constant

              height: 250,
              decoration: BoxDecoration(
                // TODO: Set default image color
                color: Colors.greenAccent,
                image: DecorationImage(
                    image: AssetImage(
                      itemData.imageUrl,
                    ),
                    // alignment: Alignment(-.7, 0),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios_sharp,
                                // TODO: Work with colors
                                color: COLOR_WHITE),
                          ),
                        ),
                        BorderBox(
                          onTap: () {},
                          // TODO: Work with colors
                          child: Icon(Icons.bookmark_add, color: COLOR_BLACK),
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
