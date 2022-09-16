import 'dart:async';
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
import 'Dini1.dart';
import 'package:lottie/lottie.dart';




class DiniBilgiler1Page extends StatefulWidget {
  final Uri link;
  final String bashliq;
  const DiniBilgiler1Page({super.key, required this.link, required this.bashliq});
  @override
  State<DiniBilgiler1Page> createState() => _DiniBilgiler1PageState();
}

class _DiniBilgiler1PageState extends State<DiniBilgiler1Page> {
  var papkaza;
  List<ReadFile> movzuAdi = [];
  Future<void>getData()async{
    var response = await http.get(widget.link);
    final body = response.body;
    final document = parser.parse(body);

    var res1 = document.getElementsByClassName("optionshort2").forEach
      ((element)async {
       print("file${element.children[0].children[1].attributes['href'].toString()}");
print(element.text.toString());

      setState(() {

        movzuAdi.add(ReadFile(Icon(Icons.article_outlined),   element.text.toString().substring(5), false, element.children[0].children[1].attributes['href'].toString() )

           );


      });






    });


    var res = document.getElementsByClassName("card2").forEach((element)async {
  // print("papka link ${element.children[0].children[0].children[1].children[0].attributes['href'].toString()}");

      setState(() {
        if  (element.children[0].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[0].children[0].children[0].text, true, element.children[0].children[0].children[0].children[0].attributes['href'].toString()
              ));

        }
        if  (element.children[0].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[0].children[0].children[1].text,true, element.children[0].children[0].children[1].children[0].attributes['href'].toString()
          ));
        }


        if  (element.children[1].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[1].children[0].children[0].text, true, element.children[1].children[0].children[0].children[0].attributes['href'].toString()
          ));

        }
        if  (element.children[2].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[2].children[0].children[1].text, true, element.children[2].children[0].children[1].children[0].attributes['href'].toString()
          ));
        }

        if  (element.children[3].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[3].children[0].children[0].text, true, element.children[3].children[0].children[0].children[0].attributes['href'].toString()
          ));

        }
        if  (element.children[4].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[4].children[0].children[1].text,true, element.children[4].children[0].children[1].children[0].attributes['href'].toString()
          ));
        }

        if  (element.children[5].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[5].children[0].children[0].text,true, element.children[5].children[0].children[0].children[0].attributes['href'].toString()
          ) );

        }
        if  (element.children[6].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[6].children[0].children[1].text,true, element.children[6].children[0].children[1].children[0].attributes['href'].toString()
          ) );
        }

        if  (element.children[7].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[7].children[0].children[0].text,true, element.children[7].children[0].children[0].children[0].attributes['href'].toString()
          ) );

        }
        if  (element.children[8].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[8].children[0].children[1].text,true, element.children[8].children[0].children[1].children[0].attributes['href'].toString()
          ) );
        }

        if  (element.children[9].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[9].children[0].children[0].text,true, element.children[9].children[0].children[0].children[0].attributes['href'].toString()
          ) );

        }
        if  (element.children[10].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[10].children[0].children[1].text,true, element.children[10].children[0].children[1].children[0].attributes['href'].toString()
          ));
        }

        if  (element.children[11].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[11].children[0].children[0].text,true, element.children[11].children[0].children[0].children[0].attributes['href'].toString()
          ));

        }
        if  (element.children[12].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[12].children[0].children[1].text,true, element.children[12].children[0].children[1].children[0].attributes['href'].toString()
          ) );
        }

        if  (element.children[13].children[0].children[0].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[13].children[0].children[0].text,true, element.children[13].children[0].children[0].children[0].attributes['href'].toString()
          ) );

        }
        if  (element.children[14].children[0].children[1].text != null) {
          movzuAdi.add(ReadFile(
              Icon(Icons.folder_copy, color: Constants.primaryColor,),
              element.children[14].children[0].children[1].text,true, element.children[14].children[0].children[1].children[0].attributes['href'].toString()
          ));
        }















      });
    });

  }
   Future<void>waitOne3Seconds ()async{
   await getData();
   var timer = Timer.periodic(Duration(seconds: 1), (timer) {
     setState(() {

     });
   });
   }
  @override
  void initState() {
    waitOne3Seconds();
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
      body: movzuAdi.isNotEmpty ? AnimationLimiter(
        child: Scrollbar(
          child: RefreshIndicator(
            onRefresh: () async{
              movzuAdi.length = 0;
              await getData();
              print(papkaza);
              },
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
                                    movzuAdi[index].metod == true ? Navigator.push(context, SizeTransition2(DiniBilgilerPage1(Uri.parse(movzuAdi[index].link)))) : Navigator.push(context, SizeTransition2(DiniReader(url: Uri.parse(movzuAdi[index].link),)));
                                    // print(movzuAdi[index].metod == true);
                                    // print(movzuAdi[index].name);
                                    // print(movzuAdi[index].link);

                                  },
                                  leading: movzuAdi[index].icon ,
                                  title: Text( movzuAdi[index].name, maxLines: 1 , style: TextStyle(overflow: TextOverflow.ellipsis, ),),
                                  trailing: Icon(Icons.chevron_right),



                                )))
                    ),
                  ),
                );
              },

            ),
          ),
        ),
      ) :  Center(child: Lottie.asset("assets/loding.json", height: 80),),
    );
  }
}

class ReadFile{
  final Icon icon;
  final String name;
  final bool metod;
  final String link;
  ReadFile(this.icon,  this.name, this.metod, this.link,);
}




