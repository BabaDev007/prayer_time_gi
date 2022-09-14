
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/HomeScreen.dart';
import '../../../Constants.dart';
import '../../MenuPages/Quran/screens/home.dart';
import '../../Settings/SettingPage.dart';
import 'Day/DaylyBugs.dart';

class PageViewPage extends StatefulWidget {

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  Future<bool> showExitPopup() async {
    return await Get.defaultDialog(

        title: "Çıxış",
        middleText: "Çıxış et",
        textCancel: "Xeyr",
        textConfirm: "Bəli",
        onConfirm: (){
          exit(0);
        },
        onCancel: (){
          Get.back(result: false);
        }
    )??false; //if showDialouge had returned null, then return false
  }
  var _controller = PageController();
  var currentIndex = 0;
  var listOfIcons = [
    "assets/clock.png",
    "assets/calendar.png",
    "assets/quran.png",
    "assets/setting.png",
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        bottomNavigationBar: Container(
          height: Get.height * .065,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                    currentIndex = index;
                    switch(currentIndex){
                      case 0: _controller.jumpToPage(0);
                      break;
                      case 1: _controller.jumpToPage(1);
                      break;
                      case 2: _controller.jumpToPage(2);
                      break;
                      case 3: _controller.jumpToPage(3);
                    }
                  },
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : Get.width * .029,
                      right: Get.width * .0422,
                      left: Get.width * .0422,
                    ),
                    width: Get.width * .128,
                    height: index == currentIndex ? Get.width * .014 : 0,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Image.asset(
                    listOfIcons[index],
                    width: Get.width * .076,
                    height: Get.height * .037,
                    color: index == currentIndex
                        ? Constants.primaryColor
                        : Colors.black38,
                  ),
                  SizedBox(height: Get.width * .03),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
         physics: NeverScrollableScrollPhysics(),
          controller: _controller ,
          children: [
            HomeScreen(),
            Day(),
            QuranPage(),
            SettingsPage()

          ],
        ),
      ),
    );
  }
}
