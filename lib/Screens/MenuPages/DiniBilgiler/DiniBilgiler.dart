import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:prayer_time_gi/Screens/MenuPages/DiniBilgiler/DiniBilgiler1Page.dart';
import '../../../PaddingManager.dart';
import '../../../PageTransition/PageTransition.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';
import 'Dini1.dart';
import 'package:lottie/lottie.dart';




class DiniBilgilerPage extends StatefulWidget {
  @override
  State<DiniBilgilerPage> createState() => _DiniBilgilerPageState();
}

class _DiniBilgilerPageState extends State<DiniBilgilerPage> {
  var _url = Uri.parse("https://www.gozelislam.com");
var movzuAdi = [];
var linkMovzu = [];
  Future<void>getData()async{
var papka, papka1, papka2, papka3, papka4, papka5, papka6, papka7;
var link, link1, link2, link3, link4, link5, link6, link7;
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("col-sm-4").forEach((element)async {
     papka = element.children[0].children[0].text.toString();
     papka1 = element.children[0].children[1].text.toString();
     papka2 = element.children[0].children[2].text.toString();
     papka3 = element.children[0].children[3].text.toString();
     papka4 = element.children[0].children[4].text.toString();
     papka5 = element.children[0].children[5].text.toString();
     papka6 = element.children[0].children[6].text.toString();
     papka7 = element.children[0].children[7].text.toString();

     link = element.children[0].children[0].children[0].attributes['href'].toString();
     link1 = element.children[0].children[1].children[0].attributes['href'].toString();
     link2 = element.children[0].children[2].children[0].attributes['href'].toString();
     link3 = element.children[0].children[3].children[0].attributes['href'].toString();
     link4 = element.children[0].children[4].children[0].attributes['href'].toString();
     link5 = element.children[0].children[5].children[0].attributes['href'].toString();
     link6 = element.children[0].children[6].children[0].attributes['href'].toString();
     link7 = element.children[0].children[7].children[0].attributes['href'].toString();

     setState(() {
       movzuAdi.add(papka);
       movzuAdi.add(papka1);
       movzuAdi.add(papka2);
       movzuAdi.add(papka3);
       movzuAdi.add(papka4);
       movzuAdi.add(papka5);
       movzuAdi.add(papka6);
       movzuAdi.add(papka7);
       linkMovzu.add(link);
       linkMovzu.add(link1);
       linkMovzu.add(link2);
       linkMovzu.add(link3);
       linkMovzu.add(link4);
       linkMovzu.add(link5);
       linkMovzu.add(link6);
       linkMovzu.add(link7);
     });
    });

  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Constants.primaryColor,
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
              leading: IconButton(onPressed: () {      Navigator.pop(context);
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Dini Bilgilər", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,
      body: movzuAdi.isNotEmpty ? AnimationLimiter(
        child: Scrollbar(
          child: ListView.builder(

            padding: EdgeInsets.symmetric(horizontal:_w / 30, vertical: 100),
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: movzuAdi.length ,
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
                      child:   Padding(
                      padding: PaddingManager().prayerTimeWidgetPadding,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).errorColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.2),
                              blurRadius: 30,
                              offset: Offset(20, 30),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),


                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, SizeTransition1(DiniBilgiler1Page(link: Uri.parse(linkMovzu[index]), bashliq: movzuAdi[index],)));
                          },
                          leading: Icon(Icons.folder_copy, color: Colors.greenAccent,),
                          title: Text(movzuAdi[index], style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          trailing: Icon(Icons.chevron_right),



                        )))
                  ),
                ),
              );
            },

          ),
        ),
      ) :  Center(child: Lottie.asset("assets/loding.json", height: 80),),
    );
  }
}






