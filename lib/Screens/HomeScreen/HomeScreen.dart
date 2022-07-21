import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';
import '../../PageTransition/PageTransition.dart';
import '../../StateManagement/StateManagement.dart';
import '../Settings/SettingPage.dart';
import 'DraverPage.dart';
import 'package:marquee/marquee.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'Widgets.dart';

class HomeScreen extends StatefulWidget  {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late final   controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
  var isShow = false;
  GetStorage box = GetStorage();
  Future<bool> showExitPopup() async {
    return await Get.defaultDialog(
      title: "System",
      middleText: "Çıxış etməkdə əminsiniz",
     textCancel: "Xeyr",
      textConfirm: "Bəli",
      onConfirm: (){
        Get.back(result: true);
      },
      onCancel: (){
        Get.back(result: false);
    }
    )??false; //if showDialouge had returned null, then return false
  }
  var pr;
  var hs;
  Controller c =  Get.put(Controller());
Future <void> isShowVoid()async{
  await Future.delayed(Duration(seconds: 3));
  setState((){
  });
}
  @override
  void initState() {
   pr = box.read("prayertime") ?? false;
   hs = box.read("hikmet") ?? false;
   c.isShowPrayerTime.value = pr;
   c.isShowHikmetliSoz.value = hs;
   isShowVoid;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: showExitPopup,
    child:  Scaffold(

      drawer: DrawerPage(),
      extendBodyBehindAppBar: true,

      backgroundColor:  Constants.primaryColor,
     appBar: AppBar(

       centerTitle: true,
       title: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Expanded(
             flex: 2,
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: FittedBox(
                 child: AutoSizeText(

                       "17 İyul 2022" ,  textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6?.
                 copyWith(color: Colors.white70,  fontWeight: FontWeight.w600),
                 ),
               ),
             ),
           ),
           Expanded(

             child: FittedBox(
               child: Column(
                 children: [
                   const Icon(Icons.mosque_outlined, size: 20, color: Colors.white,),
                 ],
               ),
             ),
           ),
           Expanded(
             flex: 2,
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0),
               child: FittedBox(
               child: AutoSizeText(

                 "6 Ramazan 1444", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6?.
               copyWith(color: Colors.white70, fontSize: Get.size.width/35, fontWeight: FontWeight.w600),
               ),
           ),
             ),)
         ],
       ),
       actions: [
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
         IconButton(onPressed: (
             ){
           Navigator.push(context, SizeTransition2(SettingsPage()));
         }, icon: const Icon(Icons.settings,) ),

       ],
       elevation: 0,
       backgroundColor: Colors.transparent,

     ),



     body: Center(
       child: Stack(
         alignment: Alignment.center,
         children: [
           Align(alignment: Alignment.bottomCenter,
               child:
           SafeArea(
             child: Obx(() =>
                Visibility(
                 visible: c.isShowHikmetliSoz.isTrue,
                 child: Container(
                   color: Colors.white,
                   height: 40,
                   child: Marquee(
                     fadingEdgeStartFraction: 0.15,
                     fadingEdgeEndFraction: 0.15,
                     velocity: 50,
                     text: ' **${"Hikmət əhli buyurur, kim olduğun deyil, kiminlə olduğun önəmlidir"}** ',
                     style: TextStyle(color: Constants.primaryColor, fontWeight: FontWeight.bold),),
                 ),
               ),
             ),
           )),

           SafeArea(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [

                 Expanded(
                   flex: 2,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(30.0),
                         child: AutoSizeText("Axşam namazına qalıb", minFontSize: 10 , maxFontSize: 15,style: TextStyle( color: Colors.white, fontFamily: "Oswald"),),
                       ),

                       Padding(
                         padding: const EdgeInsets.only(right: 30),
                         child: CircularPercentIndicator(
                           linearGradient: LinearGradient(colors: [Colors.red, Colors.white, Colors.red]),
                           backgroundColor: Colors.green,
                           radius: 50.0,
                           lineWidth: 10.0,
                           percent: 0.41,
                           center:  AutoSizeText("01:24:13",  maxFontSize: 20 , style: TextStyle(
                             color: Colors.white, fontFamily: "Oswald",
                           ),),

                         ),
                       )



                     ],
                   ),
                 ),
                 Expanded(
                   flex: 4,
                   child: Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: PrayerTimes()
                   ),
                 ),

              Obx(() => Visibility(
                  visible: c.isShowPrayerTime.isTrue,
                  child: Expanded(
                    flex: 4,
                    child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: PrayerTimes2(),
                  ),
                ),
              ),
            ),
                 Expanded(


                   child: SizedBox(),
                 )
               ],
             ),
           ),
         ],
       ),
     )




       )





    );


  }
}
