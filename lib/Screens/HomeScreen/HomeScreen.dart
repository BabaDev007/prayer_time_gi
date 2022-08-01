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
import 'package:get_storage/get_storage.dart';
import 'package:auto_size_text/auto_size_text.dart';
class HomeScreen extends StatefulWidget  {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  var zor;
GetStorage box = GetStorage();
  Future<bool> showExitPopup() async {
    return await Get.defaultDialog(
      titleStyle: TextStyle(fontFamily: "Oswald"),
      middleTextStyle: TextStyle(fontFamily: "Oswald"),
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
  void initState() {
    zor = box.read("time");

    // TODO: implement initState
    super.initState();
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
       title: Obx(() => FittedBox(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Icon(FontAwesomeIcons.location),

             Padding(
               padding: const EdgeInsets.only(left: 8.0),
               child: Text(
                 "${zor['${c
                     .difference}']["cityOfName"]}" == "Baku (Baki)" ? "Bakı" : "${zor['${c
                     .difference}']["cityOfName"]}", overflow: TextOverflow.fade,

                 style: TextStyle(color: Colors.white, fontSize: 15,
                     fontFamily: "Oswald"),),
             ),
           ],
         ),
       ),) ,

              // Icon(Icons.mosque_outlined),

       actions: [
         IconButton(icon: Icon(Icons.chevron_left, size: 30,), onPressed: () { c.lastDay(); },),

         IconButton(icon: Icon(Icons.chevron_right, size: 30,), onPressed: () { c.nextDay(); },),

        // IconButton(icon: Icon(FontAwesomeIcons.kaaba, size: 18 ,), onPressed: () {  Navigator.push(context, SizeTransition2(QiblahCompass())); },),

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