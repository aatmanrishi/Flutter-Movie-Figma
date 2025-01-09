import 'package:flutter/material.dart';

class Ratings_Time extends StatelessWidget {
  final int? rating;
  final int? totaltime;
  const Ratings_Time({super.key, this.rating, this.totaltime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  '${rating == null ? 7 : rating}',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.yellow[800],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'RATINGS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: [
            Text(
              '99%',
              style: TextStyle(
                color: const Color.fromARGB(255, 247, 7, 7),
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'ROTTEN TOMATOES',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              '${totaltime}',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'RUNTIME',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
