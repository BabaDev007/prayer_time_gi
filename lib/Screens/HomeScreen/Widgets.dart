
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import '../../Constants.dart';
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



class PrayerTimes extends StatefulWidget {
  const PrayerTimes({Key? key}) : super(key: key);

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Container(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.sunny_snowing, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "Sübh", style: TextStyle(color: Constants.primaryColor, fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.sunny, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "Günəş", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),

              ), const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(FontAwesomeIcons.solidSun, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "Zöhr", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(FontAwesomeIcons.sun, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "Əsr", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.sunny_snowing, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "Axşam", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Icon(FontAwesomeIcons.solidMoon, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "İşa", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Icon((Icons.nights_stay_rounded), color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "Gecə yarısı", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),





            ],
          ),
        ),
        height: Get.size.height,
        width: Get.size.width/1.2,

      ),
    );
  }
}

class PrayerTimes2 extends StatefulWidget {
  const PrayerTimes2({Key? key}) : super(key: key);

  @override
  State<PrayerTimes2> createState() => _PrayerTimes2State();
}

class _PrayerTimes2State extends State<PrayerTimes2> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),

                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "İmsak", style: TextStyle(color: Constants.primaryColor, fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),

                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "İşrak", style: TextStyle(color: Constants.primaryColor, fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "Kərahət", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),

              ), const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "Əsr-i Sani", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "İsfirar", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "İştibak", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "İşa-i Sani", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(height: 0, thickness: 0.5,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Icon(Icons.add, color: Constants.primaryColor, size: 17,),
                    AutoSizeText(minFontSize: 10, maxFontSize: 18 , "Təhəccüd", style: TextStyle(color: Constants.primaryColor,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(minFontSize: 10, maxFontSize: 18 , "05:25", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),




            ],
          ),
        ),
        height: Get.size.height/3.3,
        width: Get.size.width/1.2,

      ),
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
      case "amber" : _bacgroundColor = Colors.amber;
      break;
      case "white" : _bacgroundColor = Colors.white;
      break;
    }
    bashliq = box.read("bashliq");
    metin = box.read("metin");
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
          title: Text("Günün Mövzusu", style: TextStyle(fontFamily: "Oswald"),) ,
          centerTitle: true,
        ),
        body:
      metin == null ?  Center(child: CircularProgressIndicator(),) :

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


  Future<void>getMovzuPage()async{
    var _url = Uri.parse(box.read("_link2"));
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("blog-info").forEach((element)async {

      box.write("_metin3",element.children[2].children[1].text.toString() );
      box.write("_bashliq3", element.children[0].text.toString());
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
      case "amber" : _bacgroundColor = Colors.amber;
      break;
      case "white" : _bacgroundColor = Colors.white;
      break;
    }
getMovzuPage();
 bashliq10 = box.read("_bashliq3")?? "İnternet Bağlantınızı Yoxlayın!!!";
 metin10 = box.read("_metin3") ?? "İnternet Bağlantınızı Yoxlayın!!!";
 _link2 = box.read("_link2");
zor();

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: _bacgroundColor,
      appBar: AppBar(
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
        backgroundColor: Constants.primaryColor,
        title: Text("Dini Mövzular", style: TextStyle(fontFamily: "Oswald"),) ,
        centerTitle: true,
      ),
      body:

      Scrollbar(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[

            Container(
              height: Get.size.height/7,
              child: Center(child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: AutoSizeText(
               bashliq10, textAlign: TextAlign.justify, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold , fontFamily: 'Oswald' ),),
              )),),
            Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('${metin10} }' ,style: TextStyle(fontSize:_fontSize, fontFamily: "GentiumBookPlus", fontWeight: FontWeight.w300, color: Colors.black.withOpacity(.7) ),),
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
