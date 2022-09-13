import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/Buttons.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/DayHeader.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/DiniSualGonderCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/Dua.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/E-cardT%C4%B0le.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/GunlukMovzu.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/HimetliCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/KufrCard.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/ShareCad.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/zikrcard.dart';
import 'package:prayer_time_gi/StateManagement/StateManagement.dart';
import '../../../../Constants.dart';
import 'package:get/get.dart';


class DayPage extends StatefulWidget {

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  Controller c = Get.put(Controller());

  bool showDate = true;
var scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(_onScroll);
    // TODO: implement initState
    super.initState();
  }
   double offset = 0;

  void _onScroll() {
    offset = scrollController.offset;


    final minOffset =scrollController.position.minScrollExtent;
    final maxOffset =scrollController.position.maxScrollExtent;
    final isOutOfRange =scrollController.position
        .outOfRange;

    final hasReachedTheEnd = offset <= 10;
    final hasReachedTheStart = offset <= minOffset && !isOutOfRange;
    final isScrolling = maxOffset > offset && minOffset < offset;

    // This code doesn't print anything.
    if (isScrolling) {
      setState(() {
        showDate = false;
      });
    } else if (hasReachedTheStart) {
      setState(() {
        showDate = true;
      });    } else if (hasReachedTheEnd) {
      print('hasReachedTheEnd');
    } else {
      print('IDK');
    }
  }
  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();

    return  Scaffold(
        backgroundColor:  Constants.primaryColor.withOpacity(.1),
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
        preferredSize: Size(
        double.infinity,
        56.0,
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),

    child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
    child: AppBar(

    leading: Icon(Icons.view_day),
    elevation: 0,

    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
    ),

    backgroundColor: Constants.primaryColor.withOpacity(.6),

    shadowColor: Colors.transparent,

    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Bugün", style: TextStyle(fontFamily: "Oswald", color: Colors.white),),
        Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 2),
          child: Container(
            decoration: BoxDecoration(

             border: Border.all(color: Constants.primaryColor),
              color: Colors.white,
              borderRadius: BorderRadius.circular(40)
            ),
            width: Get.width/3.5,
            height: Get.height/15,
            child:   Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: AnimatedSwitcher(
                switchInCurve: Curves.easeIn,
                  duration: Duration(milliseconds: 200),
                   child: offset < 5 ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(flex:5, child: AutoSizeText("${c.globalTime.toString()}", maxLines: 1, maxFontSize: 14, minFontSize: 10, style: TextStyle(color: Constants.primaryColor, fontFamily: "Oswald"), )),
                      Expanded(flex: 4, child: AutoSizeText("${c.globalHicriTime.toString()}", maxLines: 1, maxFontSize: 14, minFontSize:10 ,style: TextStyle(color: Constants.primaryColor.withOpacity(.8), fontFamily: "Oswald" ),)),
                    ],
                  ): FittedBox(child: Text("${c.globalTimeName}\n${c.globalTimeTime} ".toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "Oswald" )))
                ),
              )



            ),
          ),
        )
      ],
    ),
    ),
    ),
    ),
    ) ,

    body: Scrollbar(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          DayHeader(),
          DayButtons(),
          KufrCard(),
          HikmetliSozCard(),
          GunlukMovzuCard(),
          DuaCard(),
          EkardTile(),
          ZikrCard(),
          SualGonder(),
          ShareCard(),










        ],
      ),
    )

    );
  }
}
