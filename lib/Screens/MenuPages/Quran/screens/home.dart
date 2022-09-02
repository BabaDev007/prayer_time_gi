  import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Quran/screens/reading_page.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import '../models/surah.dart';


class QuranPage extends StatefulWidget {
  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> with TickerProviderStateMixin {
  List<Surah> surahList = [];
  int selectedIndex = 0;
  bool isReverse = false;
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/surah.json');
    final data = await json.decode(response);
    for (var item in data["chapters"]) {
      surahList.add(Surah.fromMap(item));
    }
    debugPrint(surahList.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
leading: SizedBox(),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Quran-ı Kərim", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,




      body: surahList.isEmpty
          ? Center(child: Lottie.asset("assets/loding.json", height: 80),)
          : chaptersList(isReverse ? surahList.reversed.toList() : surahList),
    );
  }

  Widget chaptersList(List<Surah> chapters) {
    return AnimationLimiter(
      child: Scrollbar(
        child: ListView.separated(
          physics:  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          controller: _controller,
          itemBuilder: (context, index) =>
              AnimationConfiguration.staggeredList(
                position: index,
                delay: Duration(milliseconds: 80),
                child: SlideAnimation(
                  duration: Duration(milliseconds: 1800),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: 30,
                  verticalOffset: 300.0,
                  child: FlipAnimation(
                      duration: Duration(milliseconds: 3000),
                      curve: Curves.fastLinearToSlowEaseIn,
                      flipAxis: FlipAxis.y,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Constants.primaryColor,
                          child: Text(chapters[index].id.toString(), style: TextStyle(color: Colors.white),),
                        ),
                        title: Text(chapters[index].name),
                        subtitle: Text(chapters[index].versesCount.toString()),
                        trailing: Text(
                          chapters[index].arabicName,
                          style: GoogleFonts.akronim(
                            fontSize: 18,
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                SurahPage(surah: chapters[index], name: chapters[index].name,),
                          ),
                        ),
                      ),
                  ),
                ),
              ),


          separatorBuilder: (context, index) =>




              AnimationConfiguration.staggeredList(
                position: index,
                delay: Duration(milliseconds: 80),
                child: SlideAnimation(
                  duration: Duration(milliseconds: 1800),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: 30,
                  verticalOffset: 300.0,
                  child: FlipAnimation(
                      duration: Duration(milliseconds: 3000),
                      curve: Curves.fastLinearToSlowEaseIn,
                      flipAxis: FlipAxis.y,
                      child: Divider()
                  ),
                ),
              ),
          itemCount: chapters.length,
        ),
      ),
    );
  }
}
