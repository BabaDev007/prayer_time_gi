import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:prayer_time_gi/Screens/MenuPages/%C4%B0lahiler/%C4%B0lahiler.dart';

import '../../HomeScreen/PageViewPage/PageViewPage.dart';


class IlahiList extends StatelessWidget {
  var _tileWidget = [
    IlahiTile(name: "Özler Dururum Mekkeyi!", subtitle: "Müziksiz İlahi", path: "https://www.youtube.com/watch?v=gyg5y492-bo", ),
    IlahiTile(name: "Sevdalıyım!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/x3lRu-lKcnM", ),
    IlahiTile(name: "Kervan!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/izlL5fDHH0c", ),
    IlahiTile(name: "Sevdim Seni Mabuduma", subtitle: "Müziksiz İlahi", path: "https://www.youtube.com/watch?v=V26oh-bAAQg&t=84s", ),
    IlahiTile(name: "Sevgi Baht Olmuş! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/B8EUCSYrWr4", ),
    IlahiTile(name: "Hâlimiz N’ola Mahşerde!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/8BUWDWTBu7g", ),
    IlahiTile(name: "Derman Arardım Derdime!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/RDNptEyg42I", ),
    IlahiTile(name: "Mevlam Sana Geliyorum!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/r47KxAYKK60", ),
    IlahiTile(name: "Elvedâ Ya Şehr-i Ramazân", subtitle: "Müziksiz İlahi", path: "https://youtu.be/s0dK5vDC79Y", ),
    IlahiTile(name: "Yalan Dünya!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/7fKmpvUa-Mg", ),
    IlahiTile(name: "Allah’ım Bizi Affet!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/WW3LtkpxVKE", ),
    IlahiTile(name: "Efendime! “Aleyhisselâm”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/DxpqcRDC2ng", ),
    IlahiTile(name: "Açılsın da Yollar Sana Geleyim! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/5RGQnp99Dt0", ),
    IlahiTile(name: "O Güzel Medine’yi Bir Kez Göreyim! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Uh1s-FCpHWM", ),
    IlahiTile(name: "Çaren Var Mı?", subtitle: "Müziksiz İlahi", path: "https://youtu.be/FP2VabCBtKY", ),
    IlahiTile(name: "Anlat Durma Efendimi! “Aleyhisselam”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/N71g8gMawDk", ),
    IlahiTile(name: "Tende Canım Canda Cananımdır!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/2sE95u2jojw", ),
    IlahiTile(name: "Nice Ağlamayım", subtitle: "Müziksiz İlahi", path: "https://youtu.be/rRYJm_VX5TQ", ),
    IlahiTile(name: "Aşıkız Muhammed’e “Aleyhisselam”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/fa5QxT-eKdc", ),
    IlahiTile(name: "Ağlaya Ağlaya Yollara Düştüm!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/IoPvePdUeAc", ),
    IlahiTile(name: "On Bir Aylık Yoldan Geldin!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/i2cQr6Yj6oo", ),
    IlahiTile(name: "İstiğfar Eyle!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/g9Ze9IHke8M", ),
    IlahiTile(name: "Hayâlin Önümde Parlak Ay Gibi!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/XadpuJAVYYs", ),
    IlahiTile(name: "Sana Geleyim!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/pi7w5i9oxGg", ),
    IlahiTile(name: "Ya İlahi", subtitle: "Müziksiz İlahi", path: "https://youtu.be/5A2l8T-Dhzk", ),
    IlahiTile(name: "A Sultanım Sen Var İken!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Rz7e2mBMBiI", ),
    IlahiTile(name: "Nurundan Yâ Resulallah!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Wjn5dzsWAAU", ),
    IlahiTile(name: "Ağlayı Ağlayı", subtitle: "Müziksiz İlahi", path: "https://youtu.be/v0pUxgZasJ8", ),
    IlahiTile(name: "A Sultanım Sen Var İken!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Rz7e2mBMBiI", ),
    IlahiTile(name: "Enver Abimsin Benim!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/QsiS1lrHd2I", ),
    IlahiTile(name: "Deli Gönül!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/MD3en72uAwc", ),
    IlahiTile(name: "Peygamber Efendimiz “Aleyhisselâm” 3", subtitle: "Müziksiz İlahi", path: "https://youtu.be/RQbU2ClYSUE", ),
    IlahiTile(name: "Peygamber Efendimiz “Aleyhisselâm” 2", subtitle: "Müziksiz İlahi", path: "https://youtu.be/pNAqjcrT7Jg", ),
    IlahiTile(name: "Peygamber Efendimiz “Aleyhisselâm” 1", subtitle: "Müziksiz İlahi", path: "https://youtu.be/mZ_QUyNoCyo", ),
    IlahiTile(name: "Kimi Dosta Varır!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Ijv6957wae8", ),
    IlahiTile(name: "Yakma Yâ Rabbî", subtitle: "Müziksiz İlahi", path: "https://youtu.be/fJG5AlFtQng", ),
    IlahiTile(name: "Kıl Beş Vakit Namâzı!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/4FanLht6bDo", ),
    IlahiTile(name: "Gönüller Yapmaya Geldim", subtitle: "Müziksiz İlahi", path: "https://youtu.be/RNYWxeapPYk", ),
    IlahiTile(name: "Yemen İllerinde Veysel Karâni", subtitle: "Müziksiz İlahi", path: "https://youtu.be/ZX9q1m8R2IA", ),
    IlahiTile(name: "Habibimiz Muhammed’in “aleyhisselam”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/yHNQzJc02Lg", ),
    IlahiTile(name: "Yürü Gönlüm", subtitle: "Müziksiz İlahi", path: "https://youtu.be/PHS6onM-Gjg", ),
    IlahiTile(name: "26 Ekim’de Güneşimiz Batmıştı!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/3BfRjtjfS-0", ),
    IlahiTile(name: "Ya Rabbena “Celle Celâlühü”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/OWrwsEyGkVA", ),
    IlahiTile(name: "Mevlid-i Şerif", subtitle: "Müziksiz İlahi", path: "https://youtu.be/ulKejYF0mzw", ),
    IlahiTile(name: "Şol Kâinat Olmadan", subtitle: "Müziksiz İlahi", path: "https://youtu.be/cXXNiaT8Uo04", ),
    IlahiTile(name: "Ey Gönül Tefekkür Eyle! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/cEW0KlG6a24", ),
    IlahiTile(name: "Bir Garipsin Şu Dünyada", subtitle: "Müziksiz İlahi", path: "https://youtu.be/bIUi08Y4aVY", ),
    IlahiTile(name: "Sordum Sarı Çiğdeme!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/_RZqeh6ueyk", ),
    IlahiTile(name: "Hayâlin Önümde Parlak Ay Gibi!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/ZgvYz0Z5jmo", ),
    IlahiTile(name: "Allah Yolu Tektir Tek", subtitle: "Müziksiz İlahi", path: "https://youtu.be/cR-0WR7icXk", ),
    IlahiTile(name: "Ey Gönül Tefekkür Eyle! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/cEW0KlG6a24", ),



  ];

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    var _h = MediaQuery.of(context).size.height;
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
              leading: IconButton(onPressed: () {      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return PageViewPage(); }));
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("İlahilər", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,
      body: SafeArea(
        child: AnimationLimiter(
          child: ListView.builder(

            padding: EdgeInsets.all(_w / 30),
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: _tileWidget.length,
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
                      child: _tileWidget[index]
                  ),
                ),
              );
            },

          ),
        ),
      ),
    );
  }
}


