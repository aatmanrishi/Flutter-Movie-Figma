import 'package:flutter/material.dart';

class ReactionContainer extends StatelessWidget {
  final List<IconData> myIcons;
  const ReactionContainer({super.key, required this.myIcons});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: myIcons.map((myIcon) {
          return Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2)),
            child: Center(
              child: Icon(
                myIcon,
                size: 20,
                color: Colors.white,
              ),
            ),
          );
        }).toList());
  }
}
