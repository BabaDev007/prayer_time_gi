import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/BookCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/Buttons.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/DayHeader.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/DiniSualGonderCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/E-cardT%C4%B0le.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/GunlukMovzu.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/HimetliCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/JumahCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/KufrCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/RamazanCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/ShareCad.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/ShuhadaCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/YouTubeCard/models/channel_model.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/YouTubeCard/models/video_model.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/YouTubeCard/youtubeCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/zikrcard.dart';
import 'package:prayer_time_gi/StateManagement/StateManagement.dart';
import '../../../../Constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';
import 'package:jiffy/jiffy.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/YouTubeCard/screens/home_screen.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/YouTubeCard/services/api_service.dart';
import '../../../../../../Constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../PageTransition/PageTransition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Day extends StatefulWidget {
  @override
  State<Day> createState() => _DayState();
}

class _DayState extends State<Day> {
  GetStorage box = GetStorage();
  Controller c = Get.put(Controller());
  var scrollController = ScrollController();
  var offsets = false;
  var _url = Uri.parse("https://www.gozelislam.com/");
  var bashliq;
  var metin;
  Channel? _channel;
  bool _isLoading = false;
  late YoutubePlayerController _controller;
  Video? video;
  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCV5G4F5n17ZCVWtGUxJ6z4A');
    setState(() {
      _channel = channel;
      video = _channel!.videos[0];
    });
  }

  Future<void> sss() async {
    _controller.pause();
  }
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
  var zor;
  var hikmetliSoz;
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
  List weekday = [
    "Bazar ertəsi",
    "Çərşənbə axşamı",
    "Çərşənbə",
    "Cümə axşamı",
    "Cümə",
    "Şənbə",
    "Bazar"
  ];
  var noOfWeek = 1;

  @override
  void initState() {
    _initChannel();
    noOfWeek = DateTime.now().weekday;
    print(" bize lazim olan no${noOfWeek}");


    zor = box.read("time");
    getDataMovzu();
    c.isShowShuhada.value = box.read("isShowShuhada") ?? true;
    c.isShowDua.value = box.read("isShowDua") ?? true;
    c.isShowGunlukMovzu.value = box.read("isShowGunlukMovzu") ?? true;
    c.isShowHikmetliSoz.value = box.read("isShowHikmetliSoz") ?? true;
    c.isShowBook.value = box.read("isShowBook") ?? true;
    c.isShowEKart.value = box.read("isShowEKart") ?? true;

    scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final minOffset = scrollController.position.minScrollExtent;
    final maxOffset = scrollController.position.maxScrollExtent;
    final isOutOfRange = scrollController.position.outOfRange;

    final isScrolling = maxOffset > scrollController.offset &&
        minOffset < scrollController.offset;

    // This code doesn't print anything.
    if (scrollController.offset > 100) {
      setState(() {
        offsets = true;
      });
    } else {
      setState(() {
        offsets = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor.withOpacity(.1),
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "assets/calendar.png",
                    color: Colors.white,
                  ),
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                backgroundColor: Constants.primaryColor.withOpacity(.6),
                shadowColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${weekday[DateTime.parse("${zor['${c.difference2}']['baseTime']["todayDate"]}").weekday - 1]}",
                      style:
                          TextStyle(fontFamily: "Oswald", color: Colors.white),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.primaryColor),
                          color: Colors.white.withOpacity(.7),
                          borderRadius: BorderRadius.circular(40)),
                      width: Get.width / 2.8,
                      height: Get.height / 16,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: AnimatedSwitcher(
                            switchInCurve: Curves.easeIn,
                            duration: Duration(milliseconds: 400),
                            child: offsets
                                ? FittedBox(
                                    child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                        "${c.globalTimeName}\n${c.globalTimeTime} "
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Constants.primaryColor,
                                            fontFamily: "Oswald")),
                                  ))
                                : Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            flex: 5,
                                            child: FittedBox(
                                                child: AutoSizeText(
                                              "${c.globalTime2.toString()}",
                                              maxLines: 1,
                                              maxFontSize: 14,
                                              minFontSize: 10,
                                              style: TextStyle(
                                                  color: Constants.primaryColor,
                                                  fontFamily: "Oswald"),
                                            ))),
                                        Expanded(
                                            flex: 4,
                                            child: FittedBox(
                                                child: AutoSizeText(
                                              "${c.globalHicriTime.toString().capitalize}",
                                              maxLines: 1,
                                              maxFontSize: 14,
                                              minFontSize: 10,
                                              style: TextStyle(
                                                  color: Constants.primaryColor
                                                      .withOpacity(.8),
                                                  fontFamily: "Oswald"),
                                            ))),
                                      ],
                                    ),
                                  )),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            controller: scrollController,
            child: Column(

              children: [
                SizedBox(
                  height: 100,
                ),
                DayHeader(),
                DayButtons(),
                KufrCard(),
                Visibility(visible: c.isShowBook.value, child: BookCard()),
                Visibility(
                  visible: (noOfWeek == 5) && (c.isJumah.isTrue),
                    child:
                JumahCard()

                ),
                Visibility(
                    visible: c.globalHicriTime.toString().contains("RAMEZÂN") || c.globalHicriTime.toString().contains("1  ŞEVVÂL") || c.globalHicriTime.toString().contains("2  ŞEVVÂL") || c.globalHicriTime.toString().contains("1  ŞEVVÂL") || c.globalHicriTime.toString().contains("2  ŞEVVÂL"),
                    child: RamadanCard()),
                Visibility(
                    visible: c.isShowHikmetliSoz.value, child: HikmetliSozCard()),

                Visibility(
                    visible: c.isShowGunlukMovzu.value, child: GunlukMovzuCard()),
                // Visibility(
                //   visible: c.isShowDua.value,
                //     child: DuaCard()),
                EkardTile(),
                ZikrCard(),
                 SohbetCard(),
                Visibility(visible: c.isShowShuhada.value, child: ShuhadaCard()),
                SualGonder(),
                ShareCard(),
              ],
            ),
          ),
        ));
  }
}
