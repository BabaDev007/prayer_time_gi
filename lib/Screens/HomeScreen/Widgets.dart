
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../Constants.dart';

class Stack1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
       color: Constants.primaryColor,
    );
  }
}



class PrayerTimes extends StatefulWidget {
  const PrayerTimes({Key? key}) : super(key: key);

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Container(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.sunny_snowing, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "Sübh", style: TextStyle(color: Constants.primaryColor, fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.sunny, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "Günəş", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),

              ), const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(FontAwesomeIcons.solidSun, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "Zöhr", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(FontAwesomeIcons.sun, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "Əsr", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.sunny_snowing, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "Axşam", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Icon(FontAwesomeIcons.solidMoon, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "İşa", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),




            ],
          ),
        ),
        height: Get.size.height,
        width: Get.size.width/1.2,

      ),
    );
  }
}

class PrayerTimes2 extends StatefulWidget {
  const PrayerTimes2({Key? key}) : super(key: key);

  @override
  State<PrayerTimes2> createState() => _PrayerTimes2State();
}

class _PrayerTimes2State extends State<PrayerTimes2> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),

                    AutoSizeText(maxFontSize: 15 , "İşrak", style: TextStyle(color: Constants.primaryColor, fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "Kərahət", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),

              ), const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "Əsr-i Sani", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "İsfirar", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "İştibak", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(maxFontSize: 15 , "İşa-i Sani", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(maxFontSize: 15 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(Icons.info_outline_rounded, size: 20, color: Constants.primaryColor,),
                        )
                      ],
                    )
                  ],
                ),
              ),




            ],
          ),
        ),
        height: Get.size.height/3.3,
        width: Get.size.width/1.2,

      ),
    );
  }
}

