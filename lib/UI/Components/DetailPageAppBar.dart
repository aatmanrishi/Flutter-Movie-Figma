import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPageAppBar extends StatelessWidget {
  final String movieTitle;
  const DetailPageAppBar({super.key, required this.movieTitle});

  @override
  Widget build(BuildContext context) {
    return PinnedHeaderSliver(
      child: AppBar(
        leadingWidth: 30,
        leading: GestureDetector(
          onTap: Get.back,
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        ),
        title: Text(
          '${movieTitle}',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.notification_add_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.black,
      ),
    );
  }
}
