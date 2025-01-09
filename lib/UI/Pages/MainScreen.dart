import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefigma/UI/Pages/HomePage.dart';
import 'package:moviefigma/UI/Pages/Trending.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../Controller/mainController.dart';
import 'Kids.dart';
import 'SearchPage.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();
    final controller = mainController.persistentTabController.value;

    // Function to handle tab clicks
    void handleTabClick() {
      mainController.TextFieldClicked.value = false;
    }

    List<Widget> screens() {
      return [
        HomeScreen(),
        TrendingScreen(),
        SearchScreen(),
        KidsScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> bottomNavigationbarItems() {
      return [
        // Home
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          activeColorSecondary: Colors.red,
          activeColorPrimary: Colors.transparent,
          inactiveColorPrimary: Colors.white,
        ),
        // Trending Screen
        PersistentBottomNavBarItem(
          icon: Icon(Icons.missed_video_call),
          activeColorSecondary: Colors.red,
          activeColorPrimary: Colors.transparent,
          inactiveColorPrimary: Colors.white,
        ),
        // SearchScreen
        PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          activeColorSecondary: Colors.red,
          activeColorPrimary: Colors.transparent,
          inactiveColorPrimary: Colors.white,
        ),
        // Kids Screen
        PersistentBottomNavBarItem(
          icon: Icon(Icons.face_retouching_natural_sharp),
          activeColorSecondary: Colors.red,
          activeColorPrimary: Colors.transparent,
          inactiveColorPrimary: Colors.white,
        ),
      ];
    }

    return Obx(() {
      if (mainController.homePageLoader.value == true) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      } else {
        return PersistentTabView(
          backgroundColor: Colors.black,
          context,
          screens: screens(),
          controller: controller,
          items: bottomNavigationbarItems(),
          navBarStyle: NavBarStyle.style6, // Set the navBarStyle to style6
          onItemSelected: (index) {
            // Handle tab click here

            mainController.searchedData.clear();
            mainController.textController.value.clear();
            handleTabClick(); // Pass the index to the function
          },
        );
      }
    });
  }
}
