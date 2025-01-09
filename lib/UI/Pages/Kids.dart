// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefigma/UI/Components/CarouselSlider.dart';
import 'package:moviefigma/UI/Components/CustomAppBar.dart';
import 'package:moviefigma/UI/Components/MovieTypeSection.dart';

import '../../Controller/mainController.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});

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
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: MyCarouselSlider(
                    // Using .value to access the list inside the RxList
                    moviesData:
                        // ignore: 
                        mainController.categories.value["Kids"]?.value ?? []),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              // Using .value to access the list inside the RxList
              MovieType(
                  moviesData:
                      // ignore: 
                      mainController.categories.value["Cartoon"]?.value ?? [],
                  category: 'Cartoon'),
              MovieType(
                  // ignore: 
                  moviesData: mainController.categories.value["3d"]?.value ?? [],
                  category: '3d Animation'),
              MovieType(
                  moviesData:
                      mainController.categories.value["DreamWorks"]?.value ?? [],
                  category: 'DreamWorks'),
              MovieType(
                  moviesData:
                      mainController.categories.value["Anime"]?.value ?? [],
                  category: 'Anime'),
              MovieType(
                  moviesData:
                      mainController.categories.value["Disneys"]?.value ?? [],
                  category: 'Disney'),
            ])),
          ],
        ),
      ),
    );
  }
}
