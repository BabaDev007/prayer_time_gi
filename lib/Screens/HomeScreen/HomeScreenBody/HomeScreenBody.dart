import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selection_menu/selection_menu.dart';
import 'package:selection_menu/components_configurations.dart';
import 'package:marquee/marquee.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../Constants.dart';
import '../../../StateManagement/StateManagement.dart';
import '../Widgets.dart';

class Body extends StatefulWidget {


  @override
  State<Body> createState() => _BodyState();
}


class _BodyState extends State<Body> {
  var isShow = false;
  GetStorage box = GetStorage();
  var pr;
  var hs;
  Controller c =  Get.put(Controller());
  @override
  void initState() {
    super.initState();
    pr = box.read("prayertime") ?? false;
    hs = box.read("hikmet") ?? false;
    c.isShowPrayerTime.value = pr;
    c.isShowHikmetliSoz.value = hs;


    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return Center(
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
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child:
                      SizedBox(child:
                      Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child:

            FittedBox(
              child: SelectionMenu<String>(
              itemsList: <String>['A','B','C'],
                onItemSelected: (String selectedItem)
                {

                },
                itemBuilder: (BuildContext context, String item, OnItemTapped onItemTapped)
                {
                  return Material(
                    child: InkWell(
                      onTap: onItemTapped,
                      child: Text(item),
                    ),
                  );
                },
                componentsConfiguration: DropdownComponentsConfiguration<String>(

                ),

              ),
            ),
                      ),
                          )),
                      Expanded(

                        child: FittedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText("Çərşənbə", minFontSize:10  , maxFontSize: 20,style: TextStyle( color: Colors.white, fontFamily: "Oswald"),),
                              AutoSizeText("14 May 2022", minFontSize:10  , maxFontSize: 20,style: TextStyle( color: Colors.white, fontFamily: "Oswald"),),
                              AutoSizeText("15 Zilhiccə 1444", minFontSize:10  , maxFontSize: 20,style: TextStyle( color: Colors.white, fontFamily: "Oswald"),),


                            ],

                          ),
                        ),
                      ),


                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: FittedBox(
                            child: CircularPercentIndicator(
                              backgroundWidth: 1,

                              progressColor: Colors.white,
                              backgroundColor: Colors.white38,
                              radius: 50.0,
                              lineWidth: 3.0,
                              percent: 0.41,
                              center:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText("Əsr",  maxFontSize: 25 ,minFontSize: 20, style: TextStyle(
                                    color: Colors.white, fontFamily: "Oswald",
                                  ),),
                                  AutoSizeText("01:24:13",  maxFontSize: 50 , minFontSize: 20, style: TextStyle(
                                    color: Colors.white70, fontFamily: "Oswald",
                                  ),),
                                ],
                              ),

                            ),
                          ),
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
    );
  }
}
