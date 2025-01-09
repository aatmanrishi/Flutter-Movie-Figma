import 'package:flutter/material.dart';

class ExtendedButtons extends StatelessWidget {
  final double L;
  final double T;
  final double R;
  final double B;
  final String yourtext;
  final Color yourbackColor;
  final Color yourtextColor;
  const ExtendedButtons(
      {super.key,
      required this.yourtext,
      required this.yourbackColor,
      required this.yourtextColor,
      required this.L,
      required this.T,
      required this.R,
      required this.B});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(L, T, R, B),
      height: 30,
      width: MediaQuery.of(context).size.width * 0.9,
      color: yourbackColor,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
      child: Center(
        child: Text(
          '$yourtext',
          style: TextStyle(color: yourtextColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
