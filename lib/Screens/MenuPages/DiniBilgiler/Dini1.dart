import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:prayer_time_gi/Screens/MenuPages/DiniBilgiler/reader.dart';
import '../../../PaddingManager.dart';
import '../../../PageTransition/PageTransition.dart';
import 'package:lottie/lottie.dart';

class DiniBilgilerPage1 extends StatefulWidget {
  final Uri url;
  final String bashliq;

  DiniBilgilerPage1(this.url, this.bashliq);

  @override
  State<DiniBilgilerPage1> createState() => _DiniBilgilerPage1State();
}

class _DiniBilgilerPage1State extends State<DiniBilgilerPage1> {



  var movzuAdi1 = [];
  var linkMovzu1 = [];


  Future<void>getData(Uri text)async{
    var papka;
    var link;


    var response = await http.get(text);
    final body = response.body;
    final document = parser.parse(body);
    var res1 = document.getElementsByClassName("optionshort2").forEach
      ((element)async {
      papka = element.text.toString();
      link = element.children[0].children[1].attributes['href'].toString();


      setState(() {
        movzuAdi1.add(papka);

        linkMovzu1.add(link);

      });






    });

  }


  @override
  void initState() {
    getData(widget.url);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Constants.primaryColor,
      appBar:  PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              leading: IconButton(onPressed: () {      Navigator.pop(context); }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("${widget.bashliq}", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,
      body: movzuAdi1.isNotEmpty ? AnimationLimiter(
        child: Scrollbar(
          child: ListView.builder(

            padding: EdgeInsets.symmetric(horizontal: _w / 30, vertical: 100),
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: movzuAdi1.length ,
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
                          child: InkWell(
                            onTap: (){


                            },
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
                   leading: Icon(Icons.text_snippet_outlined, color: Constants.primaryColor,),
                                  title: Text(movzuAdi1[index].toString().substring(7,), maxLines: 1,
                                  style: TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold ),),
                                  trailing:

                                  Icon(Icons.chevron_right),

                                 onTap: (){
                                   Navigator.push(context, SizeTransition2(DiniReader(url: Uri.parse(linkMovzu1[index],))));

                                 },


                                )),
                          ))
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


