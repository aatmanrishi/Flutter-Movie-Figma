import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefigma/Controller/mainController.dart';
import 'package:moviefigma/UI/Components/MovieCard.dart';

class MovieType extends StatelessWidget {
  final double? cardMargin;
  final List moviesData;
  final String category;
  const MovieType({
    super.key,
    required this.moviesData,
    required this.category,
    this.cardMargin,
  });

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$category',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Icon(
                Icons.more_vert_outlined,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 220,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: moviesData.map((movieData) {
              return MovieCard(movieData: movieData);
            }).toList()),
          ),
        )
      ],
    );
  }
}
