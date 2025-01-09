import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefigma/Modal/MovieModal.dart';
import 'package:moviefigma/UI/Pages/MovieDetailPage.dart';

class MovieCard extends StatelessWidget {
  final double? customMargin;
  final movieDataModal movieData;

  const MovieCard({
    super.key,
    required this.movieData,
    this.customMargin,
  });

  // Method to trim the movie name if it's longer than 8 characters and add "..."
  String trimMovieName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Unknown Title'; // Return 'Unknown Title' if name is null or empty
    }

    // If the name is greater than 8 characters, trim it and add "..."
    if (name.length > 8) {
      return name.substring(0, 10) + '...';
    }

    // If the name is 8 characters or less, return it as is
    return name;
  }

  @override
  Widget build(BuildContext context) {
    // Null check for movieData.show and movieData.show.name
    print(
        'Print movie data in MovieCard: ${movieData.show?.name ?? 'Unknown Movie'}');

    // Null check for the image and determine fallback
    String imageUrl = '';
    if (movieData.show?.image?.medium != null) {
      imageUrl = movieData.show!.image!.medium!;
    } else if (movieData.show?.image?.original != null) {
      imageUrl = movieData.show!.image!.original!;
    }

    // If both medium and original are null, return SizedBox instead of MovieCard widget
    if (imageUrl.isEmpty) {
      return SizedBox(); // If no image URL is available, return an empty widget
    }

    return movieData.show == null
        ? SizedBox() // If no show data, return an empty widget
        : movieData.show?.name == null
            ? SizedBox() // If show has no name, return an empty widget
            : GestureDetector(
                onTap: () {
                  Get.to(MovieDetailScreen(movieData: movieData));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: customMargin == null ? 15 : customMargin!),
                  child: Column(
                    children: [
                      // Display movie image with null checks for medium and original
                      Container(
                        height: 180,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Display movie title with null check for show.name and word trimming
                      Text(
                        trimMovieName(movieData.show!.name), // Trim the name
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
  }
}
