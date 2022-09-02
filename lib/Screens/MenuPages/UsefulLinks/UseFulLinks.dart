import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Screens/MenuPages/UsefulLinks/LinkTilel.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../Constants.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';


class UsefulLinks extends StatelessWidget {
  var _tileWidget = [
    LinkTile(name: "www.namazvaxti.org", path: "www.namazvaxti.org", subtitle: "Azərbaycan üçün Namaz Vaxtları"),
    LinkTile(name: "www.huzurpinari.com", subtitle: "Dini mövzular", path: "www.huzurpinari.com", ),
    LinkTile(name: "www.bizimislam.com", path:"www.bizimislam.com", subtitle: "Dini Kitablar"),
    LinkTile(name:"www.veraislam.ru", path:"www.veraislam.ru", subtitle:"Rusca - Dini Mövzular və Sual-Cavab"),
    LinkTile(name:"www.namazvakti.com", path:"www.namazvakti.com",subtitle: "Bütün ölkələrin namaz vaxtları"),
    LinkTile(name:"www.islamicbooksforfree.com",path: "www.islamicbooksforfree.com", subtitle:"Fərqli Dillərdə  Dini Kitablar"),
    LinkTile(name:"www.booksonhook.com", path:"www.booksonhook.com", subtitle:"Fərqli Dillərdə  Dini Kitablar"),
    LinkTile(name:"www.askidakitap.net", path:"www.askidakitap.net", subtitle:"Fərqli Dillərdə  Dini Kitablar")


  ];

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.primaryColor,
   extendBodyBehindAppBar: true,
      appBar:PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              leading: IconButton(onPressed: () {      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return PageViewPage(); }));
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Linklər", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,
      body: Stack(
        children: [

          AnimationLimiter(
            child: ListView.builder(

              padding: EdgeInsets.symmetric(horizontal: _w / 30, vertical: 100 ),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: _tileWidget.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
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
                      child: _tileWidget[index]
                    ),
                  ),
                );
              },

            ),
          ),
        ],
      ),
    );
  }
}


