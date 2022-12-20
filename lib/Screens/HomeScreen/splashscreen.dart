import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cool_alert/cool_alert.dart';
import 'IntroScreen.dart';
import 'PageViewPage/PageViewPage.dart';
import 'package:get/get.dart';
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

import 'SplashError.dart';

class MyCustomSplashScreen extends StatefulWidget {
  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;
  GetStorage box = GetStorage();

  var currentTime;
  var isSucces = false;
  var url = Uri.parse(
      "https://prayer-time-ws.herokuapp.com/api/dates/json/1.0/allDataYearly?indexOfCity=1425");
  var isIntroUpdated = false;
  Future<void> getData() async {
    if (box.read("time") == null || (box.read("yearOfUpdate")!=DateTime.now().year)) {
      var response = await http.get(url);
      var json = response.body;
      var jsonData = jsonDecode(utf8.decode(json.runes.toList()).toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        currentTime = jsonData["data"];
        box.write("time", currentTime);
        box.write("yearOfUpdate", DateTime.now().year);
      }
    }
  }

  var bashliq;
  var metin;

  var isShow = false;
  var pr;
  var hs;
  var hikmetliSoz;
  var hikmetliSoz1;
  var hikmet;
  var _bashliq2;
  var _link2;
  var _metin2;
  var _url = Uri.parse("https://www.gozelislam.com/");
  Timer? mytimer;
  var count = 0;
  bool progress = false;

  Future<void> getHikmet() async {
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("top-block2").forEach((element) {
      setState(() {
        hikmetliSoz1 = element.children[0].children[2].text.toString();
      });
      box.write("hikmetlisoz", hikmetliSoz1);
    });
  }

  @override
  void initState() {
    super.initState();

    getHikmet();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    animation1 = Tween<double>(begin: 50, end: 25).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 2), () async {
      try {
        await getData();

        box.read("intro") ?? false
            ? Navigator.pushReplacement(context, PageTransition(PageViewPage()))
            : Navigator.pushReplacement(context, PageTransition(IntroScreen()));
      } catch (e) {
        Navigator.pushReplacement(context, PageTransition(SplashError()));
        // CoolAlert.show(
        //     barrierDismissible: false,
        //     lottieAsset: "assets/75267-no-wifi.json",
        //     backgroundColor: Constants.primaryColor,
        //     confirmBtnText: "OK",
        //     cancelBtnText: "Xeyr",
        //     context: context,
        //     type: CoolAlertType.error,
        //     text:  'İnternet bağlantısını yoxlayın və bir daha cəhd edin',
        //     title: "İnternet Yoxdur",
        //     onCancelBtnTap: (){
        //       Navigator.pop(context);
        //     },
        //     onConfirmBtnTap: (){
        //
        //        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyCustomSplashScreen()));
        //     }
        // );
      }
    });
    mytimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        count++;
        if (count == 7) {
          progress = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Constants.primaryColor,
        body: Stack(
          children: [
            Column(
              children: [
                AnimatedContainer(
                    duration: Duration(milliseconds: 2000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: _height / _fontSize / 1.2),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 1000),
                  opacity: _textOpacity,
                  child: Text(
                    'Namaz Vaxtı',
                    style: TextStyle(
                      fontFamily: "Oswald",
                      color: Colors.white,
                      fontSize: animation1.value,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                opacity: _containerOpacity,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 2000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: _width / _containerSize,
                    width: _width / _containerSize,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // child: Image.asset('assets/images/file_name.png')
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                            child: SvgPicture.asset("assets/svgmosque.svg")),
                        SizedBox(
                          height: 15,
                        ),
                        Visibility(
                            visible: progress,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ))
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
