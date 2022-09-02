import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/HomeScreenBody/HomeScreenBody.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Constants.dart';
import '../../PageTransition/PageTransition.dart';
import '../../StateManagement/StateManagement.dart';
import '../MenuPages/DataTable/DataTable.dart';

import 'DraverPage.dart';
import 'package:get_storage/get_storage.dart';
class HomeScreen extends StatefulWidget  {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  var zor;
GetStorage box = GetStorage();

  final Controller c = Get.put(Controller());

  var date = "data";
  List months =
  ['Yanvar', 'Fevral', 'Mart', 'Aprel', 'May','İyun','İyul','Avqust','Sentyabr','Oktyabr','Noyabr','Dekabr'];
  List weekday = ["Bzr. ertəsi", "Çər. axşamı", "Çərşənbə", "Cümə axşamı", "Cümə", "Şənbə", "Bazar"];
  @override
  void initState() {
    zor = box.read("time");
    date =  "${zor['${c
        .difference}']['baseTime']["todayHijrahDate"]}";
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: DrawerPage(),
      extendBodyBehindAppBar: true,

      backgroundColor:  Constants.primaryColor.withOpacity(.1),
     appBar: AppBar(
       centerTitle: true,
       title:   SvgPicture.asset("assets/svgmosque.svg", width: Get.height/22, ),
       actions: [

         IconButton(onPressed: (){
           Navigator.push(context, SizeTransition2(DataTable1()));
         }, icon: Icon(Icons.calendar_month, )),
         IconButton(onPressed: (){}, icon: Icon(Icons.settings_sharp, )),
       ],

    //    title: FittedBox(
    //      child: Row(
    //        mainAxisAlignment: MainAxisAlignment.center,
    //        crossAxisAlignment: CrossAxisAlignment.center,
    //        children: [
    //          Icon(FontAwesomeIcons.mapLocation, size: 14,),
    //
    //          Padding(
    //            padding: const EdgeInsets.only(left: 8.0),
    //            child: Text(
    //              "${box.read("nameofcity")}",
    //              // "${zor['${c
    //              //     .difference}']["cityOfName"]}" == "Baku (Baki)" ? "Bakı" : "${zor['${c
    //              //     .difference}']["cityOfName"]}", overflow: TextOverflow.fade,
    //
    //              style: TextStyle(color: Colors.white, fontSize: 15,
    //                  fontFamily: "Oswald"),),
    //          ),
    //        ],
    //      ),
    //    ),
    //
    //           // Icon(Icons.mosque_outlined),
    //
    //    actions: [
    //
    //
    //      Container(
    //        padding: EdgeInsets.all(5),
    //        decoration: BoxDecoration(
    //          borderRadius: BorderRadius.circular(20),
    //          border: Border.all(color: Colors.white70)
    //        ),
    //        child: Column(
    //          mainAxisSize: MainAxisSize.min,
    //          mainAxisAlignment: MainAxisAlignment.center,
    //          crossAxisAlignment: CrossAxisAlignment.center,
    //          children: [
    //
    //
    //
    //               Text("${DateTime.parse("${zor['${c
    //                .difference}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor['${c
    //     .difference}']['baseTime']["todayDate"]}").month - 1]}, ${weekday[DateTime.parse("${zor['${c
    //     .difference}']['baseTime']["todayDate"]}").weekday - 1]}",
    //
    // style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 14, color: Colors.white, fontFamily: "Oswald") ) ,
    //             Text(
    //
    //              "${"${zor['${c
    //                  .difference}']['baseTime']["todayHijrahDate"]}".capitalize}",
    //              maxLines: 1,
    //
    //
    //              style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 13, color: Colors.white70,fontFamily: "Oswald" )
    //                  ),
    //
    //          ],
    //        ),
    //      ),
    //      // IconButton(icon: Icon(Icons.chevron_left, size: 30,), onPressed: () { c.lastDay(); },),
    //      //
    //      // IconButton(icon: Icon(Icons.chevron_right, size: 30,), onPressed: () { c.nextDay(); },),
    //
    //     // IconButton(icon: Icon(FontAwesomeIcons.kaaba, size: 18 ,), onPressed: () {  Navigator.push(context, SizeTransition2(QiblahCompass())); },),
    //
    //     SizedBox(width: 15,)
    //    ],
       elevation: 0,
       backgroundColor: Colors.transparent
       ,
     ),
     body: Body()
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