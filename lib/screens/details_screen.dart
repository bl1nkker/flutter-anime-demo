import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/custom/border_box.dart';
import 'package:flutter_anime_demo/utils/constants.dart';
import 'package:flutter_anime_demo/widgets/details_panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic itemData;

  const DetailsScreen({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PanelController panelController = PanelController();
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
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
                    itemData['image'],
                  ),
                  // alignment: Alignment(-.7, 0),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      const BorderBox(
                        // TODO: Work with colors
                        child: Icon(Icons.bookmark_add, color: COLOR_BLACK),
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                // ClipRRect(
                //   // borderRadius: BorderRadius.circular(30),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height * .3,
                //     padding:
                //         EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                //     decoration: BoxDecoration(
                //         gradient:
                //             LinearGradient(begin: Alignment.bottomRight, colors: [
                //       Colors.black.withOpacity(1),
                //       // Colors.black.withOpacity(.3),
                //       Colors.black.withOpacity(.6),
                //     ])),
                //     child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 'Hello world',
                //                 style: themeData.textTheme.headline3,
                //               ),
                //               Text(
                //                 'Rating Bar',
                //                 style: themeData.textTheme.headline3,
                //               )
                //             ],
                //           ),
                //           const SizedBox(
                //             height: 10.0,
                //           ),
                //           Text(
                //               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                //               style: themeData.textTheme.bodyText2),
                //         ]),
                //   ),
                // )
              ],
            )),
      ),
    );
  }
}
