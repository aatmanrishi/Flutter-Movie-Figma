import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:moviefigma/Modal/MovieModal.dart';
import 'package:moviefigma/UI/Components/DetailPageAppBar.dart';
import 'package:moviefigma/UI/Components/ExtendedButtons.dart';
import 'package:moviefigma/UI/Components/GenreItem.dart';
import 'package:moviefigma/UI/Components/MovieTypeSection.dart';
import 'package:moviefigma/UI/Components/Ratings&Time.dart';
import 'package:moviefigma/UI/Components/ReactionContainer.dart';
import '../../Controller/mainController.dart';

class MovieDetailScreen extends StatelessWidget {
  final movieDataModal movieData;
  const MovieDetailScreen({super.key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    String removeHtmlTags(String htmlText) {
      final document = parse(htmlText);
      return document.body?.text ?? '';
    }

    String summaryText = removeHtmlTags(movieData.show!.summary ?? "");
    final mainController = Get.find<MainController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            DetailPageAppBar(movieTitle: movieData.show!.name!),
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.82,
              backgroundColor: const Color.fromARGB(255, 12, 12, 12),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${movieData.show!.image!.medium}'),
                              fit: BoxFit.cover)),
                    ),
                    Ratings_Time(
                      rating: movieData.show!.rating == null
                          ? 7
                          : movieData.show!.rating!.average,
                      totaltime: movieData.show!.runtime == null
                          ? 60
                          : movieData.show!.runtime,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: GenreItems(genreArray: movieData.show!.genres!),
                    ),
                    Container(
                        constraints: BoxConstraints(maxHeight: 100),
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.only(left: 10),
                        child: SingleChildScrollView(
                          child: Text(
                            '${summaryText}',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ReactionContainer(myIcons: [
                      Icons.add,
                      Icons.thumb_up_alt_outlined,
                      Icons.thumb_down_off_alt,
                      Icons.share
                    ]),
                    ExtendedButtons(
                        yourtext: 'PLAY',
                        yourbackColor: Colors.red,
                        yourtextColor: Colors.white,
                        L: 10,
                        T: 20,
                        R: 10,
                        B: 5),
                    ExtendedButtons(
                        yourtext: 'DOWNLOAD',
                        yourbackColor: Colors.white,
                        yourtextColor: Colors.black,
                        L: 10,
                        T: 5,
                        R: 10,
                        B: 20),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              MovieType(
                  moviesData:
                      // ignore: invalid_use_of_protected_member
                      mainController.categories.value["Popular"]?.value ?? [],
                  category: 'Popular'),
              SizedBox(
                height: 10,
              ),
              MovieType(
                  moviesData:
                      // ignore: invalid_use_of_protected_member
                      mainController.categories.value["Trending"]?.value ?? [],
                  category: 'Trending'),
              SizedBox(
                height: 10,
              ),
              MovieType(
                  moviesData:
                      // ignore: invalid_use_of_protected_member
                      mainController.categories.value["Action"]?.value ?? [],
                  category: 'Action'),
            ]))
          ],
        ),
      ),
    );
  }
}
