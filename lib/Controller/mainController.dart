import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:moviefigma/Modal/MovieModal.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainController extends GetxController {
  RxBool serachLoader = false.obs;
  Rx<PersistentTabController> persistentTabController =
      PersistentTabController(initialIndex: 0).obs;
  Rx<TextEditingController> textController = TextEditingController().obs;
  RxBool TextFieldClicked = false.obs;
  RxBool homePageLoader = false.obs;
  RxMap<String, RxList> categories = {
    'All': <dynamic>[].obs,
    'Popular': <dynamic>[].obs,
    'Trending': <dynamic>[].obs,
    'Action': <dynamic>[].obs,
    'Scifi': <dynamic>[].obs,
    'Adventure': <dynamic>[].obs,
    'Mystery': <dynamic>[].obs,
    'Horror': <dynamic>[].obs,
    'Drama': <dynamic>[].obs,
    'Love': <dynamic>[].obs,
    'Disneys': <dynamic>[].obs,
    'Cartoon': <dynamic>[].obs,
    'Anime': <dynamic>[].obs,
    'DreamWorks': <dynamic>[].obs,
    'Kids': <dynamic>[].obs,
    'Recent&Searched': <dynamic>[].obs,
    '3d': <dynamic>[].obs,
  }.obs;

  RxList searchedData = [].obs;

  RxMap<String, dynamic>? movieData;
  void handleSearchClick() {
    if (persistentTabController.value.index != 2) {
      persistentTabController.value
          .jumpToTab(2); // Navigate to the Search Screen (index 2)
    }
  }

  @override
  void onInit() {
    super.onInit();
    initialFunction();
  }

  initialFunction() async {
    homePageLoader.value = true;

    List<Future> fetchDataFutures = [];
    for (String key in categories.keys) {
      fetchDataFutures.add(getData(key));
    }
    await Future.wait(fetchDataFutures);
    homePageLoader.value = false;
  }

  Future getData([String? category]) async {
    final url = Uri.parse(textController.value.text.isBlank == true
        ? 'https://api.tvmaze.com/search/shows?q=${category?.toLowerCase()}'
        : 'https://api.tvmaze.com/search/shows?q=${textController.value.text.toLowerCase()}');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);

        List<dynamic> showDataList = [];
        for (var item in responseData) {
          var show = item['show'];

          if (show != null) {
            showDataList.add(movieDataModal.fromJson(item));
          }
        }

        if (textController.value.text.isBlank != true &&
            serachLoader.value == true) {
          searchedData.clear();
          print('Searched Data is here - $showDataList');
          searchedData.assignAll(showDataList);
          TextFieldClicked.value = false;
          serachLoader.value = false;
        } else {
          categories[category]?.assignAll(showDataList);
          print(category);
          print(showDataList);
        }
      } else {
        throw Exception('Failed to load data for category: $category');
      }
    } catch (e) {
      print('Error while fetching data for $category: $e');
    }
  }
}
