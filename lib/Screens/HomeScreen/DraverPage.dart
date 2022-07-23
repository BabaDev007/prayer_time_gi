import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayer_time_gi/Screens/Settings/SettingPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import '../../Constants.dart';
import '../../PageTransition/PageTransition.dart';
import '../MenuPages/AboutPrayerTimes/AboutPrayerTimes.dart';
import '../MenuPages/Books/BookList.dart';
import '../MenuPages/Esmail_Husna/EsmaScreen.dart';
import '../MenuPages/Feedback/FeedbackPage.dart';
import '../MenuPages/KompassScreen/qiblah_compass.dart';
import '../MenuPages/Movies/MovieTile.dart';
import '../MenuPages/UsefulLinks/UseFulLinks.dart';
import '../MenuPages/ZikirMatik/ZikirMatik.dart';
import '../MenuPages/İlahiler/IlahiList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DrawerPage extends  Drawer {

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor:  Constants.primaryColor,
      child:  Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            child: GridView.count(crossAxisCount: 3,
              children: [

                GridTile(
                  footer: Center(child: Text("Qiblə", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(QiblahCompass()));
                        }, child:  Icon(FontAwesomeIcons.kaaba, size: 30, color: Constants.primaryColor ,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Online Kitablar", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(BookList()));
                        }, child:  Icon(FontAwesomeIcons.bookQuran, size: 30, color: Constants.primaryColor ,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Offline Kitablar", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(EBookList()));
                        }, child:  Icon(FontAwesomeIcons.book, size: 30, color: Constants.primaryColor ,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Dijital Təsbih", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(ZikrPage()));

                        }, child: Image.asset("assets/tasbeh.png", height: 35,)),
                  ),),
                GridTile(
                  footer: Center(child: Text("Esma-i Hüsna", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(EsmaScreen()));

                        }, child: SvgPicture.asset("assets/99.svg", color: Constants.primaryColor, width: 100, height: 50,) ),
                  ),),
                GridTile(
                  footer: Center(child: Text("Dini Bilgilər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(ZikrPage()));

                        }, child:  Icon(FontAwesomeIcons.mosque, size: 30
                      , color: Constants.primaryColor ,) ),
                  ),),
                GridTile(
                  footer: Center(child: Text("Namaz Öyrənirəm", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(ZikrPage()));

                        }, child:  Icon(FontAwesomeIcons.starAndCrescent, size: 37
                      , color: Constants.primaryColor ,) ),
                  ),),
                GridTile(
                  footer: Center(child: Text("Dini Filmlər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
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
                      color: CupertinoColors.white, fontSize: 7
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
                  footer: Center(child: Text("Linklər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
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
                      color: CupertinoColors.white, fontSize: 7
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
                      color: CupertinoColors.white, fontSize: 7
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          void _launchUrl() async {
                            if (!await launch(Uri.parse("https://form.jotform.com/203285791454461").toString(), forceSafariVC: true, forceWebView: false)) throw 'Could not launch https://form.jotform.com/203285791454461';
                          }
                          _launchUrl();
                        }, child:  Icon(FontAwesomeIcons.question, size: 30, color: Constants.primaryColor ,)),
                  ),),



                GridTile(
                  footer: Center(child: Text("Düzəlişlər", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
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
                      color: CupertinoColors.white, fontSize: 7
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
                GridTile(
                  footer: Center(child: Text("Əlaqə", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white, fontSize: 7
                  ),)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), primary: Colors.white),
                        onPressed: (){
                          Navigator.push(context, SizeTransition2(FeedbackPage()));
                        }, child:  Icon(Icons.feedback_outlined, size: 30, color: Constants.primaryColor ,)),
                  ),),





              ],
            ),
          ),
        ),
        color: Colors.white.withOpacity(.2),
      ),
    );
  }
}
