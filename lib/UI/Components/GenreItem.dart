import 'package:flutter/material.dart';

class GenreItems extends StatelessWidget {
  final List<String> genreArray; // Accept genreArray as a parameter

  const GenreItems(
      {super.key,
      required this.genreArray}); // Add required keyword to constructor

  @override
  Widget build(BuildContext context) {
    // Check if genreArray is empty, if so, return a SizedBox or some other widget.
    if (genreArray.isEmpty) {
      return SizedBox(); // Or you can return an empty container or text widget to indicate no genres
    } else {
      return Row(
        // spacing: 8.0, // Spacing between genres
        // runSpacing: 4.0, // Spacing between rows
        children: genreArray.map((genre) {
          return Container(
            margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
            padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 3.5),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                '$genre',
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis, // To handle overflow text
              ),
            ),
          );
        }).toList(),
      );
    }
  }
}
