import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../Constants.dart';
import '../../../../../PageTransition/PageTransition.dart';
import '../../../../MenuPages/Ekarts/Ekarts.dart';

class EkardTile extends StatefulWidget {
  const EkardTile({Key? key}) : super(key: key);

  @override
  State<EkardTile> createState() => _EkardTileState();
}

class _EkardTileState extends State<EkardTile> {
  late String imageData;

  late bool dataLoaded;


  var _url = Uri.parse("https://www.gozelislam.com/e-kart/");
  var _metin;


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
        subject: 'www.namazvaxti.org',);
    }
    setState(() {
      isBtn2 = false;
    });
  }

  Future<void> getData() async {
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("short-story10").forEach((
        element) async {
      setState(() {

        image.add(
            element.children[0].children[0].attributes["src"].toString()
        );
          print(image);

      });
    });
  }

  @override
  void initState() {
   // getData();
    // TODO: implement initState
    super.initState();}

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child:


       Container(


            child: Stack(
              alignment: Alignment.center,
              children: [


                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.white,
                  child: Container(

                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                    borderRadius: BorderRadius.only(topRight:  Radius.circular(10) , topLeft: Radius.circular(10))
,
        child: image.isNotEmpty ? CachedNetworkImage(
                            imageUrl:
                            "https://www.gozelislam.com${image[0]}",
                            placeholder: (context, url) => Stack(
                              alignment: Alignment.center,
                              children: [
                                Shimmer(
                                  enabled: true,
                                  gradient: LinearGradient(colors: [Constants.primaryColor, Colors.white, Colors.blueGrey]

                                  ), child: Container(
                                  width: double.infinity,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Constants.primaryColor,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))

                                  ),
                                ), ),
                                Image.asset("assets/pngmosque.png", width: MediaQuery.of(context).size.width/3,) ,
                              ],
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ) : Stack(
          alignment: Alignment.center,
          children: [
            Shimmer(
              enabled: true,
              gradient: LinearGradient(colors: [Constants.primaryColor, Colors.white, Colors.blueGrey]

              ), child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))

              ),
            ), ),
            Image.asset("assets/pngmosque.png", width: MediaQuery.of(context).size.width/3,) ,
          ],
        ) ,
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(onPressed: () {
                                Navigator.push(context, SizeTransition2(Ekarts()));
                              },
                                  child: Text("Daha çox", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)),
                              TextButton(onPressed: () {
                                saveAndShare(image[0]);

                              },
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.share, color: Constants.primaryColor,),
                                      SizedBox( width: 20,),
                                      Text("Paylaş", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)

                                    ],
                                  )),


                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),





              ],
            ),
          ),

      );

    }


}
