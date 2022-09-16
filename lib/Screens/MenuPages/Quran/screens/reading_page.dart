import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:get/get.dart';
import '../../../../Constants.dart';
import '../models/surah.dart';
import 'package:get_storage/get_storage.dart';

class SurahPage extends StatefulWidget {
  final Surah surah;
  final String name;
  SurahPage({required this.surah, required this.name});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  double _fontSize = 25;

  var _bacgroundColor = Colors.white;

  var _box;

  GetStorage box = GetStorage();
@override
  void initState() {
  _box =  box.read("arxaFon") ?? "white";
  _fontSize = box.read("fontQuran") ?? 15;

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
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int count = widget.surah.versesCount;
    int index = widget.surah.id;
    return Scaffold(
      backgroundColor: _bacgroundColor,
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
              actions: [IconButton(
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
              leading: IconButton(onPressed: () {   Navigator.pop(context);
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("${widget.name} surəsi", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,












      body: Scrollbar(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          physics: BouncingScrollPhysics(),

            children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: header(),
          ),
          SizedBox(
            height: 5,
          ),
          RichText(
            textAlign: count <= 20 ? TextAlign.center : TextAlign.justify,
            text: TextSpan(
              children: [
                for (var i = 1; i <= count; i++) ...{
                  TextSpan(
                    text: ' ' +
                        quran.getVerse(index, i, verseEndSymbol: false) +
                        ' ',
                    style: TextStyle(
                      fontFamily: 'AmiriQuran-Regular',
                      fontSize: _fontSize,
                      color: Colors.black87,
                    ),
                  ),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: CircleAvatar(
                        backgroundColor: Constants.primaryColor,
                        child: Text(

                          '$i',
                          textAlign: TextAlign.center,
                          textScaleFactor: i.toString().length <= 2 ? 1 : .8,
                          style: TextStyle(color: Colors.white),
                        ),
                        radius: 14,
                      ))
                }
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget header() {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Text(
          ' ' + quran.getBasmala() + ' ',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ));
  }
}
