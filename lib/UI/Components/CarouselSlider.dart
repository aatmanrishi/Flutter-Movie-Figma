import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/mainController.dart';
import 'CarouselItem.dart';

class MyCarouselSlider extends StatelessWidget {
  final List moviesData;
  const MyCarouselSlider({super.key, required this.moviesData});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();

    return CarouselSlider(
      items: moviesData.where((movie) {
        // Condition to check for valid movie name and at least one valid image URL (medium or original)
        return movie.show?.name?.isNotEmpty == true &&
            (movie.show?.image?.medium?.isNotEmpty == true ||
                movie.show?.image?.original?.isNotEmpty == true);
      }).map<Widget>((movie) {
        return customCarouselItem(
            movieData: movie); // Correctly passing movieData
      }).toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.68,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        // onPageChanged: callbackFunction, // You can use this to track page changes
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
