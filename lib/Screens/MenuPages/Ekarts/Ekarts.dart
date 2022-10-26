import 'dart:io';
import 'dart:ui';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:path_provider/path_provider.dart';
import '../../../Constants.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';


class Ekarts extends StatefulWidget {





  @override
  State<Ekarts> createState() => _EkartsState();
}

class _EkartsState extends State<Ekarts> with TickerProviderStateMixin{

  late String imageData;

  late bool dataLoaded;


  var _url = Uri.parse("https://www.gozelislam.com/e-kart/");


  var image = [];
  var isBtn2 = false;
  Future<Null> saveAndShare(String zor) async {
    setState(() {
      isBtn2 = true;
    });
    final RenderObject? box = context.findRenderObject();
    if (Platform.isAndroid) {

      var response = await get(Uri.parse("https://www.gozelislam.com${zor}"));
      final documentDirectory = (await getExternalStorageDirectory())?.path;
      File imgFile = new File('$documentDirectory/flutter.jpg');
      imgFile.writeAsBytesSync(response.bodyBytes);

      Share.shareFiles(['$documentDirectory/flutter.jpg'],
          subject: 'www.namazvaxti.org',
          text: 'www.namazvaxti.org');
    } else {
      Share.share("www.namazvaxti.org",
        subject: 'www.namazvaxti.org', );

    }
    setState(() {
      isBtn2 = false;
    });
  }
  Future<void>getData()async{

    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("short-story10").forEach((element)async {

      setState((){


        image.add(
            element.children[0].children[0].attributes["src"].toString()
        );




      });
    });

  }

  //you can save video files too.


  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    image = [
" "
    ];
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
extendBodyBehindAppBar: true,
      backgroundColor: Constants.primaryColor,
        resizeToAvoidBottomInset: false,
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
                leading: IconButton(onPressed: () {     Navigator.pop(context);
                }, icon: Icon(Icons.chevron_left, size: 30,),),
                elevation: 0,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
                ),

                backgroundColor: Constants.primaryColor.withOpacity(.6),
                centerTitle: true,
                shadowColor: Colors.transparent,
                title: Text("E-Kartlar", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
              ),
            ),
          ),
        ) ,




        body:  image.isNotEmpty ?
        Stack(
          children: [
            Scrollbar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: image.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,

                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: Duration(milliseconds: 500),
                        columnCount: 2,
                        child: ScaleAnimation(
                            duration: Duration(milliseconds: 900),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Lottie.asset("assets/loding.json", height: 80),

                                    InkWell(
                                      onTap:(){ _showSecondPage(context, index);},
                                      child: GridTile(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5)
                                          ) ,
                                          child: Hero(


                                              tag: "my-hero-animation-tag",
                                              child: Image.network(
                                                "https://www.gozelislam.com${image[index]}",
                                              )),
                                        ),),
                                    ),

                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: FractionallySizedBox(
                                        heightFactor: .25,
                                        widthFactor: 1,
                                        child: Container(
                                          child:    Align(
                                            alignment: Alignment.topRight,
                                            child: Center(
                                              child: FittedBox(
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        shadowColor: Colors.transparent,
                                                        backgroundColor: Colors.transparent,
                                                        elevation: 0
                                                    ),

                                                    onPressed: (){

                                                      saveAndShare(image[0]);
                                                    }, child: Icon(Icons.share, size: 35,color: Colors.white,)),
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(.4),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                        ),
                                      ),
                                    ),


                                  ],
                                ))));

                  },

                ),
              ),
            ),
            isBtn2 == false ? SizedBox()  : Center(child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue.withOpacity(0.6),
                child: Center(child: Lottie.asset("assets/loding.json", height: 80),))
            )
          ],
        ) : Center(child: Lottie.asset("assets/loding.json", height: 80),) );

  }

  void _showSecondPage(BuildContext context, int index){
    Navigator.of(context).push(
        MaterialPageRoute(builder:
            (context)=>Scaffold(
              backgroundColor: Constants.primaryColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: "my-hero-animation-tag", child: Image.network("https://www.gozelislam.com${image[index]}"),
              ),
            ),
          ),
        )
        )
    );
  }
}



















































