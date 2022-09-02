
import 'dart:async';
import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class Stack1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      color: Constants.primaryColor,
    );
  }
}












class DaylyTheme extends StatefulWidget {


  @override
  State<DaylyTheme> createState() => _DaylyThemeState();
}

class _DaylyThemeState extends State<DaylyTheme> {

  var bashliq;
  var metin;
  double _fontSize = 16;
  var _bacgroundColor = Colors.white;
  var _box;
  GetStorage box = GetStorage();


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
      case "amber" : _bacgroundColor = Colors.amber.shade300;
      break;
      case "white" : _bacgroundColor = Colors.white;
      break;
    }
    bashliq = box.read("bashliq") ?? "Dişdə dolğu və diş qapağının olması";
    metin = box.read("metin") ?? Constants().metin;
    // TODO: implement initState
    super.initState();
  }
  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: _bacgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () => Get.defaultDialog(
                backgroundColor: Colors.teal,
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
                                    _bacgroundColor = Colors.white;
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

                                  _bacgroundColor = Colors.amber.shade300;
                                });
                              },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.amber.shade300,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState((){
                                    _bacgroundColor = Colors.white;
                                    box.write("arxaFon", "white");

                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
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
          ),
        ],
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        title: Text("Günlük Mövzu", style: TextStyle(fontFamily: "Oswald"),) ,
        centerTitle: true,
      ),
      body:
      metin == null ?  Center(child: Lottie.asset("assets/loding.json", height: 80),) :

      Scrollbar(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[

            Container(
              height: Get.size.height/7,
              child: Center(child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: AutoSizeText(
                  bashliq, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold , fontFamily: 'Oswald' ),),
              )),),
            Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(metin,style: TextStyle(fontSize: _fontSize, fontFamily: "GentiumBookPlus",  fontWeight: FontWeight.w100, color: Colors.black.withOpacity(.7) ),),
                )),
            Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(onPressed: () {
                    _launchUrl('https://www.gozelislam.com');
                  },
                      child: Center(child: Text('www.gozelislam.com' ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100, color: Colors.blue ),))),
                )),

            //3

          ],
        ),
      ),
    );



  }
}

class Themes extends StatefulWidget {
  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {

  var _bashliq2;
  var _metin2;
  Future<void> getMovzuDialog() async {
    var _url = Uri.parse("https://www.gozelislam.com/");
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("costom4").forEach((element) {
      setState(() {
        _bashliq2 =
            element.children[0].children[0].children[0].children[0].children[0]
                .text.toString();
        _metin2 = element.children[0].children[0].children[1].text.toString();
      });
      box.write("_metin2", _metin2);
      box.write("_bashliq2", _bashliq2);
      box.write("_link2",
          element.children[0].children[0].children[0].children[0]
              .attributes['href'].toString());
    });
    print(box.read("_link2"));
  }
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
  var bashliq;
  var metin ;


  var bashliq10;
  var metin10;

  var _url = Uri.parse("https://www.gozelislam.com/");

bool _show = true;
  Future<void>getMovzuPage()async{
    setState(() {
      _show = false;
    });
    var _url = Uri.parse(box.read("_link2"));
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("blog-info").forEach((element)async {

    await  box.write("_metin3",element.children[2].children[1].text.toString() );
     await box.write("_bashliq3", element.children[0].text.toString());
      setState(() {
        bashliq10 = box.read("_bashliq3");
        metin10 = box.read("_metin3");
        _show = true;
      });
    });
  }
  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }
  void zor (){
    setState((){

    });
  }
  var _link2;
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
      case "white" : _bacgroundColor = Colors.white;
      break;
    }


    bashliq10 = box.read("_bashliq3")?? "Dişdə dolğu və diş qapağının olması";
    metin10 = box.read("_metin3") ?? Constants().metin;
    _link2 = box.read("_link2");

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
getMovzuDialog();
        getMovzuPage();

      }, child: Icon(Icons.refresh), backgroundColor: Constants.primaryColor,

      ),
      backgroundColor: _bacgroundColor,
      appBar:

      PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              leading: SizedBox(),
              actions: [ IconButton(
                icon: const Icon(Icons.settings),
                color: Colors.white,
                onPressed: () => Get.defaultDialog(
                    backgroundColor: Colors.teal,
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
                                        _bacgroundColor = Colors.white;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
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
                                  InkWell(
                                    onTap: (){
                                      setState((){
                                        _bacgroundColor = Colors.white;
                                        box.write("arxaFon", "white");

                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
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
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Dini Mövzular", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,







      body:
_show ?
      Scrollbar(
        child: RefreshIndicator(
          onRefresh: ()async{
            await getMovzuDialog();
            getMovzuPage();
          },
          child: ListView(
            children: <Widget>[


              Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            bashliq10, textAlign: TextAlign.justify, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold , fontFamily: 'Oswald' ),),
                        ),
                        Text('${metin10}' ,style: TextStyle(fontSize:_fontSize, fontFamily: "GentiumBookPlus", fontWeight: FontWeight.w300, color: Colors.black.withOpacity(.9) ),),
                        TextButton(onPressed: () {
                          _launchUrl('https://www.gozelislam.com');
                        },
                            child: Center(child: Text('www.gozelislam.com' ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100, color: Colors.blue ),)
                            )),
                      ],
                    ),
                  )),



              //3

            ],
          ),
        ),
      ) : Center(child: Lottie.asset("assets/loding.json", height: 80),)
    );



  }
}
