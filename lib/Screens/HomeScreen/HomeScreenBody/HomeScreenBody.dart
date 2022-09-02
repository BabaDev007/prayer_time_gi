import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import '../../../Constants.dart';
import '../../../StateManagement/StateManagement.dart';
import 'package:flip_card/flip_card.dart';

class Body extends StatefulWidget {


  @override
  State<Body> createState() => _BodyState();
}


class _BodyState extends State<Body> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();  GetStorage box = GetStorage();
  var bashliq;
  var metin;
  var isShow = false;
  var pr;
  var hs;
  var hikmetliSoz;
  var hikmet;
  var _bashliq2;
  var _link2;
  var _metin2;

  Controller c = Get.put(Controller());
  var _url = Uri.parse("https://www.gozelislam.com/");

  Future<void> getData() async {
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

  Future<void> getHikmet() async {
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("top-block2").forEach((element) {
      setState(() {
        hikmetliSoz = element.children[0].children[2].text.toString();
      });
      box.write("hikmetlisoz", hikmetliSoz);
    });
  }

  var _metin3;

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

  Future<void> getMovzuPage() async {
    var _url = Uri.parse(box.read("_link2"));
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("blog-info").forEach((
        element) async {


    });
  }
  var timeName;
  var timeTime;
  Color color = Colors.white;
  var zor;
  var now = DateTime.now();
  List months =
  ['Yanvar', 'Fevral', 'Mart', 'Aprel', 'May','İyun','İyul','Avqust','Sentyabr','Oktyabr','Noyabr','Dekabr'];


  List weekday = ["Bzr. ertəsi", "Çər. axşamı", "Çərşənbə", "Cümə axşamı", "Cümə", "Şənbə", "Bazar"];


 DateTime? subh,
     zohr,
     ikindi,
     axsam,
     yatsi, gunes, geceyarisi, teheccud, ishrak, imsak, kerahet, asrisani, isfirar, istibak, isasani;
var circularPrName;
var circularPrPmName;
var circularPrTime;
  Timer? mytimer;
  var percent;
  void colors(){
    if( percent > 0.40){
      color = Colors.yellow;
    }else if(percent>0.50){
      color = Colors.redAccent;
    } else if(percent > 0.25){
      color = Colors.greenAccent;
    }else{
      color = Colors.white;
    }
  }
  var dataTime;
  @override
  void initState() {
    super.initState();
    zor = box.read("time");
    imsak = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['imsaq']}" + ":00" );
    subh = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['sabah']}" + ":00" );
    zohr = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['gunorta']}" + ":00" );
    ikindi = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['ikindi']}" + ":00" );
    axsam = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['axsam']}" + ":00" );
    yatsi = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['yatsi']}" + ":00" );
    gunes = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['baseTime']['gunes']}" + ":00" );
    geceyarisi = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['extraTime']['midnight']}" + ":00" );
    ishrak = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['extraTime']['israk']}" + ":00" );
    kerahet = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['extraTime']['kerahat']}" + ":00" );
    asrisani = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['extraTime']['asri_sani']}" + ":00" );
    isfirar = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['extraTime']['isfirar']}" + ":00" );
    istibak = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['extraTime']['istibak']}" + ":00" );
    isasani = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['extraTime']['isa_sani']}" + ":00" );
    teheccud  = DateTime.parse("${zor['${c
        .difference2}']['baseTime']["todayDate"]}" + " ${zor['${c.difference2}']['extraTime']['teheccud']}" + ":00" );

    mytimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState((){

        now = DateTime.now(
        );
         //  if(geceyarisi!.isBefore(DateTime.now()) ){
         //   circularPrName = "Təhəccüd";
         //   circularPrPmName = "vaxtına";
         //
         //   colors();
         //
         //
         // }

           if(teheccud!.isBefore(DateTime.now())&& imsak!.isAfter(DateTime.now())){
           circularPrName = "İmsak";
           circularPrPmName = "vaxtına";
           circularPrTime = imsak!.difference(now);
           var difPrToPr = imsak!.difference(teheccud!).inMinutes;
           var difPrToNow = imsak!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Sübh";
           timeTime = zor['${c.difference}']['baseTime']['sabah'];
           colors();

         }

          else if(imsak!.isBefore(DateTime.now())&& subh!.isAfter(DateTime.now())){
           circularPrName = "Sübh";
           circularPrPmName = "namazına";
           circularPrTime = subh!.difference(now);
           var difPrToPr = subh!.difference(imsak!).inMinutes;
           var difPrToNow = subh!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Sübh";
           timeTime = zor['${c.difference}']['baseTime']['sabah'];

           colors();

         }else if(subh!.isBefore(DateTime.now())&& gunes!.isAfter(DateTime.now())){
           circularPrName = "Günəş";
           circularPrPmName = "çıxmağına";
           circularPrTime = gunes!.difference(now);
           var difPrToPr = gunes!.difference(subh!).inMinutes;
           var difPrToNow = gunes!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Günəş";
           timeTime = zor['${c.difference}']['baseTime']['gunes'];

           colors();

         }else if(gunes!.isBefore(DateTime.now())&& ishrak!.isAfter(DateTime.now())){
           circularPrName = "İşrak";
           circularPrPmName = "vaxtına";
           circularPrTime = ishrak!.difference(now);
           var difPrToPr = ishrak!.difference(gunes!).inMinutes;
           var difPrToNow = ishrak!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Zöhr";
           timeTime = zor['${c.difference}']['baseTime']['gunorta'];

           colors();

          }else if(ishrak!.isBefore(DateTime.now())&& kerahet!.isAfter(DateTime.now())){
           circularPrName = "Kərahət";
           circularPrPmName = "vaxtına";
           circularPrTime = kerahet!.difference(now);
           var difPrToPr = kerahet!.difference(ishrak!).inMinutes;
           var difPrToNow = kerahet!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Zöhr";
           timeTime = zor['${c.difference}']['baseTime']['gunorta'];


           colors();

         }else if(kerahet!.isBefore(DateTime.now())&& zohr!.isAfter(DateTime.now())){
           circularPrName = "Zöhr";
           circularPrPmName = "namazına";
           circularPrTime = zohr!.difference(now);
           var difPrToPr = zohr!.difference(kerahet!).inMinutes;
           var difPrToNow = zohr!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Zöhr";
           timeTime = zor['${c.difference}']['baseTime']['gunorta'];

           colors();

          }else if(zohr!.isBefore(DateTime.now())&& ikindi!.isAfter(DateTime.now())){
           circularPrName = "Əsr";
           circularPrPmName = "namazına";
           circularPrTime = ikindi!.difference(now);
           var difPrToPr = ikindi!.difference(zohr!).inMinutes;
           var difPrToNow = ikindi!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Əsr";
           timeTime = zor['${c.difference}']['baseTime']['ikindi'];

           colors();

         }else if(ikindi!.isBefore(DateTime.now())&& asrisani!.isAfter(DateTime.now())){
           circularPrName = "Əsr-i Sani";
           circularPrPmName = "vaxtına";
           circularPrTime = asrisani!.difference(now);
           var difPrToPr = asrisani!.difference(ikindi!).inMinutes;
           var difPrToNow = asrisani!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Axşam";
           timeTime = zor['${c.difference}']['baseTime']['axsam'];

           colors();

          }else if(asrisani!.isBefore(DateTime.now())&& isfirar!.isAfter(DateTime.now())){
           circularPrName = "İsfirar";
           circularPrPmName = "vaxtına";
           circularPrTime = isfirar!.difference(now);
           var difPrToPr = isfirar!.difference(asrisani!).inMinutes;
           var difPrToNow = isfirar!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Axşam";
           timeTime = zor['${c.difference}']['baseTime']['axsam'];

           colors();

          }else if(isfirar!.isBefore(DateTime.now())&& axsam!.isAfter(DateTime.now())){
           circularPrName = "Axşam";
           circularPrPmName = "namazına";
           circularPrTime = axsam!.difference(now);
           var difPrToPr = axsam!.difference(isfirar!).inMinutes;
           var difPrToNow = axsam!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Axşam";
           timeTime = zor['${c.difference}']['baseTime']['axsam'];

           colors();

          }else if(axsam!.isBefore(DateTime.now())&& istibak!.isAfter(DateTime.now())){
           circularPrName = "İştibak";
           circularPrPmName = "vaxtına";
           circularPrTime = istibak!.difference(now);
           var difPrToPr = istibak!.difference(axsam!).inMinutes;
           var difPrToNow = istibak!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "İşa";
           timeTime = zor['${c.difference}']['baseTime']['yatsi'];

           colors();

          }else if(istibak!.isBefore(DateTime.now())&& yatsi!.isAfter(DateTime.now())){
           circularPrName = "İşa";
           circularPrPmName = "namazına";
           circularPrTime = yatsi!.difference(now);
           var difPrToPr = yatsi!.difference(istibak!).inMinutes;
           var difPrToNow = yatsi!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "İşa";
           timeTime = zor['${c.difference}']['baseTime']['yatsi'];

           colors();

          }else if(yatsi!.isBefore(DateTime.now())&& isasani!.isAfter(DateTime.now())){
           circularPrName = "İşa-i Sani";
           circularPrPmName = "vaxtına";
           circularPrTime = isasani!.difference(now);
           var difPrToPr = isasani!.difference(yatsi!).inMinutes;
           var difPrToNow = isasani!.difference(now).inMinutes;
           percent = 1-  difPrToNow/difPrToPr.toDouble();
           timeName = "Gecə yarısı";
           timeTime = zor['${c.difference}']['extraTime']['midnight'];

           colors();

          }
           else if(geceyarisi!.isBefore(DateTime.now())){
            circularPrName = "Sübh";
            circularPrPmName = "namazına";
            circularPrTime = subh!.difference(now);
            timeName = "Sübh";
            timeTime = zor['${c.difference}']['baseTime']['sabah'];


             // var difPrToPr = geceyarisi!.difference(isasani!).inMinutes;
            // var difPrToNow = geceyarisi!.difference(now).inMinutes;
            // percent = (1-  difPrToNow/difPrToPr.toDouble());
            // colors();

           }

      });
    });
    mytimer;
    pr = box.read("prayertime") ?? true;
    hs = box.read("hikmet") ?? true;
    getHikmet();
    getMovzuDialog();
    c.isShowPrayerTime.value = pr;
    c.isShowHikmetliSoz.value = hs;
    hikmet = box.read("hikmetlisoz");

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    return // timeName == null ? Center(child: Lottie.asset("assets/loding.json", height: 80),) :

    Center(
      child: Column(
        children: [
          Expanded(
            flex: 2,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [

                  Padding(
                    padding:  EdgeInsets.only(bottom: Get.height/100),
                    child: Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(.7),

                      ),
                      height: Get.height,
                      width: Get.width,

                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(bottom: Get.height/40),
                    child: Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                        color: Colors.white,

                      ),
                      height: Get.height,
                      width: Get.width,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          child: Opacity(
                              opacity: .5,
                              child: Image.asset("assets/mosquepng.png", fit: BoxFit.cover,  ))),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: Get.height/40),
                    child: Container(
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                        color: Colors.lightBlueAccent.withOpacity(.3)

                      ),
                      height: Get.height,
                      width: Get.width,

                    ),
                  ),
                  Positioned(
                    top: Get.height/9,
                       child: Text("Göyçay", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Oswald"),)),
                  Positioned(
                  bottom: Get.height/16,
                  right: 30,
                  child: timeTime == null ? Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(color: Colors.white,),
                  ),) : Text("-${circularPrTime.toString().substring(0,7)}", style: TextStyle(color: Colors.white.withOpacity(.8), fontWeight: FontWeight.w300 ,fontSize: 20, fontFamily: "GentiumBookPlus" ),) ),

                  Positioned(
                      bottom: Get.height/16,
                      left: 30,
                      child: timeTime == null ? Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(color: Colors.white,),
                      ),) : Text("${timeName}\n${timeTime}", textAlign: TextAlign.center ,style: TextStyle(color: Colors.white, fontSize: 25, shadows: [Shadow(blurRadius: 2, color: Colors.white)], fontFamily: "Oswald"),) ),




                  Positioned(

           child: Container(
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 IconButton(onPressed: (){
                   setState(() {
                     c.difference--;
                   });

                 }, icon: Icon(Icons.chevron_left, size: 25, color: Constants.primaryColor)),
                 FittedBox(
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                   Text("${DateTime.parse("${zor['${c
                                  .difference}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor['${c
                       .difference}']['baseTime']["todayDate"]}").month - 1]}, ${weekday[DateTime.parse("${zor['${c
                       .difference}']['baseTime']["todayDate"]}").weekday - 1]}", style: TextStyle( fontSize: 14,color: Colors.black87, fontWeight: FontWeight.w600)),
                Text(

                               "${"${zor['${c
                                   .difference}']['baseTime']["todayHijrahDate"]}".capitalize}",
                               maxLines: 1,  style: TextStyle( fontSize: 13, color: Colors.black38),)
                     ],
                   ),
                 ),
                 IconButton(onPressed: (){
                   setState(() {
                     c.difference++;
                   });

                 }, icon: Icon(Icons.chevron_right, size: 25, color: Constants.primaryColor,))
               ],
             ),
             height: Get.height/20,
             width: Get.width/1.15,
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(20)
             ),
           ),
         ),
                ],
              )),
          Expanded(
            flex: 4,
              child:
          FlipCard(
            back: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 4),
                                            child: Image.asset("assets/sunrise.png", color: Colors.black54,),
                                          )),
                                    ),
                                    Text("imsaq", style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  children: [
                                    AutoSizeText(zor['${c.difference}']['baseTime']['imsaq'].toString(), style: TextStyle(fontSize: 18),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18 ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(thickness: 1),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child:Padding(
                                          padding: const EdgeInsets.only(left: 4),
                                          child: Image.asset("assets/sunrise2.png", color: Colors.black54,),
                                        ),
                                      ),),
                                    Text("sübh", style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  children: [
                                    AutoSizeText(zor['${c.difference}']['baseTime']['sabah'].toString(), style: TextStyle(fontSize: 18),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(thickness: 1),

                        Expanded(
                          child: Container(
                            color: Colors.green.shade200 ,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child:Padding(
                                            padding: const EdgeInsets.only(left: 4),
                                            child: Image.asset("assets/sun.png", color: Colors.black54, width: 25,),
                                          ),
                                        ),),
                                      Text("günəş", style: TextStyle(fontSize: 18),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    children: [
                                      Text(zor['${c.difference}']['baseTime']['gunes'].toString(), style: TextStyle(fontSize: 18),),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(thickness: 1),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child:
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Icon(Icons.sunny, color: Colors.black54,),
                                        ),),
                                    ),
                                    AutoSizeText("zöhr", style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  children: [
                                    Text(zor['${c.difference}']['baseTime']['gunorta'].toString(), style: TextStyle(fontSize: 18),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(thickness: 1),


                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child:
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Icon(Icons.sunny_snowing, color: Colors.black54, ),
                                        ),),
                                    ),
                                    Text("əsr", style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  children: [
                                    Text(zor['${c.difference}']['baseTime']['ikindi'].toString(), style: TextStyle(fontSize: 18),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(thickness: 1),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child:
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Icon(Icons.nightlight_outlined, color: Colors.black54, ),
                                        ),),
                                    ),
                                    Text("axşam", style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  children: [
                                    Text(zor['${c.difference}']['baseTime']['axsam'].toString(), style: TextStyle(fontSize: 18),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(thickness: 1),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child:
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Icon(Icons.nightlight, color: Colors.black54, ),
                                        ),),
                                    ),

                                    Text("işa", style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  children: [
                                    Text(zor['${c.difference}']['baseTime']['yatsi'].toString(), style: TextStyle(fontSize: 18),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(thickness: 1),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child:
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Icon(Icons.nights_stay_outlined, color: Colors.black54, ),
                                        ),),
                                    ),
                                    Text("gecə yarısı", style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  children: [
                                    AutoSizeText(zor['${c.difference}']['extraTime']['midnight'].toString(), style: TextStyle(fontSize: 18),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),



                      ],
                    ),
                  )

              ),
            ),
            front: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Expanded(
                      child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                             child: Row(
                                               children: [
                                                 Padding(
                                                   padding: const EdgeInsets.symmetric(horizontal: 10),
                                                   child: CircleAvatar(
                                                     backgroundColor: Colors.transparent,
                                                       child: Padding(
                                                         padding: const EdgeInsets.only(left: 4),
                                                         child: Image.asset("assets/sunrise.png", color: Colors.black54,),
                                                       )),
                                                 ),
                                                 Text("imsaq", style: TextStyle(fontSize: 18),),
                                               ],
                                             ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                             child: Row(
                                               children: [
                                                 AutoSizeText(zor['${c.difference}']['baseTime']['imsaq'].toString(), style: TextStyle(fontSize: 18),),
                                                 Padding(
                                                   padding: const EdgeInsets.symmetric(horizontal: 10),
                                                   child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18 ),
                                                 )
                                               ],
                                             ),
                                           )
                                         ],
                                       ),
                    ),
                      Divider(thickness: 1),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child:Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Image.asset("assets/sunrise2.png", color: Colors.black54,),
                                      ),
                                  ),),
                                  Text("sübh", style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  AutoSizeText(zor['${c.difference}']['baseTime']['sabah'].toString(), style: TextStyle(fontSize: 18),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(thickness: 1),

                      Expanded(
                        child: Container(
                          color: Colors.green.shade200 ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child:Padding(
                                          padding: const EdgeInsets.only(left: 4),
                                          child: Image.asset("assets/sun.png", color: Colors.black54, width: 25,),
                                        ),
                                    ),),
                                    Text("günəş", style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  children: [
                                   Text(zor['${c.difference}']['baseTime']['gunes'].toString(), style: TextStyle(fontSize: 18),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, ),
                              child: Row(
                                children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.sunny, color: Colors.black54,),
                                    ),),
                                ),
                                  AutoSizeText("zöhr", style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(zor['${c.difference}']['baseTime']['gunorta'].toString(), style: TextStyle(fontSize: 18),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(thickness: 1),


                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, ),
                              child: Row(
                                children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.sunny_snowing, color: Colors.black54, ),
                                    ),),
                                ),
                                  Text("əsr", style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                 Text(zor['${c.difference}']['baseTime']['ikindi'].toString(), style: TextStyle(fontSize: 18),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(thickness: 1),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, ),
                              child: Row(
                                children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.nightlight_outlined, color: Colors.black54, ),
                                    ),),
                                ),
                                  Text("axşam", style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(zor['${c.difference}']['baseTime']['axsam'].toString(), style: TextStyle(fontSize: 18),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(thickness: 1),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, ),
                              child: Row(
                                children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.nightlight, color: Colors.black54, ),
                                    ),),
                                ),

                               Text("işa", style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(zor['${c.difference}']['baseTime']['yatsi'].toString(), style: TextStyle(fontSize: 18),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(thickness: 1),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, ),
                              child: Row(
                                children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.nights_stay_outlined, color: Colors.black54, ),
                                    ),),
                                ),
                                 Text("gecə yarısı", style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  AutoSizeText(zor['${c.difference}']['extraTime']['midnight'].toString(), style: TextStyle(fontSize: 18),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(Icons.info_outline_rounded, color: Colors.black38, size: 18),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),



                    ],
                  ),
                )

              ),
            ),
          ))

        ],
      )








    );
  }

// List of items in our dropdown menu
}











































// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     Expanded(
//         flex: 2,
//
//          child:
//            Padding(
//              padding: const EdgeInsets.all(10),
//              child: InkWell(
//                borderRadius: BorderRadius.circular(20),
//                highlightColor: Colors.white,
//
//                onTap: () async {
//
//                  getData();
//                  Navigator.push(context,
//                      SizeTransition2(DaylyTheme()));
//                },
//                child: Container(
//                  height: Get.size.height/8,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Center(child: Text("Günlük Mövzu", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "Oswald", fontSize: 20),)),
//                  ),
//                  decoration: BoxDecoration(
//                      color: Constants.primaryColor,
//                      borderRadius: BorderRadius.circular(40),
//                      border: Border.all(width: 1.9, color: Colors.white)
//
//                  ),
//                ),
//              ),
//            )
//
//
//              ),
//     // Expanded(
//     //   flex: 2,
//     //   child: FittedBox(
//     //     child: Padding(
//     //       padding: const EdgeInsets.all(10.0),
//     //       child:
//     //       Container(
//     //         height: Get.height/17,
//     //
//     //
//     //         decoration: BoxDecoration(
//     //             color: Constants.primaryColor,
//     //             borderRadius: BorderRadius.circular(160),
//     //             border: Border.all(width: 1.9, color: Colors.white)
//     //
//     //         ),
//     //       ),
//     //
//     //
//     //
//     //     ),
//     //   ),
//     //
//     // ),
//
//
//
//     Expanded(
//       flex:2,
//       child: FittedBox(
//         child: Padding(
//           padding: const EdgeInsets.only(right: 8.0, ),
//           child:
//           // percent == null ? Padding(
//           //   padding: const EdgeInsets.all(40.0),
//           //   child: CircularProgressIndicator(color: Colors.white, ),
//           // ) :
//           CircularPercentIndicator(
//             backgroundWidth: 1,
//             percent: percent,
//             progressColor: color,
//             backgroundColor: Colors.white38,
//             radius: 50.0,
//             lineWidth: 3.0,
//
//
//             center: FittedBox(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AutoSizeText(
//                      circularPrName,
//                     maxFontSize: 25,
//                     minFontSize: 23,
//                     maxLines: 2,
//                     style: TextStyle(
//                       color: Colors.white, fontFamily: "Oswald",
//                     ),),
//                   AutoSizeText(
//                     circularPrPmName,
//                     maxFontSize: 18,
//                     minFontSize: 18,
//                     maxLines: 2,
//                     style: TextStyle(
//                       color: Colors.white70, fontFamily: "Oswald",
//                     ),),
//                   AutoSizeText(circularPrTime.toString().substring(0,7), maxFontSize: 40,
//                     minFontSize: 20,
//                     style: TextStyle(
//                         color: Colors.white70,
//                         fontFamily: "Oswald",
//                         fontSize: 25
//                     ),),
//                 ],
//               ),
//             ),
//
//           ),
//         ),
//       ),
//     )
//
//
//   ],
// ),
//
//
// Padding(
//     padding: const EdgeInsets.all(5.0),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Obx(() =>Visibility(
//   visible: c.isShowPrayerTime.isFalse, child:    Padding(
//           padding: const EdgeInsets.all(2.0),
//           child:
//           PhysicalModel(
//             elevation: 4,
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//             child: Container(
//
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Obx(()=>
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.add, color: Constants.primaryColor, size: 25,),
//
//                               AutoSizeText(minFontSize: 8 , "İmsak", style: TextStyle(fontFamily: "Oswald" , color: Constants.primaryColor, fontSize: 20),),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   AutoSizeText(minFontSize: 8 , zor['${c.difference}']['baseTime']['imsaq'].toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
//
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//                           child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.sunny_snowing, color: Constants.primaryColor, size: 25,),
//                               AutoSizeText(minFontSize: 8 , "Sübh", style: TextStyle(fontFamily: "Oswald" , color: Constants.primaryColor, fontSize: 20),),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['sabah']}", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
//
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8 ,vertical: 5),
//                           child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.sunny, color: Constants.primaryColor, size: 25,),
//                               AutoSizeText(minFontSize: 8 , "Günəş", style: TextStyle(color: Constants.primaryColor,fontSize: 20, fontFamily: "Oswald"),),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['gunes']}", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
//
//                                 ],
//                               )
//                             ],
//                           ),
//
//                         ), const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
//                           child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(FontAwesomeIcons.solidSun, color: Constants.primaryColor, size: 25,),
//                               AutoSizeText(minFontSize: 8 , "Zöhr", style: TextStyle(color: Constants.primaryColor,fontSize: 20, fontFamily: "Oswald"),),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['gunorta']}", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
//
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
//                           child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(FontAwesomeIcons.sun, color: Constants.primaryColor, size: 25,),
//                               AutoSizeText(minFontSize: 8 , "Əsr", style: TextStyle(color: Constants.primaryColor,fontSize: 20, fontFamily: "Oswald"),),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['ikindi']}", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
//
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
//                           child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.sunny_snowing, color: Constants.primaryColor, size: 25,),
//                               AutoSizeText(minFontSize: 8 , "Axşam", style: TextStyle(color: Constants.primaryColor,fontSize: 20, fontFamily: "Oswald"),),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['axsam']}", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
//
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
//                           child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                             children: [
//                               Icon(FontAwesomeIcons.solidMoon, color: Constants.primaryColor, size: 25,),
//                               AutoSizeText(minFontSize: 8 , "İşa", style: TextStyle(color: Constants.primaryColor,fontSize: 20, fontFamily: "Oswald"),),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['yatsi']}", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
//
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
//                           child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                             children: [
//                               Icon((Icons.nights_stay_rounded), color: Constants.primaryColor, size: 25,),
//                               AutoSizeText(minFontSize: 8 , "Gecə yarısı", style: TextStyle(color: Constants.primaryColor,fontSize: 20, fontFamily: "Oswald"),),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['extraTime']['midnight']}", style: TextStyle(color: Constants.primaryColor, fontSize: 19, fontWeight: FontWeight.bold),),
//
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//
//
//
//
//
//                       ],
//                     ),
//                 ),
//               ),
//
//               width: Get.size.width/1.1,
//             ),
//           )
//
//
//           ,
//         ),)),
//
//
//
//
//
//
//
//         Obx(() =>Visibility(
//             visible: c.isShowPrayerTime.isTrue,
//             child: Padding(
//               padding: const EdgeInsets.all(5.0),
//               child:
//               PhysicalModel(
//                 elevation: 4,
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//                 child: Container(
//
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child:
//                         SingleChildScrollView(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                                   children: [
//                                     Icon(Icons.add, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "Təhəccüd", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , zor['${c.difference}']['extraTime']['teheccud'].toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8,),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.add, color: Constants.primaryColor, size: 25,),
//
//                                     AutoSizeText(minFontSize: 8 , "İmsak", style: TextStyle(fontFamily: "Oswald" , color: Constants.primaryColor, fontSize: 25),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , zor['${c.difference}']['baseTime']['imsaq'].toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8,),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.sunny_snowing, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "Sübh", style: TextStyle(fontFamily: "Oswald" , color: Constants.primaryColor, fontSize: 25),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['sabah']}", style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8,),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.sunny, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "Günəş", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['gunes']}", style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//
//                               ), const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.add, color: Constants.primaryColor, size: 25,),
//
//                                     AutoSizeText(minFontSize: 8 , "İşrak", style: TextStyle(fontFamily: "Oswald" , color: Constants.primaryColor, fontSize: 25),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , zor['${c.difference}']['extraTime']['israk'].toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.add, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "Kərahət", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , zor['${c.difference}']['extraTime']['kerahat'].toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//
//                               ), const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(FontAwesomeIcons.solidSun, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "Zöhr", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['gunorta']}", style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(FontAwesomeIcons.sun, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "Əsr", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['ikindi']}", style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.add, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "Əsr-i Sani", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , zor['${c.difference}']['extraTime']['asri_sani'].toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.add, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "İsfirar", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 ,zor['${c.difference}']['extraTime']['isfirar'].toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.sunny_snowing, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "Axşam", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['axsam']}", style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.add, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "İştibak", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , zor['${c.difference}']['extraTime']['istibak'].toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                                   children: [
//                                     Icon(FontAwesomeIcons.solidMoon, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "İşa", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['baseTime']['yatsi']}", style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                                   children: [
//                                     Icon(Icons.add, color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "İşa-i Sani", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , zor['${c.difference}']['extraTime']['isa_sani'].toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Divider(thickness: 1height: 0, thickness: 0.5,),
//                               ),
//
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                                   children: [
//                                     Icon((Icons.nights_stay_rounded), color: Constants.primaryColor, size: 25,),
//                                     AutoSizeText(minFontSize: 8 , "Gecə yarısı", style: TextStyle(color: Constants.primaryColor,fontSize: 25, fontFamily: "Oswald"),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         AutoSizeText(minFontSize: 8 , "${zor['${c.difference}']['extraTime']['midnight']}", style: TextStyle(color: Constants.primaryColor, fontSize: 25, fontWeight: FontWeight.bold),),
//
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),





//
//                             ],
//                           ),
//                         ),
//                     ),
//                   width: Get.size.width/1.1,
//                   ),
//
//
//
//
//               ),
//             )),)
//       ],
//     )
// ),
// SizedBox(height: 50,)
