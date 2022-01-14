import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/utils/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsPanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  const DetailsPanelWidget(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

  void togglePanel() {
    if (panelController.isPanelOpen) {
      panelController.close();
    } else {
      panelController.open();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ClipRRect(
      // borderRadius: BorderRadius.circular(30),
      child: Container(
          height: MediaQuery.of(context).size.height * .3,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(1),
                // Colors.black.withOpacity(.3),
                Colors.black.withOpacity(.6),
              ])),
          child: Column(
            children: [
              GestureDetector(
                onTap: togglePanel,
                child: Container(
                  width: 50,
                  height: 8,
                  decoration: BoxDecoration(
                      color: COLOR_WHITE,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello world',
                    style: themeData.textTheme.headline3,
                  ),
                  Text(
                    'Rating Bar',
                    style: themeData.textTheme.headline3,
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView(
                  controller: controller,
                  children: [
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: themeData.textTheme.bodyText2),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: themeData.textTheme.bodyText2),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: themeData.textTheme.bodyText2),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: themeData.textTheme.bodyText2),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: themeData.textTheme.bodyText2),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: themeData.textTheme.bodyText2),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
