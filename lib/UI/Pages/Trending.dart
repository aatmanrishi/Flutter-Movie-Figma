import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefigma/UI/Components/CustomAppBar.dart';
import 'package:moviefigma/UI/Components/MovieCard.dart';

import '../../Controller/mainController.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            PinnedHeaderSliver(
              child: CustomAppBar(),
            ),
            Obx(() {
              if (mainController.TextFieldClicked.value == false) {
                return SliverList(
                    delegate: SliverChildListDelegate([
                  // Popular Section
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // ignore: invalid_use_of_protected_member
                          ...mainController.categories.value['Popular']
                                  ?.map((movieData) {
                                return MovieCard(
                                  movieData: movieData,
                                );
                              }).toList() ??
                              []
                        ],
                      ),
                    ),
                  ),
                  // Trending Section
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Trending',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 5,
                    spacing: 5,
                    children: [
                      // ignore: invalid_use_of_protected_member
                      ...mainController.categories.value['Trending']
                              ?.map((movieData) {
                            return MovieCard(
                              customMargin: 5,
                              movieData: movieData,
                            );
                          }).toList() ??
                          []
                    ],
                  ),
                ]));
              } else {
                // Return an empty SliverToBoxAdapter if TextFieldClicked is true
                return SliverToBoxAdapter(
                  child: SizedBox(),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
