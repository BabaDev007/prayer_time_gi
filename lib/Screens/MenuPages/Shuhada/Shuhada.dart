import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../Constants.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';

class Shuhada extends StatefulWidget {
  @override
  State<Shuhada> createState() => _ShuhadaState();
}

class _ShuhadaState extends State<Shuhada> {

  AudioPlayer player = AudioPlayer();

  Future <void>zor()async {
    String audioasset = "assets/music/Shahadah.wav";
    ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
    Uint8List  soundbytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await player.playBytes(soundbytes);
    if(result == 1){ //play success
      print("Sound playing successful.");
    }else{
      print("Error while playing sound.");
    }
  }

  Future<void>stop()async {
    int result = await player.stop();

    // You can pasue the player
    // int result = await player.pause();

    if(result == 1){ //stop success
      print("Sound playing stopped successfully.");
    }else{
      print("Error on while stopping sound.");
    }
  }
  @override
  void initState() {
    zor();
    // TODO: implement initState
    super.initState();
  }

@override
  void dispose() {
    stop();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
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
              actions: [
                IconButton(
                  highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed:() async{
            await Share.share("Əşhədü ən ləə iləhə illəllah və əşhədü ənnə Muhammədən abdühu və rəsulüh");
            }, icon: Icon(Icons.share_outlined))
              ],

              leading: IconButton(onPressed: () {     Navigator.pop(context);
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Kəlimey-i Şəhadət", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Constants.primaryColor, width: 2)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/ks.jpg"))),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.amber.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            textAlign:TextAlign.center ,
                            "Əşhədü ən ləə iləhə illəllah və əşhədü ənnə Muhammədən abdühu və rəsulüh",
                            style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: ()async{
                                await zor();
                              }, icon: Icon(Icons.play_arrow_rounded, color: Constants.primaryColor, size: 35 )),
                              IconButton(onPressed: ()async{
                                await stop();
                              }, icon: Icon(Icons.stop, color: Constants.primaryColor, size: 35,)),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.amber.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:
                      Text.rich(
                        textAlign: TextAlign.justify,
                        TextSpan(
                          text: "   Kəlmeyi-şəhadət",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          children:[ TextSpan(
                            text:  " İslamın  şərtlərindən birincisidir. Kəlmeyi-şəhadət gətirmək, Həddi-buluğa çatan və danışa bilənhər kəsin bunları dil ilə söyləməsi və qəlb ilə qəti olaraq təsdiq etməsi lazımdır: “Yerdə və göydə, Allahüdan başqa, ibadət edilməyə haqqı olan və tapınmağa layiq olan heç bir şey və heç bir kimsə yoxdur. Həqiqi məbud ancaq, Allahü təaladır. O, vacib-ül-vücuddur. Hər üstünlük Ondadır. Onda heç bir qüsur yoxdur. Onun adı “Allahdır” Və yenə, o gül rəngli, ağ qırmızı, parlaq, sevimli üzlü, qara qaşlı və qara gözlü, mübarək alnı açıq, gözəl xasiyyətli, kölgəsi yerə düşməz və şirin sözlü, Ərəbistanda, Məkkədə dogulduğu üçün Ərəb deyilən, Haşimi övladından “Abdullahın oğlu Muhamməd əleyhissəlam, Allahü təalanın qulu və rəsuludur, yəni Peyğəmbəridir, Vəhəbin qızı olan Həzrəti Əminənin oğludur”.",
                              style:  TextStyle(
                                  fontWeight: FontWeight.normal
                              ),
                          )]
                        )
                      )






                    ),
                  ),
                )


              ],
            ),
          ),
        ),
      )
    );
  }
}

