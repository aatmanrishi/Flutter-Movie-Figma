import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/mainController.dart';

class CustomAppBar extends StatelessWidget {
  final bool? isEnabled;
  const CustomAppBar({super.key, this.isEnabled});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display 'Movie Figma' title if isEnabled is null or false
          if (isEnabled == null || isEnabled == false)
            Text(
              'Movie Figma',
              style: TextStyle(
                  color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          SizedBox(height: 10),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() {
              // Use the TextFieldClicked value to control the state
              return TextField(
                controller: mainController.textController.value,
                onTap: () {
                  mainController.TextFieldClicked.value =
                      true; // Fix assignment
                },
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: InkWell(
                    onTap: () async {
                      if (mainController.textController.value.text.isEmpty) {
                      } else {
                        mainController.serachLoader.value = true;
                        await mainController.getData();
                        mainController.handleSearchClick();
                      }
                    },
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                  // Conditionally display suffixIcon based on TextFieldClicked value
                  suffixIcon: mainController.TextFieldClicked.value ||
                          mainController.searchedData.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            mainController.TextFieldClicked.value = false;
                            mainController.textController.value.clear();
                            if (mainController.searchedData.isNotEmpty) {
                              mainController.searchedData.clear();
                            }
                          },
                          child:
                              Icon(Icons.cancel_outlined, color: Colors.white))
                      : null,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              );
            }),
          ),
        ],
      ),
    );
  }
}
