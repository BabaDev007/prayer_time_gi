import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/HomeScreenBody/HomeScreenBody.dart';
import '../../Constants.dart';
import '../../PageTransition/PageTransition.dart';
import '../../StateManagement/StateManagement.dart';
import '../MenuPages/KompassScreen/qiblah_compass.dart';
import '../Settings/SettingPage.dart';
import 'DraverPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget  {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{


  Future<bool> showExitPopup() async {
    return await Get.defaultDialog(
      title: "Çıxış",
      middleText: "Çıxış etməkdə əminsiniz",
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


  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return WillPopScope(
        onWillPop: showExitPopup,
    child:  Scaffold(

      drawer: DrawerPage(),
      extendBodyBehindAppBar: true,

      backgroundColor:  Constants.primaryColor,
     appBar: AppBar(
       title: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           IconButton(icon: Icon(Icons.chevron_left, size: 35,), onPressed: () { c.lastDay(); },),
           Icon(Icons.mosque_outlined),
           IconButton(icon: Icon(Icons.chevron_right, size: 35,), onPressed: () { c.nextDay(); },),

         ],
       ),

       centerTitle: true,
       actions: [


         IconButton(icon: Icon(FontAwesomeIcons.kaaba, size: 18 ,), onPressed: () {  Navigator.push(context, SizeTransition2(QiblahCompass())); },),

         IconButton(onPressed: (
             ){
           Navigator.push(context, SizeTransition2(SettingsPage()));
         }, icon: const Icon(Icons.settings,) ),
       ],
       elevation: 0,
       backgroundColor: Colors.transparent,
     ),
     body: Body()
       )
    );


  }
}


















// GestureDetector(
//     onTap: (){
//
//
//       Get.isDarkMode ?   controller.animateTo(0) :  controller.animateTo(0.5);
//       ThemeService().changeThemeMode();
//     },
//     child: Lottie.asset(
//       frameRate: FrameRate.max ,
//
//         Constants().lottieasset, controller: controller,
//
//
//
//     )),