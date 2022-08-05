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
  Color color = Colors.white;
  var zor;
  var circularTime;
  Duration? lastCircular;
 DateTime? subh,
     zohr,
     ikindi,
     axsam,
     yatsi, gunes, geceyarisi, subh2;
 var percentage;
  var b;

  Timer? mytimer;
  @override
  void initState() {
    super.initState();
    zor = box.read("time");
    subh2 = DateTime.parse("${zor['${c
        .difference2 }']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['sabah']}" + ":00" );
    subh = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['sabah']}" + ":00" );
    zohr = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['gunorta']}" + ":00" );
    ikindi = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['ikindi']}" + ":00" );
    axsam = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['axsam']}" + ":00" );
    yatsi = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['yatsi']}" + ":00" );
    gunes = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['gunes']}" + ":00" );
    geceyarisi = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['extraTime']['midnight']}" + ":00" );
    mytimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState((){

        if(subh!.isBefore(DateTime.now()) && gunes!.isAfter(DateTime.now())){
          circularTime = "Günəşə";
          lastCircular = DateTime.now().difference(gunes!);
          var lastCircular1 = DateTime.now().difference(gunes!).inMinutes;
          var percent = subh!.difference(gunes!).inMinutes;
          percentage = 1-((lastCircular1 * 0.1 /percent).toDouble().abs());
          b = percentage;

        }else if(subh!.isBefore(DateTime.now()) && zohr!.isAfter(DateTime.now())){
          circularTime = "Zöhrə";
          lastCircular = DateTime.now().difference(zohr!);
          var lastCircular1 = DateTime.now().difference(zohr!).inMinutes;
          var percent = gunes!.difference(zohr!).inMinutes;
          percentage = 1-((lastCircular1 * 0.1 /percent).toDouble().abs());
          b = percentage;}
        else if(subh!.isBefore(DateTime.now()) && zohr!.isBefore(DateTime.now()) && ikindi!.isAfter(DateTime.now())){
          circularTime = "Əsrə";
          lastCircular = DateTime.now().difference(ikindi!);
          var lastCircular1 = DateTime.now().difference(ikindi!).inMinutes;
          var percent = zohr!.difference(ikindi!).inMinutes;
          percentage = 1-((lastCircular1 * 0.1 /percent).toDouble().abs());
          b = percentage;

        }else if(subh!.isBefore(DateTime.now()) && zohr!.isBefore(DateTime.now()) && ikindi!.isBefore(DateTime.now()) && axsam!.isAfter(DateTime.now())){
          circularTime = "Axşama";
          lastCircular = DateTime.now().difference(axsam!);
          var lastCircular1 = DateTime.now().difference(axsam!).inMinutes;
          var percent = ikindi!.difference(axsam!).inMinutes;
          percentage = 1-((lastCircular1 * 1 /percent)).toDouble().abs();
          b = percentage;

        }else if(subh!.isBefore(DateTime.now()) && zohr!.isBefore(DateTime.now()) && ikindi!.isBefore(DateTime.now()) && axsam!.isBefore(DateTime.now()) && yatsi!.isAfter(DateTime.now())){
          circularTime = "İşaya";
          lastCircular = DateTime.now().difference(yatsi!);
          var lastCircular1 = DateTime.now().difference(yatsi!).inMinutes;
          var percent = axsam!.difference(yatsi!).inMinutes;
          percentage = 1-((lastCircular1 * 0.1 /percent)).toDouble().abs();
          b = percentage;

        }else if(subh!.isBefore(DateTime.now()) && zohr!.isBefore(DateTime.now()) && ikindi!.isBefore(DateTime.now()) && axsam!.isBefore(DateTime.now()) && yatsi!.isBefore(DateTime.now())&& geceyarisi!.isAfter(DateTime.now())){
          circularTime = "Gecə Yarısına";
          lastCircular = DateTime.now().difference(geceyarisi!);
          var lastCircular1 = DateTime.now().difference(geceyarisi!).inMinutes;
          var percent = yatsi!.difference(geceyarisi!).inMinutes;
          percentage = 1-((lastCircular1 * 1 /percent)).toDouble().abs();
          b = percentage;
          print(b);

        }
        else if(geceyarisi!.isBefore(DateTime.now())){
          circularTime = "Sübhə";
          lastCircular = DateTime.now().difference(subh!);
          var lastCircular1 = DateTime.now().difference(subh!).inMinutes;
          var percent = geceyarisi!.difference(subh!).inMinutes;
          percentage = 1-((lastCircular1 * 0.1 /percent)).toDouble().abs();
          b = percentage;

        }
        if(b>0.7){
          color=Colors.redAccent;
        }else if(b<0.3){
          color = Colors.greenAccent;
        } else{
          color = Colors.yellow;
        }
      });
    });
    mytimer;
    pr = box.read("prayertime") ?? true;
    hs = box.read("hikmet") ?? true;
    getHikmet();
    getMovzuDialog();
    c.isShowPrayerTime.value = pr;
    c.isShowHikmetliSoz.value = hs;
    hikmet = box.read("hikmetlisoz");

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    return SingleChildScrollView(

      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Center(
          child:
          b == null ? CircularProgressIndicator(color: Colors.white,) :
       Stack(
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
                              flex: 2,

                               child:
                                 Padding(
                                   padding: const EdgeInsets.all(10),
                                   child: InkWell(
                                     borderRadius: BorderRadius.circular(20),
                                     highlightColor: Colors.white,

                                     onTap: () async {

                                       getData();
                                       Navigator.push(context,
                                           SizeTransition2(DaylyTheme()));
                                     },
                                     child: Container(
                                       height: Get.size.height,
                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Center(child: Text("Günlük Mövzu", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "Oswald", fontSize: 20),)),
                                       ),
                                       decoration: BoxDecoration(
                                           color: Constants.primaryColor,
                                           borderRadius: BorderRadius.circular(40),
                                           border: Border.all(width: 1.9, color: Colors.white)

                                       ),
                                     ),
                                   ),
                                 )


                                   ),
                          Expanded(
                            flex: 2,
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:
                                Container(
                                  height: Get.height/1.7,
                                  child:
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [



                                        Text("${zor['${c
                                            .difference}']['baseTime']["todayDate"]}",

                                          style: TextStyle(color: Colors.white,
                                              fontFamily: "Oswald", fontSize: 70),),
                                              Text(

                                                "${zor['${c
                                                  .difference}']['baseTime']["todayHijrahDate"]}",
                                                maxLines: 1,

                                                style: TextStyle(color: Colors.white,
                                                    fontFamily: "Oswald", fontSize: 70),),




                                          ]
                                        ),

                                    ),

                                  decoration: BoxDecoration(
                                      color: Constants.primaryColor,
                                      borderRadius: BorderRadius.circular(160),
                                      border: Border.all(width: 1.9, color: Colors.white)

                                  ),
                                ),



                              ),
                            ),

                          ),



                          Expanded(
                            flex: 2,
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0, ),
                                child: CircularPercentIndicator(
                                  backgroundWidth: 1,
                                  percent: b,
                                  progressColor: color,
                                  backgroundColor: Colors.white38,
                                  radius: 60.0,
                                  lineWidth: 3.0,

                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      circularTime==null ? Center(child: CircularProgressIndicator(color: Colors.white,),) : Column(
                                        children: [
                                          AutoSizeText(
                                            circularTime , maxFontSize: 26,
                                            minFontSize: 15,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.white, fontFamily: "Oswald",
                                            ),),
                                          AutoSizeText(
                                            "qalan vaxt" , maxFontSize: 15,
                                            minFontSize: 10,
                                            style: TextStyle(
                                              color: Colors.white, fontFamily: "Oswald",
                                            ),),
                                        ],
                                      ),
                                      AutoSizeText(lastCircular.toString().substring(1, 8), maxFontSize: 40,
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
                      flex: 8,
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Expanded(child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: PrayerTimes(),
                              )),
                              Obx(() =>Visibility(
                                  visible: c.isShowPrayerTime.isTrue,
                                  child: Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: PrayerTimes2(),
                                    ),
                                  )),)
                            ],
                          )
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
        ),
      ),
    );
  }

// List of items in our dropdown menu
}
