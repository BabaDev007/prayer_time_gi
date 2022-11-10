import 'dart:async';
import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';


class DiniReader extends StatefulWidget {
final  Uri url;

  const DiniReader({super.key, required this.url});
  @override
  State<DiniReader> createState() => _DiniReaderState();
}

class _DiniReaderState extends State<DiniReader> {



  double _fontSize = 16;
  var _bacgroundColor = Colors.white;
  var _box;
  GetStorage box = GetStorage();
  void _increaseFontSize(){
    setState((){
      if(_fontSize < 51)
        _fontSize++;
    });
  }
  void _removwFontSize(){
    setState((){
      if(_fontSize > 10)
        _fontSize--;
    });
  }



  var bashliq10;
  var metin10;

  var _url = Uri.parse("https://www.gozelislam.com/");



  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }
  void zor (){
    setState((){

    });
  }
  var _link2;



  Future<void>getData(Uri text)async{
    var bashliq;
    var metin;
 print(text.toString());
    var response = await http.get(text);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("tabbable").forEach
      ((element)async {
     metin= element.children[1].text.toString();
      setState(() {
       metin10 = metin;
      });





    });
    var res1 = document.getElementsByClassName("blog-info").forEach
      ((element)async {
      bashliq = element.children[0].text.toString();


      setState(() {

        bashliq10 = bashliq;


      });

      print("bashliq : ${bashliq.toString()}");




    });

  }


  @override
  void initState() {
    _box =  box.read("arxaFon") ?? "white";
    _fontSize = box.read("font") ?? 15;

    switch(_box ){
      case "white70" : _bacgroundColor = Colors.white70;
      break;
      case "lightBlueAccent": _bacgroundColor = Colors.lightBlueAccent;
      break;
      case "grey" : _bacgroundColor = Colors.grey;
      break;
      case "amber" : _bacgroundColor = Colors.amber.shade100;
      break;

    }
getData(widget.url);

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: _bacgroundColor,
      appBar:
      PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              actions: [ IconButton(
                icon: const Icon(Icons.settings),
                color: Colors.white,
                onPressed: () => Get.defaultDialog(
                    backgroundColor: Constants.primaryColor,
                    title: "Düzəlişlər",
                    titleStyle: TextStyle(color: Colors.white70),
                    content: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Arxa Fon", style: TextStyle(color: Colors.white70),),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      setState((){
                                        box.write("arxaFon", "white");
                                        _bacgroundColor = Colors.white70;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white70,
                                          shape: BoxShape.circle,

                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState((){
                                        box.write("arxaFon", "lightBlueAccent");

                                        _bacgroundColor = Colors.lightBlueAccent;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlueAccent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState((){
                                        box.write("arxaFon", "grey");

                                        _bacgroundColor = Colors.grey;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell( onTap: (){
                                    setState((){
                                      box.write("arxaFon", "amber");

                                      _bacgroundColor = Colors.amber.shade100;
                                    });
                                  },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.amber.shade100,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Zoom", style: TextStyle(
                                color: Colors.white70
                            ),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: (){
                                        setState((){
                                          _fontSize--;
                                          box.write("font", _fontSize);
                                        });
                                      },
                                      child: Icon(Icons.remove, color: Colors.white, size: 30,)),
                                  Icon(Icons.text_fields, size: 30),
                                  InkWell(
                                      onTap: (){
                                        setState((){
                                          _fontSize++;
                                          box.write("font", _fontSize);
                                        });
                                      },
                                      child: Icon(Icons.add, color: Colors.white,size: 30))
                                ],
                              ),
                            )

                          ],
                        )
                      ],
                    )
                ),
              ),],
              leading: IconButton(onPressed: () {      Navigator.pop(context)  ;
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







      body:

      metin10 != null ? Scrollbar(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[


            Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bashliq10.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ,  ),),

                      Text('${metin10.toString()}' , textAlign:TextAlign.justify, style: TextStyle(fontSize:_fontSize, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(.9) ),),
                    ],
                  ),
                )),
        Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(onPressed: () {
                    _launchUrl('https://www.gozelislam.com');
                  },
                      child: Center(child: Text('www.gozelislam.com' ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100, color: Colors.blue ),))),
                )


            //3

          ],
        ),
      ) : Center(child: Lottie.asset("assets/loding.json", height: 80),),
  );}}