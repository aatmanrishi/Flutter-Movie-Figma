import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefigma/UI/Components/CustomAppBar.dart';
import 'package:moviefigma/UI/Components/MovieCard.dart';
import '../../Controller/mainController.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: mainController.serachLoader.value == true
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : CustomScrollView(
                slivers: [
                  PinnedHeaderSliver(
                    child: CustomAppBar(
                      isEnabled: true,
                    ),
                  ),
                  Obx(() {
                    // Handling logic inside a single Obx
                    if (mainController.TextFieldClicked.value == false) {
                      // Main controller state is false
                      // ignore: invalid_use_of_protected_member
                      return mainController.searchedData.value.isNotEmpty
                          ? SliverList(
                              delegate: SliverChildListDelegate([
                                SizedBox(height: 20),
                                Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  runSpacing: 10,
                                  // ignore: invalid_use_of_protected_member
                                  children: (mainController.searchedData.value)
                                      .map((movieData) {
                                    return MovieCard(
                                      movieData: movieData,
                                    );
                                  }).toList(),
                                ),
                              ]),
                            )
                          : SliverList(
                              delegate: SliverChildListDelegate([
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 15, bottom: 10, top: 20),
                                  child: Text(
                                    'Most Searched',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  runSpacing: 10,
                                  children: (mainController.categories
                                              // ignore: invalid_use_of_protected_member
                                              .value["Recent&Searched"]?.value ??
                                          [])
                                      .map((movieData) {
                                    return MovieCard(
                                      movieData: movieData,
                                    );
                                  }).toList(),
                                ),
                              ]),
                            );
                    } else {
                      // When TextFieldClicked is true
                      return SliverToBoxAdapter(child: SizedBox());
                    }
                  }),
                ],
              ),
      ),
    );
  }
}
