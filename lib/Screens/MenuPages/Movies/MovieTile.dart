import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constants.dart';
import '../../../PaddingManager.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';
import '../../HomeScreen/Widgets.dart';

class MoviesTile extends StatelessWidget {
  String movieName;
  String videoLink;

  MoviesTile(this.movieName, this.videoLink);

  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: InkWell(
          onTap: (){
            _launchUrl("$videoLink",);

          },
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
                leading:  Image.asset("assets/youtube.png", color: Constants.primaryColor, width: 40, height: 40,),
                trailing: Icon(Icons.chevron_right),
                title: Text(movieName),

              )),
        ));
  }
}

class Movies extends StatelessWidget {

  var MovieTileList = [
    MoviesTile("Aziz Mahmud Hüdayi - Hüdayi Yolu", "https://www.youtube.com/watch?v=z4MvA-syR2k&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=67" ),
    MoviesTile("Mehmed Emin Tokadi Hz - Beyaz Gece", "https://www.youtube.com/watch?v=8tgxwRkOld0&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=66" ),
    MoviesTile("Abdülfettah-i Akri Hz - İki Damla Gözyaşı", "https://www.youtube.com/watch?v=zTFIj5COJIY&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=65" ),
    MoviesTile("Abdulkadir-i Geylani Hz. - Batmayan Güneş", "https://www.youtube.com/watch?v=wbmI2KPpr3Q&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=64" ),
    MoviesTile("Abdullah-ı Tercüman Hz. - Arayış", "https://www.youtube.com/watch?v=foaWHCZBGKA&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=63" ),
    MoviesTile("Akşemseddin Hz.", "https://www.youtube.com/watch?v=xhduYmnsVCU&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=61" ),
    MoviesTile("Ahmedi-i Bedevi Hz. - Can Perdesi", "https://www.youtube.com/watch?v=dIbCJGkn9pQ&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=62" ),
    MoviesTile("Ali Semerkandi Hz.", "https://www.youtube.com/watch?v=KFzn6prFKmM&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=59" ),
    MoviesTile("Behlül-i Dana Hazretleri", "https://www.youtube.com/watch?v=tFjL5nxtcUg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=58" ),
    MoviesTile("Beşiktaşlı Yahya Efendi - Yeşeren Asma", "https://www.youtube.com/watch?v=DPnUswuFMTU&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=57" ),
    MoviesTile("Bişr-i Hafi Hz. - Bir Zamanlar Sarhoştu", "https://www.youtube.com/watch?v=BMGeJg21Z5U&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=56" ),
    MoviesTile("Davud-i Tai", "https://www.youtube.com/watch?v=AdAcrlCQfMI&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=54" ),
    MoviesTile("Ebu Turab-ı Nahşebi Hz.- Toprağın Oğlu", "https://www.youtube.com/watch?v=gknNerqAxWA&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=53" ),
    MoviesTile("Ebül Vefa Hz. - Gayret", "https://www.youtube.com/watch?v=8tgxwRkOld0&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=52" ),
    MoviesTile("Erzurumlu İbrahim Hakkı Hz.", "https://www.youtube.com/watch?v=RYyX68j3dSM&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=51" ),
    MoviesTile("Fudayl Bin Iyad Hz.", "https://www.youtube.com/watch?v=UjmC3qRsUtg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=50" ),
    MoviesTile("Hababe Hatun Hz. - Issız Kule", "https://www.youtube.com/watch?v=HNZdK80ROUY&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=49" ),
    MoviesTile("Hacı Bayram-ı Veli - Hasat", "https://www.youtube.com/watch?v=D1MPpefrCDg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=48" ),
    MoviesTile("Hasan Sezai Hz. - İftira", "https://www.youtube.com/watch?v=Dcfp946A7hY&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=47" ),
    MoviesTile("Hasan-i Basri Hz.", "https://www.youtube.com/watch?v=aiHN72aEfXo&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=46" ),
    MoviesTile("Hayat Bin Kays El Harrani Hz. - Suikast", "https://www.youtube.com/watch?v=MSkhveCo7lA&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=45" ),
    MoviesTile("İbrahim Bin Ethem Hz. - İlahi Aşk", "https://www.youtube.com/watch?v=amwFFMDw0ME&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=44" ),
    MoviesTile("İbrahim Gülşeni Hz.", "https://www.youtube.com/watch?v=3k8BDqfdgpk&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=43" ),
    MoviesTile("Eshab-ı Keyf 1 - Uzun Gece", "https://www.youtube.com/watch?v=d08AXmp_ifg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=34" ),
    MoviesTile("Eshab-ı Keyf 2 - Uzun Gece", "https://www.youtube.com/watch?v=x26lhQcw2fo&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=35" ),
    MoviesTile("Terzi Baba Hz.", "https://www.youtube.com/watch?v=WbK31CrGdCE&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=33" ),
    MoviesTile("İbrahim-i Havvas Hz - Kalbe Düşen Nur", "https://www.youtube.com/watch?v=0Ep9ueOK_BE&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=32" ),
    MoviesTile("İsmail Fakirullah Hz.1 - Öpülecek Eller", "https://www.youtube.com/watch?v=W9JgJJYpdP8&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=31" ),
    MoviesTile("Kab Bin Züheyr - Kaside-i Bürde Şairi", "https://www.youtube.com/watch?v=kXK7Qd6iMWg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=30" ),
  ];

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
              title: Text("Dini Filmlər", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,

      body: Stack(

        children: [
          Stack1(),
          AnimationLimiter(
            child: ListView.builder(

              padding: EdgeInsets.symmetric(horizontal:_w / 30, vertical: 100),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: MovieTileList.length,
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
                      child: MovieTileList[index]
                    ),
                  ),
                );
              },

            ),
          ),
        ],
      ),
    );
  }
}





