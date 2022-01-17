import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                  RatingBarWidget()
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
                    SizedBox(
                      height: 20.0,
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          ScreenshotContainer(
                              imageUrl:
                                  'https://2.bp.blogspot.com/-nHp5lIHk2hg/XQMWUkRBd0I/AAAAAAAAmDE/TM6Bcd9LJxU7ldrZ2qxEe3ZVwnXG_YyDACLcBGAs/s1600/Episodios_Fullmetal_Alchemist_Brotherhood_Sin_Relleno.jpg'),
                          ScreenshotContainer(
                              imageUrl:
                                  'https://i.ytimg.com/vi/9vx69Pe7Ncs/maxresdefault.jpg'),
                          ScreenshotContainer(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP9HqTAXiS71mbRrYzRSgo4XhJP26FSfrq9g&usqp=CAU'),
                          ScreenshotContainer(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2Gm9JA7zgJaHtcCAkhdLBiQ8QHLmP6XThGA&usqp=CAU'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: themeData.textTheme.bodyText2),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: const [
                          CharacterCard(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYUJtmo4Rn5wk3ILS5vc79HQU9DWurEmESpg&usqp=CAU',
                              name: 'Edward Elric',
                              tags: 'mainhero, cuckold'),
                          CharacterCard(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTICNhE_-z7LqKJGntfnNLfMpEjT7uh7x3kww&usqp=CAU',
                              name: 'Roi Mustang',
                              tags: 'saskesama, sussyboi'),
                          CharacterCard(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO14lj-vyPn7JlMsjC17PGVMfem3L5-M6rcw&usqp=CAU',
                              name: 'Dead Man',
                              tags: 'father'),
                          CharacterCard(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYUJtmo4Rn5wk3ILS5vc79HQU9DWurEmESpg&usqp=CAU',
                              name: 'Edward Elric',
                              tags: 'mainhero, cuckold'),
                          CharacterCard(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTICNhE_-z7LqKJGntfnNLfMpEjT7uh7x3kww&usqp=CAU',
                              name: 'Roi Mustang',
                              tags: 'saskesama, sussyboi'),
                          CharacterCard(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO14lj-vyPn7JlMsjC17PGVMfem3L5-M6rcw&usqp=CAU',
                              name: 'Dead Man',
                              tags: 'father'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text('Здесь будут ссылки. Пока не знаю в каком формате',
                        style: themeData.textTheme.bodyText2)
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar(
          initialRating: 5,
          itemSize: 28,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          ratingWidget: RatingWidget(
            full: Icon(
              Icons.star,
              color: Colors.amber,
            ),
            half: Icon(Icons.star),
            empty: Icon(Icons.star_border),
          ),
          onRatingUpdate: (newRaiting) {}),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String tags;
  const CharacterCard(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.tags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      margin: EdgeInsets.only(left: 10.0),
      width: 100,
      height: 150,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(backgroundColor: COLOR_BLACK, fontSize: 12.0),
            ),
            Text(
              tags,
              textAlign: TextAlign.center,
              style: TextStyle(backgroundColor: COLOR_BLACK, fontSize: 8.0),
            )
          ]),
    );
  }
}

class ScreenshotContainer extends StatelessWidget {
  final String imageUrl;
  const ScreenshotContainer({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10.0),
        width: 250,
        child: Image.network(imageUrl));
  }
}
