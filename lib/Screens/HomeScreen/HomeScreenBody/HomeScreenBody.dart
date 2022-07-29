import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_time_gi/PageTransition/PageTransition.dart';

import 'package:marquee/marquee.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

import '../../../Constants.dart';
import '../../../StateManagement/StateManagement.dart';
import '../Widgets.dart';
import 'package:share/share.dart';
class Body extends StatefulWidget {


  @override
  State<Body> createState() => _BodyState();
}


class _BodyState extends State<Body> {
  GetStorage box = GetStorage();
  var bashliq;
  var metin;

  var isShow = false;
  var pr;
  var hs;
  var hikmetliSoz;
  var hikmet;
  var _bashliq2;
  var _link2;
  var _metin2;
  Controller c = Get.put(Controller());
  var _url = Uri.parse("https://www.gozelislam.com/");

  Future<void> getData() async {
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("col-md-8 col-sm-12 col-xs-12")
        .forEach((element) async {
      setState(() {
        bashliq =
            element.children[1].children[0].children[2].children[0].children[0]
                .children[0].children[0].text.toString();
        metin = element.children[1].children[0].children[5].text.toString();
      });
      box.write("bashliq", bashliq);
      box.write("metin", metin);
    }
    );
  }

  Future<void> getHikmet() async {
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("top-block2").forEach((element) {
      setState(() {
        hikmetliSoz = element.children[0].children[2].text.toString();
      });
      box.write("hikmetlisoz", hikmetliSoz);
    });
  }

  var _metin3;

  Future<void> getMovzuDialog() async {
    var _url = Uri.parse("https://www.gozelislam.com/");
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("costom4").forEach((element) {
      setState(() {
        _bashliq2 =
            element.children[0].children[0].children[0].children[0].children[0]
                .text.toString();
        _metin2 = element.children[0].children[0].children[1].text.toString();
      });
      box.write("_metin2", _metin2);
      box.write("_bashliq2", _bashliq2);
      box.write("_link2",
          element.children[0].children[0].children[0].children[0]
              .attributes['href'].toString());
    });
    print(box.read("_link2"));
  }

  Future<void> getMovzuPage() async {
    var _url = Uri.parse(box.read("_link2"));
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("blog-info").forEach((
        element) async {


    });
  }
  var zor;

  @override
  void initState() {
    super.initState();
    c.difference = DateTime.now().difference(DateTime(2021,DateTime.december,31)).inDays.obs;
    pr = box.read("prayertime") ?? true;
    hs = box.read("hikmet") ?? true;
    getHikmet();
    getMovzuDialog();
    c.isShowPrayerTime.value = pr;
    c.isShowHikmetliSoz.value = hs;
    hikmet = box.read("hikmetlisoz");
    zor = box.read("time");
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
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
                      child: InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              actions: [
                                TextButton(onPressed: () async {
                                  await Share.share(
                                      "Hikmət əhli buyurdu ki, \n ${hikmet} "
                                          "\n https://play.google.com/store/apps/details?id=com.turkiyetakvimi&gl=US");
                                }, child: Text("Paylaş"))
                              ],
                              title: "Hikmət əhli buyurdu ki,",
                              middleText: hikmet,
                              middleTextStyle: TextStyle(
                                fontFamily: "GentiumBookPlus",),
                              titleStyle: TextStyle(color: Constants
                                  .primaryColor, fontFamily: "Oswald"));
                        },
                        child: Container(
                          color: Colors.white,
                          height: 40,
                          child: Marquee(
                            fadingEdgeStartFraction: 0.15,
                            fadingEdgeEndFraction: 0.15,
                            velocity: 50,
                            text: ' **${hikmet ??
                                "Hikmət əhli buyurdu ki, kim olduğun deyil kiminlə olduğun önəmlidir" }** ',
                            style: TextStyle(color: Constants.primaryColor,
                                fontWeight: FontWeight.bold, fontFamily: "PlayfairDisplay"),),
                        ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          flex: 1,
                          child:
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,),
                                    child: AutoSizeText(

                                      "Günün Mövzusu", style: TextStyle(
                                        fontFamily: "Oswald",
                                        fontSize: 30,
                                        color: Constants.primaryColor),
                                      maxLines: 1,

                                      maxFontSize: 31,
                                    ),


                                    onPressed: () async {
                                      getData();
                                      Navigator.push(context,
                                          SizeTransition2(DaylyTheme()));
                                    },),

                                ],
                              )
                          )),
                      Expanded(
                        flex: 1,
                        child: FittedBox(
                          child: Obx(() =>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText("${zor['${c
                                        .difference}']["cityOfName"]}",
                                      minFontSize: 6,
                                      maxFontSize: 13,
                                      style: TextStyle(color: Colors.white,
                                          fontFamily: "Oswald"),),
                                    AutoSizeText("${zor['${c
                                        .difference}']['baseTime']["todayHijrahDate"]}",
                                      minFontSize: 6,
                                      maxFontSize: 8,
                                      style: TextStyle(color: Colors.white,
                                          fontFamily: "Oswald"),),
                                    AutoSizeText("${zor['${c
                                        .difference}']['baseTime']["todayDate"]}",
                                      minFontSize: 6,
                                      maxFontSize: 8,
                                      style: TextStyle(color: Colors.white,
                                          fontFamily: "Oswald"),),


                                  ],

                                ),
                              ),
                          ),
                        ),
                      ),


                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: FittedBox(
                            child: CircularPercentIndicator(
                              backgroundWidth: 1,

                              progressColor: Colors.white,
                              backgroundColor: Colors.white38,
                              radius: 60.0,
                              lineWidth: 3.0,
                              percent: 0.41,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText("Əsr", maxFontSize: 30,
                                    minFontSize: 29,
                                    style: TextStyle(
                                      color: Colors.white, fontFamily: "Oswald",
                                    ),),
                                  AutoSizeText("01:24:13", maxFontSize: 40,
                                    minFontSize: 20,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: "Oswald",
                                        fontSize: 25
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
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: PrayerTimes()
                  ),
                ),

                Obx(() =>
                    Visibility(
                      visible: c.isShowPrayerTime.isTrue,
                      child: Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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

// List of items in our dropdown menu
}
