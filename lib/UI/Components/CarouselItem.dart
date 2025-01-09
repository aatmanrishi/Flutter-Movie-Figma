import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefigma/UI/Pages/MovieDetailPage.dart';
import '../../Modal/MovieModal.dart';
import 'package:html/parser.dart'; // We will use this to parse HTML

class customCarouselItem extends StatelessWidget {
  final movieDataModal movieData;

  const customCarouselItem({super.key, required this.movieData});
  String removeHtmlTags(String htmlText) {
    final document = parse(htmlText); // Parse the HTML string
    return document.body?.text ?? ''; // Extract plain text from the body
  }

  @override
  Widget build(BuildContext context) {
    String summaryText = removeHtmlTags(movieData.show!.summary ?? "");

    return GestureDetector(
      onTap: () {
        Get.to(MovieDetailScreen(movieData: movieData));
      },
      child: Container(
        padding: EdgeInsets.all(0),
        height: double.maxFinite,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('${movieData.show!.image!.medium}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 22, 22),
                    boxShadow: [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          blurRadius: 15,
                          spreadRadius: 20,
                          offset: Offset(0, -5),
                          color: Color.fromARGB(255, 22, 22, 22))
                    ]),
                padding:
                    EdgeInsets.only(top: 20, left: 10, bottom: 10, right: 50),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${movieData.show!.name!.toUpperCase()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      summaryText,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 253, 250, 250),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
