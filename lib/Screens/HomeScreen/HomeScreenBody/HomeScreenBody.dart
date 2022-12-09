import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import '../../../Constants.dart';
import '../../../StateManagement/StateManagement.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:jiffy/jiffy.dart';

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

  var _controller = CarouselSliderController();

  Future<void> getData() async {
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document
        .getElementsByClassName("col-md-8 col-sm-12 col-xs-12")
        .forEach((element) async {
      setState(() {
        bashliq = element.children[1].children[0].children[2].children[0]
            .children[0].children[0].children[0].text
            .toString();
        metin = element.children[1].children[0].children[5].text.toString();
      });
      box.write("bashliq", bashliq);
      box.write("metin", metin);
    });
  }

  // Future<void> getHikmet() async {
  //   var response = await http.get(_url);
  //   final body = response.body;
  //   final document = parser.parse(body);
  //   var res = document.getElementsByClassName("top-block2").forEach((element) {
  //     setState(() {
  //       hikmetliSoz = element.children[0].children[2].text.toString();
  //     });
  //     box.write("hikmetlisoz", hikmetliSoz);
  //   });
  // }

  var _metin3;

  var _sliderKey = GlobalKey();
  Future<void> getMovzuPage() async {
    var _url = Uri.parse(box.read("_link2"));
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document
        .getElementsByClassName("blog-info")
        .forEach((element) async {});
  }

  Color color = Colors.white;
  var zor;
  var now = DateTime.now();
  List months = [
    'Yanvar',
    'Fevral',
    'Mart',
    'Aprel',
    'May',
    'İyun',
    'İyul',
    'Avqust',
    'Sentyabr',
    'Oktyabr',
    'Noyabr',
    'Dekabr'
  ];

  List weekday = [
    "Bzr. ertəsi",
    "Çər. axşamı",
    "Çərşənbə",
    "Cümə axşamı",
    "Cümə",
    "Şənbə",
    "Bazar"
  ];

  Future<void> getDataMovzu() async {
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document
        .getElementsByClassName("col-md-8 col-sm-12 col-xs-12")
        .forEach((element) async {
      setState(() {
        bashliq = element.children[1].children[0].children[2].children[0]
            .children[0].children[0].children[0].text
            .toString();
        metin = element.children[1].children[0].children[5].text.toString();
      });
      box.write("bashliq", bashliq);
      box.write("metin", metin);
    });
  }

  DateTime? subh,
      zohr,
      ikindi,
      axsam,
      yatsi,
      gunes,
      geceyarisi,
      teheccud,
      ishrak,
      imsak,
      kerahet,
      asrisani,
      isfirar,
      istibak,
      isasani;
  var circularPrName;
  var circularPrPmName;
  var circularPrTime;
  Timer? mytimer;
  var percent;
  void colors() {
    if (percent > 0.40) {
      color = Colors.yellow;
    } else if (percent > 0.50) {
      color = Colors.redAccent;
    } else if (percent > 0.25) {
      color = Colors.greenAccent;
    } else {
      color = Colors.white;
    }
  }

  var dataTime;
  @override
  void initState() {
    super.initState();
    zor = box.read("time");
    c.globalHicriTime =
        "${zor['${c.difference2}']['baseTime']["todayHijrahDate"]}".obs;
    c.globalTime =
        "${DateTime.parse("${zor['${c.difference2}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor['${c.difference2}']['baseTime']["todayDate"]}").month - 1]}, ${weekday[DateTime.parse("${zor['${c.difference2}']['baseTime']["todayDate"]}").weekday - 1]}"
            .obs;
    c.globalTime2 =
        "${DateTime.parse("${zor['${c.difference2}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor['${c.difference2}']['baseTime']["todayDate"]}").month - 1]} ${Jiffy().year}"
            .obs;
    imsak = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['baseTime']['imsaq']}" +
            ":00");
    subh = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['baseTime']['sabah']}" +
            ":00");
    zohr = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['baseTime']['gunorta']}" +
            ":00");
    ikindi = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['baseTime']['ikindi']}" +
            ":00");
    axsam = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['baseTime']['axsam']}" +
            ":00");
    yatsi = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['baseTime']['yatsi']}" +
            ":00");
    gunes = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['baseTime']['gunes']}" +
            ":00");
    geceyarisi = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['extraTime']['midnight']}" +
            ":00");
    ishrak = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['extraTime']['israk']}" +
            ":00");
    kerahet = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['extraTime']['kerahat']}" +
            ":00");
    asrisani = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['extraTime']['asri_sani']}" +
            ":00");
    isfirar = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['extraTime']['isfirar']}" +
            ":00");
    istibak = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['extraTime']['istibak']}" +
            ":00");
    isasani = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['extraTime']['isa_sani']}" +
            ":00");
    teheccud = DateTime.parse(
        "${zor['${c.difference2}']['baseTime']["todayDate"]}" +
            " ${zor['${c.difference2}']['extraTime']['teheccud']}" +
            ":00");

    mytimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
        //  if(geceyarisi!.isBefore(DateTime.now()) ){
        //   circularPrName = "Təhəccüd";
        //   circularPrPmName = "vaxtına";
        //
        //   colors();
        //
        //
        // }

        if (teheccud!.isBefore(DateTime.now()) &&
            imsak!.isAfter(DateTime.now())) {
          circularPrName = "İmsak";
          circularPrPmName = "vaxtına";
          circularPrTime = imsak!.difference(now);
          var difPrToPr = imsak!.difference(teheccud!).inMinutes;
          var difPrToNow = imsak!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Sübh".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['sabah']}".obs;
          colors();
        } else if (imsak!.isBefore(DateTime.now()) &&
            subh!.isAfter(DateTime.now())) {
          circularPrName = "Sübh";
          circularPrPmName = "namazına";
          circularPrTime = subh!.difference(now);
          var difPrToPr = subh!.difference(imsak!).inMinutes;
          var difPrToNow = subh!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Sübh".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['sabah']}".obs;

          colors();
        } else if (subh!.isBefore(DateTime.now()) &&
            gunes!.isAfter(DateTime.now())) {
          circularPrName = "Günəş";
          circularPrPmName = "çıxmağına";
          circularPrTime = gunes!.difference(now);
          var difPrToPr = gunes!.difference(subh!).inMinutes;
          var difPrToNow = gunes!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Günəş".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['gunes']}".obs;

          colors();
        } else if (gunes!.isBefore(DateTime.now()) &&
            ishrak!.isAfter(DateTime.now())) {
          circularPrName = "İşrak";
          circularPrPmName = "vaxtına";
          circularPrTime = ishrak!.difference(now);
          var difPrToPr = ishrak!.difference(gunes!).inMinutes;
          var difPrToNow = ishrak!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Zöhr".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['gunorta']}".obs;

          colors();
        } else if (ishrak!.isBefore(DateTime.now()) &&
            kerahet!.isAfter(DateTime.now())) {
          circularPrName = "Kərahət";
          circularPrPmName = "vaxtına";
          circularPrTime = kerahet!.difference(now);
          var difPrToPr = kerahet!.difference(ishrak!).inMinutes;
          var difPrToNow = kerahet!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Zöhr".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['gunorta']}".obs;

          colors();
        } else if (kerahet!.isBefore(DateTime.now()) &&
            zohr!.isAfter(DateTime.now())) {
          circularPrName = "Zöhr";
          circularPrPmName = "namazına";
          circularPrTime = zohr!.difference(now);
          var difPrToPr = zohr!.difference(kerahet!).inMinutes;
          var difPrToNow = zohr!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Zöhr".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['gunorta']}".obs;

          colors();
        } else if (zohr!.isBefore(DateTime.now()) &&
            ikindi!.isAfter(DateTime.now())) {
          circularPrName = "Əsr";
          circularPrPmName = "namazına";
          circularPrTime = ikindi!.difference(now);
          var difPrToPr = ikindi!.difference(zohr!).inMinutes;
          c.duration = ikindi!.difference(now);
          var difPrToNow = ikindi!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Əsr".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['ikindi']}".obs;

          colors();
        } else if (ikindi!.isBefore(DateTime.now()) &&
            asrisani!.isAfter(DateTime.now())) {
          circularPrName = "Əsr-i Sani";
          circularPrPmName = "vaxtına";
          circularPrTime = asrisani!.difference(now);
          var difPrToPr = asrisani!.difference(ikindi!).inMinutes;
          var difPrToNow = asrisani!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Axşam".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['axsam']}".obs;

          colors();
        } else if (asrisani!.isBefore(DateTime.now()) &&
            isfirar!.isAfter(DateTime.now())) {
          circularPrName = "İsfirar";
          circularPrPmName = "vaxtına";
          circularPrTime = isfirar!.difference(now);
          var difPrToPr = isfirar!.difference(asrisani!).inMinutes;
          var difPrToNow = isfirar!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Axşam".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['axsam']}".obs;

          colors();
        } else if (isfirar!.isBefore(DateTime.now()) &&
            axsam!.isAfter(DateTime.now())) {
          circularPrName = "Axşam";
          circularPrPmName = "namazına";
          circularPrTime = axsam!.difference(now);
          var difPrToPr = axsam!.difference(isfirar!).inMinutes;
          var difPrToNow = axsam!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Axşam".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['axsam']}".obs;

          colors();
        } else if (axsam!.isBefore(DateTime.now()) &&
            istibak!.isAfter(DateTime.now())) {
          circularPrName = "İştibak";
          circularPrPmName = "vaxtına";
          circularPrTime = istibak!.difference(now);
          var difPrToPr = istibak!.difference(axsam!).inMinutes;
          var difPrToNow = istibak!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "İşa".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['yatsi']}".obs;

          colors();
        } else if (istibak!.isBefore(DateTime.now()) &&
            yatsi!.isAfter(DateTime.now())) {
          circularPrName = "İşa";
          circularPrPmName = "namazına";
          circularPrTime = yatsi!.difference(now);
          var difPrToPr = yatsi!.difference(istibak!).inMinutes;
          var difPrToNow = yatsi!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "İşa".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['yatsi']}".obs;

          colors();
        } else if (yatsi!.isBefore(DateTime.now()) &&
            isasani!.isAfter(DateTime.now())) {
          circularPrName = "İşa-i Sani";
          circularPrPmName = "vaxtına";
          circularPrTime = isasani!.difference(now);
          var difPrToPr = isasani!.difference(yatsi!).inMinutes;
          var difPrToNow = isasani!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Gecə yarısı".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['midnight']}".obs;

          colors();
        } else if (isasani!.isBefore(DateTime.now())&&
            geceyarisi!.isAfter(DateTime.now())) {
          circularPrName = "Gecə yarısına";
          circularPrPmName = "";
          circularPrTime = geceyarisi!.difference(now);
          var difPrToPr = geceyarisi!.difference(yatsi!).inMinutes;
          var difPrToNow = geceyarisi!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Gecə yarısı".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['extraTime']['midnight']}".obs;

          colors();
        } else if (geceyarisi!.isBefore(DateTime.now())) {
          circularPrName = "Təhəccüd";
          circularPrPmName = "vaxtına";
          circularPrTime = teheccud!.difference(now)+Duration(hours: 24);
          var difPrToPr = teheccud!.difference(geceyarisi!).inMinutes;
          var difPrToNow = teheccud!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Təhəccüd".obs;

          c.globalTimeTime =
              "${zor['${c.difference2}']['extraTime']['teheccud']}".obs;

          // var difPrToPr = geceyarisi!.difference(isasani!).inMinutes;
          // var difPrToNow = geceyarisi!.difference(now).inMinutes;
          // percent = (1-  difPrToNow/difPrToPr.toDouble());
          // colors();

        }
        else if (teheccud!.isAfter(DateTime.now())) {
          circularPrName = "Təhəccüd";
          circularPrPmName = "vaxtına";
          circularPrTime = teheccud!.difference(now);
          var difPrToPr = teheccud!.difference(geceyarisi!).inMinutes;
          var difPrToNow = teheccud!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Təhəccüd".obs;

          c.globalTimeTime =
              "${zor['${c.difference2}']['extraTime']['teheccud']}".obs;

          // var difPrToPr = geceyarisi!.difference(isasani!).inMinutes;
          // var difPrToNow = geceyarisi!.difference(now).inMinutes;
          // percent = (1-  difPrToNow/difPrToPr.toDouble());
          // colors();

        }
      });
    });

    mytimer;
    pr = box.read("prayertime") ?? false;
    hs = box.read("hikmet") ?? true;
    getDataMovzu();
    c.isShowPrayerTime.value = pr;
    c.isShowHikmetliSoz.value = hs;

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    var pageList = [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
        child: Card(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Image.asset("assets/sunrise2.png",
                                        color: Constants.primaryColor
                                            .withOpacity(.5),
                                        width: 25),
                                  ),
                                ),
                              ),
                              Text(
                                "sübh",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xDE46BE8D).withOpacity(.85),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Color(0xDE46BE8D),
                                        Constants.primaryColor
                                      ])),
                              child: Center(
                                  child: AutoSizeText(
                                zor['${c.difference}']['baseTime']['sabah']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ))),
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 1),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Image.asset(
                                        "assets/sun.png",
                                        color: Constants.primaryColor
                                            .withOpacity(.5),
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "günəş",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily:
                                          "PlayfairDisplay-VariableFont"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xDE46BE8D).withOpacity(.85),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        colors: [
                                          Color(0xDE46BE8D),
                                          Constants.primaryColor
                                        ])),
                                child: Center(
                                    child: AutoSizeText(
                                  zor['${c.difference}']['baseTime']['gunes']
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily:
                                          "PlayfairDisplay-VariableFont"),
                                ))),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 1),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Icon(Icons.sunny,
                                        color: Constants.primaryColor
                                            .withOpacity(.5)),
                                  ),
                                ),
                              ),
                              AutoSizeText(
                                "zöhr",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xDE46BE8D).withOpacity(.85),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Color(0xDE46BE8D),
                                        Constants.primaryColor
                                      ])),
                              child: Center(
                                  child: AutoSizeText(
                                zor['${c.difference}']['baseTime']['gunorta']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ))),
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 1),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Icon(Icons.sunny_snowing,
                                        color: Constants.primaryColor
                                            .withOpacity(.5)),
                                  ),
                                ),
                              ),
                              Text(
                                "əsr",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xDE46BE8D).withOpacity(.85),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Color(0xDE46BE8D),
                                        Constants.primaryColor
                                      ])),
                              child: Center(
                                  child: AutoSizeText(
                                zor['${c.difference}']['baseTime']['ikindi']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ))),
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 1),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Icon(Icons.nightlight_outlined,
                                        color: Constants.primaryColor
                                            .withOpacity(.5)),
                                  ),
                                ),
                              ),
                              Text(
                                "axşam",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xDE46BE8D).withOpacity(.85),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Color(0xDE46BE8D),
                                        Constants.primaryColor
                                      ])),
                              child: Center(
                                  child: AutoSizeText(
                                zor['${c.difference}']['baseTime']['axsam']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ))),
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 1),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Icon(
                                      Icons.nightlight,
                                      color: Constants.primaryColor
                                          .withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "işa",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xDE46BE8D).withOpacity(.85),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Color(0xDE46BE8D),
                                        Constants.primaryColor
                                      ])),
                              child: Center(
                                  child: AutoSizeText(
                                zor['${c.difference}']['baseTime']['yatsi']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "PlayfairDisplay-VariableFont"),
                              ))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 33),
        child: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "imsaq",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),

                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['baseTime']['imsaq']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "sübh",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['baseTime']['sabah']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "günəş",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['baseTime']['gunes']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "işrak",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['extraTime']['israk']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "kərahət",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['extraTime']
                                        ['kerahat']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "zöhr",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['baseTime']
                                        ['gunorta']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "əsr əvvəl",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['baseTime']['ikindi']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "əsr sani",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['extraTime']
                                        ['asri_sani']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "isfirar",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child:  AutoSizeText(
                                        zor['${c.difference}']['extraTime']
                                        ['isfirar']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "axşam",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child:  AutoSizeText(
                                        zor['${c.difference}']['baseTime']['axsam']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "iştibaq",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child:  AutoSizeText(
                                        zor['${c.difference}']['extraTime']
                                        ['istibak']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "işa əvvəl",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['baseTime']['yatsi']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "işa sani",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['extraTime']
                                        ['isa_sani']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "gecə y-sı",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child:  AutoSizeText(
                                        zor['${c.difference}']['extraTime']
                                        ['midnight']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(.5),
                        child: Container(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "təhəccüd",
                                    minFontSize: 15,
                                    maxFontSize: 25,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xDE46BE8D).withOpacity(.85),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color(0xDE46BE8D),
                                              Constants.primaryColor
                                            ])),
                                    child: Center(
                                      child: AutoSizeText(
                                        zor['${c.difference}']['extraTime']
                                        ['teheccud']
                                            .toString(),
                                        minFontSize: 15,
                                        maxFontSize: 25,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          width: Get.width / 3.5,
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15))),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      )
    ];
    return // c.globalTimeName == null ? Center(child: Lottie.asset("assets/loding.json", height: 80),) :

        Center(
            child: Column(
      children: [
        Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: Get.height / 100),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(.7),
                    ),
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Get.height / 40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    height: Get.height,
                    width: Get.width,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: Opacity(
                            opacity: .9,
                            child: Image.asset(
                              "assets/mosqsad.png",
                              fit: BoxFit.fitWidth,
                            ))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Get.height / 40),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.lightBlueAccent.withOpacity(.5)),
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
                Positioned(
                    bottom: Get.height / 16,
                    right: 10,
                    child: circularPrTime == null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                   color: Constants.primaryColor.withOpacity(.3),
                              ),
                            ),
                          )
                        : Container(
                            width: Get.width / 4,
                            height: Get.height / 8,
                            decoration: BoxDecoration(
                                color: Constants.primaryColor.withOpacity(.3),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      circularPrName,
                                      textAlign: TextAlign.center,
                                      maxFontSize: 15,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,

                                      ),
                                      maxLines: 2,
                                    ),
                               circularPrPmName != "" ?     AutoSizeText(
                                      circularPrPmName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                      maxLines: 1,
                                    ) : SizedBox(),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    AutoSizeText(
                                      "-${circularPrTime.toString().substring(0, 7)}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          fontFamily:
                                              "PlayfairDisplay-VariableFont"),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ))),
                Positioned(
                    bottom: Get.height / 16,
                    left: 10,
                    child: c.globalTimeTime == null || c.globalTimeName == null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(
                            width: Get.width / 4,
                            height: Get.height / 8,
                            decoration: BoxDecoration(
                                color: Constants.primaryColor.withOpacity(.3),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                  child: Text(
                                "${c.globalTimeName}\n${c.globalTimeTime}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: "Oswald"),
                              )),
                            ),
                          )),
                Positioned(
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  c.difference--;
                                });
                              },
                              icon: Icon(Icons.chevron_left,
                                  color: Constants.primaryColor)),
                        ),
                        FittedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "${DateTime.parse("${zor['${c.difference}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor['${c.difference}']['baseTime']["todayDate"]}").month - 1]}, ${weekday[DateTime.parse("${zor['${c.difference}']['baseTime']["todayDate"]}").weekday - 1]}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              Text(
                                "${"${zor['${c.difference}']['baseTime']["todayHijrahDate"]}".capitalize}",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black38),
                              )
                            ],
                          ),
                        ),
                        FittedBox(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  c.difference++;
                                });
                              },
                              icon: Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: Constants.primaryColor,
                              )),
                        )
                      ],
                    ),
                    height: Get.height / 20,
                    width: Get.width / 1.15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CarouselSlider.builder(
                controller: _controller,
                initialPage: pr ? 1 : 0,
                // onSlideChanged: (value){
                //   setState(() {
                //     slidePage = value - slidePage1;
                //     if(slidePage == 22){
                //       slidePage = 0;
                //       slidePage1  = slidePage1 + 22;
                //     }
                //   });
                //   print(slidePage);
                // },
                key: _sliderKey,
                unlimitedMode: false,
                slideBuilder: (index) {
                  return pageList[index];
                },
                slideTransform: CubeTransform(rotationAngle: 80),
                slideIndicator: CircularSlideIndicator(
                  indicatorBackgroundColor: Colors.black12,
                  currentIndicatorColor: Colors.blue,
                  padding: EdgeInsets.only(bottom: 10),
                ),
                itemCount: pageList.length),
          ),
        )
      ],
    ));
  }

// List of items in our dropdown menu
}
