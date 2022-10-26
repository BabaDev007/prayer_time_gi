import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../Constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class GunlukMovzuCard extends StatefulWidget {

  @override
  State<GunlukMovzuCard> createState() => _GunlukMovzuCardState();
}

class _GunlukMovzuCardState extends State<GunlukMovzuCard> {

  int maxLines = 4;
var visual = "Oxu";
  var _url = Uri.parse("https://www.gozelislam.com/");
  var bashliq;
  var metin;

  var zor = false;
  Future<void> getDataMovzu() async {
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("col-md-8 col-sm-12 col-xs-12")
        .forEach((element) async {
      setState(() {
        bashliq =
            element.children[1].children[0].children[2].children[0].children[0]
                .children[0].children[0].text.toString();
        metin = element.children[1].children[0].children[5].text.toString();
      });
      box.write("bashliq", bashliq);
      box.write("metin", metin);

    }
    );
  }
@override
  void initState() {
    getDataMovzu();
    // TODO: implement initState
    super.initState();
  }
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.view_day_outlined, color: Colors.blue,),
                    SizedBox(width: 10,),
                    Text("Günün mövzusu", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor ),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0,),
                  child: Text(box.read("bashliq") ?? "Dişdə dolğu və diş qapağının olması", maxLines: 2 , overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                    style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black),),
                ),

                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: AnimatedCrossFade(
                    firstChild: Text( maxLines: 2, box.read("metin").toString() ?? Constants().metin,  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                      style: TextStyle( color: Colors.black.withOpacity(.8), ),),
                    secondChild: Text( maxLines: 1000, box.read("metin").toString()?? Constants().metin ,  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                  style: TextStyle(wordSpacing: 3  ,color: Colors.black.withOpacity(.8),  ),) ,
                    crossFadeState: zor ?  CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: Duration(milliseconds: 300),

                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(onPressed: () {
                      setState(() {
                       zor = !zor;
                       zor ? visual = "Bağla" : visual = "Oxu";                      });
                    },
                        child:Row(
                          children: [
                            Icon(Icons.chrome_reader_mode_outlined),
                            SizedBox(width: 10,),
                            Text(visual, style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),),
                          ],
                        )),
                    TextButton(onPressed: ()async{
                      await Share.share("${box.read("bashliq")} \n ${box.read("metin")} "
                          "\n https://play.google.com/store/apps/details?id=com.turkiyetakvimi&gl=US");},
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.share, color: Constants.primaryColor,),
                            SizedBox( width: 20,),
                            Text("Paylaş", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)

                          ],
                        )),


                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
