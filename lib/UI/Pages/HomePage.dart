import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefigma/Controller/mainController.dart';
import 'package:moviefigma/UI/Components/CarouselSlider.dart';
import 'package:moviefigma/UI/Components/CustomAppBar.dart';
import 'package:moviefigma/UI/Components/MovieTypeSection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: mainController.homePageLoader.value==true? Center(child: CircularProgressIndicator(color: Colors.red,),):CustomScrollView(
          slivers: [
            // Pinned Header for AppBar
            PinnedHeaderSliver(child: CustomAppBar()),
      
            // Carousel Section - SliverAppBar
            Obx(() {
              if (mainController.TextFieldClicked.value == false) {
                return SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: MediaQuery.of(context).size.height * 0.78,
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            'All TV Shows & Movies',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // ignore: invalid_use_of_protected_member
                            child: MyCarouselSlider(
                                moviesData: mainController
                                    // ignore: invalid_use_of_protected_member
                                    .categories.value["All"]!.value),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SliverToBoxAdapter(child: SizedBox());
              }
            }),
      
            // SliverList for Categories
            Obx(() {
              if (mainController.homePageLoader.value) {
                // Show a loading indicator while data is being fetched
                return SliverList(
                  delegate: SliverChildListDelegate([
                    Center(child: CircularProgressIndicator()),
                  ]),
                );
              } else if (mainController.TextFieldClicked.value == true) {
                // Return an empty SliverList when TextFieldClicked is true
                return SliverList(
                  delegate: SliverChildListDelegate([]),
                );
              } else {
                // Return the list of categories
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final key =
                          // ignore: invalid_use_of_protected_member
                          mainController.categories.value.keys.elementAt(index);
      
                      // Skip certain categories (like 'Anime', 'Disney', etc.)
                      if (key == 'All' ||
                          key == 'Anime' ||
                          key == 'Disneys' ||
                          key == 'Popular' ||
                          key == 'Animated' ||
                          key == 'DreamWorks' ||
                          key == 'Kids' ||
                          key == '3d' ||
                          key == 'Recent&Searched') {
                        return SizedBox(); // Skip these categories
                      } else {
                        return MovieType(
                          // ignore: invalid_use_of_protected_member
                          moviesData: mainController.categories.value[key]!.value,
                          category: key.toUpperCase(),
                        );
                      }
                    },
                    // ignore: invalid_use_of_protected_member
                    childCount: mainController.categories.value.keys.length,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
