import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Map/Map.dart';
import 'package:prayer_time_gi/Screens/MenuPages/QezaNamaz/QezaNamaz.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Quran/screens/home.dart';
import 'package:prayer_time_gi/Screens/Settings/SettingPage.dart';
import 'package:share/share.dart';
import '../../Constants.dart';
import '../../PageTransition/PageTransition.dart';
import '../MenuPages/AboutPrayerTimes/AboutPrayerTimes.dart';
import '../MenuPages/Books/BookList.dart';
import '../MenuPages/DiniBilgiler/DiniBilgiler.dart';
import '../MenuPages/Dualar/Dualar.dart';
import '../MenuPages/Ekarts/Ekarts.dart';
import '../MenuPages/Esmail_Husna/EsmaScreen.dart';
import '../MenuPages/KompassScreen/qiblah_compass.dart';
import '../MenuPages/Movies/MovieTile.dart';
import '../MenuPages/Namaz/NamazPage.dart';
import '../MenuPages/UsefulLinks/UseFulLinks.dart';
import '../MenuPages/ZikirMatik/ZikirMatik.dart';
import '../MenuPages/sendQuestion/sendQuestion.dart';
import '../MenuPages/İlahiler/IlahiList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Widgets.dart';


class DrawerPage extends  Drawer {

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor:  Constants.kTransparentColor,
      child:  Container(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            child: GridView.count(crossAxisCount: 3,
              children: [

                GridTile(
                  footer: Center(child: Text("Qiblə", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(QiblahCompass()));
                        }, child:  Image.asset("assets/kaaba.png", color: Constants.primaryColor, width: 150, height: 100,) ),
                  ),),

                GridTile(
                  footer: Center(child: Text("Quran", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(QuranPage()));

                        }, child:  Image.asset("assets/quran.png", color: Constants.primaryColor, width: 150, height: 130,) ),
                  ),),

                GridTile(
                  footer: Center(child: Text("Online Kitablar", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(BookList()));
                        }, child:  Icon(FontAwesomeIcons.quran, size: 30, color: Constants.primaryColor ,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Offline Kitablar", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(EBookList()));
                        }, child:  Icon(FontAwesomeIcons.quran, size: 30, color: Constants.primaryColor ,)),
                  ),),

                GridTile(
                  footer: Center(child: Text("Dini Bilgiler", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(DiniBilgilerPage()));
                        }, child:  Image.asset("assets/dinibilgiler.png", color: Constants.primaryColor, scale: 4,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Dijital Təsbih", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(ZikrPage()));

                        }, child:Image.asset("assets/tasbih.png", color: Constants.primaryColor, width: 110, height: 100,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Dualar", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(DualarPage()));

                        }, child: Image.asset("assets/dua-hands.png", color: Constants.primaryColor, width: 150, height: 100,) ),
                  ),),
                GridTile(
                  footer: Center(child: Text("Esma-i Hüsna", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(EsmaScreen()));

                        }, child: Image.asset("assets/allah.png", color: Constants.primaryColor, width: 150, height: 100,) ),
                  ),),

                GridTile(
                  footer: Center(child: Text("Dini Mövzular", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(Themes()));

                        }, child: SvgPicture.asset("assets/mosq.svg", color: Constants.primaryColor, width: 50, height: 50,)  ),
                  ),),

                GridTile(
                  footer: Center(child: Text("Namaz Öyrənirəm", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          // Navigator.push(context, SizeTransition2(BookReaderNamaz()));
                          Navigator.push(context, SizeTransition2(NamazPage()));


                        }, child:  Image.asset("assets/prayer-rug.png", color: Constants.primaryColor,) ),
                  ),),
                GridTile(
                  footer: Center(child: Text("Məscidlər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(MapMosque()));

                        }, child: Image.asset("assets/mosqaz.png", color: Constants.primaryColor,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Qəza Hesablama", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(QezaNamaz()));

                        }, child: Icon(Icons.calculate_outlined, color: Constants.primaryColor, size: 35,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Dini Filmlər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(Movies()));

                        }, child: Icon(Icons.movie_creation_outlined, size: 37
                      , color: Constants.primaryColor ,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("İlahilər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(IlahiList()));
                        }, child:  Icon(FontAwesomeIcons.music, size: 30, color: Constants.primaryColor ,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("E-kartlar", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(Ekarts()));
                        }, child:  Icon(FontAwesomeIcons.sheetPlastic, size: 30, color: Constants.primaryColor ,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Linklər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(UsefulLinks()));
                        }, child:  Icon(FontAwesomeIcons.link, size: 30, color: Constants.primaryColor ,)),
                  ),),


                GridTile(
                  footer: Center(child: Text("Vaxtlar Haqqında", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(AboutPrayerTimes()));
                        }, child:  Icon(FontAwesomeIcons.info, size: 30, color: Constants.primaryColor ,)),
                  ),),

                GridTile(
                  footer: Center(child: Text("Dini Sual Göndər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(SendEmail()));
                          // void _launchUrl() async {
                          //   if (!await launch(Uri.parse("https://form.jotform.com/203285791454461").toString(), forceSafariVC: true, forceWebView: false)) throw 'Could not launch https://form.jotform.com/203285791454461';
                          // }
                          // _launchUrl();
                        }, child:  Icon(FontAwesomeIcons.question, size: 30, color: Constants.primaryColor ,)),
                  ),),



                GridTile(
                  footer: Center(child: Text("Düzəlişlər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(SettingsPage()));

                        }, child:  Icon(Icons.settings, size: 37
                      , color: Constants.primaryColor ,) ),
                  ),),


                GridTile(
                  footer: Center(child: Text("Paylaş", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 9
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: ()
                          async{
                            await Share.share("Azərbaycan üçün Namaz Vaxtı tətbiqi https://play.google.com/store/apps/details?id=com.turkiyetakvimi&gl=US");
                          },
                        child:  Icon(FontAwesomeIcons.share, size: 37
                      , color: Constants.primaryColor ,) ),
                  ),),








              ],
            ),
          ),
        ),
        color: Constants.primaryColor
      ),
    );
  }
}
