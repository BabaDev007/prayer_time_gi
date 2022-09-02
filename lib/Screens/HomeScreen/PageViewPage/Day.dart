import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/widgets/Buttons.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/widgets/DayHeader.dart';
import '../../../Constants.dart';
import 'package:get/get.dart';

class DayPage extends StatefulWidget {

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  bool showDate = true;
var scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(_onScroll);
    // TODO: implement initState
    super.initState();
  }
  void _onScroll() {
    final offset = scrollController.offset;
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
        Text("Bugün", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
        Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 2),
          child: Container(
            padding: EdgeInsets.all(  showDate ? 8 : 4),
            decoration: BoxDecoration(
             border: Border.all(color: Colors.white),
              color: Constants.primaryColor,
              borderRadius: BorderRadius.circular(40)
            ),
            width: Get.width/3.5,
            height: Get.height/15,
            child:   Center(
              child: AnimatedSwitcher(
              switchInCurve: Curves.easeIn,
                duration: Duration(milliseconds: 400),
                 child: showDate ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(flex:5, child: AutoSizeText("14 fevral, Çərşənbə", maxLines: 1, maxFontSize: 14, minFontSize: 10, style: TextStyle(color: Colors.white, fontFamily: "Oswald"), )),
                    Expanded(flex: 4, child: AutoSizeText("5 safer 1444", maxLines: 1, maxFontSize: 14, minFontSize:10 ,style: TextStyle(color: Colors.white.withOpacity(.8), fontFamily: "Oswald" ),)),
                  ],
                ): FittedBox(child: Text("Zöhr\n14:25", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "Oswald" )))
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

    body: ListView(
      children: [
       DayHeader(),
        DayHeader(),
        DayHeader(),
       DayButtons(),




       // Card(
       //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
       //   color: Colors.white,
       //   child: Column(
       //     children: [
       //
       //     ],
       //   ),
       // )

      ],
    )

    );
  }
}
