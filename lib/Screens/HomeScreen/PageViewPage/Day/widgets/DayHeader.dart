import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prayer_time_gi/StateManagement/StateManagement.dart';
import '../../../../../Constants.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';


class DayHeader extends StatefulWidget {
  @override
  State<DayHeader> createState() => _DayHeaderState();
}

class _DayHeaderState extends State<DayHeader> {
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
  double percent = 0;
  void colors() {
    if (percent > 0.4 && percent <= 0.8) {

      color = Colors.yellow;
    }
    else if (percent > 0.8) {
      color = Colors.redAccent;
    }
    else if ( percent < 0.4) {
      color = Colors.greenAccent;
    }

  }
GetStorage box = GetStorage();
  var dataTime;
  @override
  void initState() {
    super.initState();
    print("percent${percent}");
    zor = box.read("time");
    c.globalHicriTime =
        "${zor['${c.difference2}']['baseTime']["todayHijrahDate"]}".obs;
    c.globalTime =
        "${DateTime.parse("${zor['${c.difference2}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor['${c.difference2}']['baseTime']["todayDate"]}").month - 1]}, ${weekday[DateTime.parse("${zor['${c.difference2}']['baseTime']["todayDate"]}").weekday - 1]}"
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
       print("percent ${percent}");
        now = DateTime.now();

       if (teheccud!.isAfter(DateTime.now()) &&
           imsak!.isAfter(DateTime.now())) {
         circularPrName = "Təhəccüd";
         circularPrPmName = "vaxtına";
         circularPrTime = teheccud!.difference(now);
         var difPrToPr = teheccud!.difference(geceyarisi!).inMinutes;
         var difPrToNow = teheccud!.difference(now).inMinutes;
         percent = 1 - difPrToNow / difPrToPr.toDouble();
         c.globalTimeName = "Təhəccüd".obs;
         c.globalTimeTime =
             "${zor['${c.difference2}']['extraTime']['teheccud']}".obs;
         colors();
       }
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
        }

        else if (subh!.isBefore(DateTime.now()) &&
            zohr!.isAfter(DateTime.now())) {
          circularPrName = "Zöhr";
          circularPrPmName = "namazına";
          circularPrTime = zohr!.difference(now);
          var difPrToPr = zohr!.difference(subh!).inMinutes;
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
        }
        else if (ikindi!.isBefore(DateTime.now()) &&
            axsam!.isAfter(DateTime.now())) {
          circularPrName = "Axşam";
          circularPrPmName = "namazına";
          circularPrTime = axsam!.difference(now);
          var difPrToPr = axsam!.difference(ikindi!).inMinutes;
          var difPrToNow = axsam!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "Axşam".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['axsam']}".obs;

          colors();
        }

        else if (axsam!.isBefore(DateTime.now()) &&
            yatsi!.isAfter(DateTime.now())) {
          circularPrName = "Yatsı";
          circularPrPmName = "namazına";
          circularPrTime = yatsi!.difference(now);
          var difPrToPr = yatsi!.difference(axsam!).inMinutes;
          var difPrToNow = yatsi!.difference(now).inMinutes;
          percent = 1 - difPrToNow / difPrToPr.toDouble();
          c.globalTimeName = "İşa".obs;
          c.globalTimeTime =
              "${zor['${c.difference2}']['baseTime']['yatsi']}".obs;

          colors();
        }
        else if (yatsi!.isBefore(DateTime.now())) {
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
        }

      });

    });

    mytimer;


    // TODO: implement initState
  }
  Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                child: Opacity(
                    opacity: .15,
                    child: Image.asset(
                      "assets/silhuette.png",
                      fit: BoxFit.cover,
                    )),
                height: Get.height / 6,
                width: Get.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blueAccent.withOpacity(.6),
                      Constants.primaryColor.withOpacity(.8)
                    ]),
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(20))),
            Positioned(
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${c.globalTimeName}\n${c.globalTimeTime}".toString(),
                    style: TextStyle(
                        fontSize: 29,
                        fontFamily: "Oswald",
                        color: Colors.white),
                  ),
                ]
              ),
            ),
            Positioned(
                right: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularPercentIndicator(
                      backgroundWidth: 3,
                      percent: percent ,
                      progressColor: color,
                      backgroundColor: Colors.white38,
                      radius: 52.0,
                      lineWidth: 6.0,
                      center: FittedBox(
                        child:  (circularPrTime == null)
                            ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                            :AutoSizeText(
                          "-${circularPrTime.toString().substring(0, 7)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              fontFamily:
                              "PlayfairDisplay-VariableFont"),
                          maxLines: 1,
                        ),

                      )),
                ))
          ],
        ));
  }
}
