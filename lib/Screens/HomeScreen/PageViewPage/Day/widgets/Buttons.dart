import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Dualar/Dualar.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Shuhada/Shuhada.dart';

import '../../../../../Constants.dart';
import '../../../../../PageTransition/PageTransition.dart';
import '../../../../MenuPages/Books/BookList.dart';
import '../../../../MenuPages/DiniBilgiler/DiniBilgiler.dart';
import '../../../../MenuPages/Ekarts/Ekarts.dart';
import '../../../../MenuPages/Esmail_Husna/EsmaScreen.dart';
import '../../../../MenuPages/KompassScreen/qiblah_compass.dart';
import '../../../../MenuPages/Map/Map.dart';
import '../../../../MenuPages/Movies/MovieTile.dart';
import '../../../../MenuPages/Namaz/NamazPage.dart';
import '../../../../MenuPages/QezaNamaz/QezaNamaz.dart';
import '../../../../MenuPages/UsefulLinks/UseFulLinks.dart';
import '../../../../MenuPages/ZikirMatik/ZikirMatik.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../MenuPages/İlahiler/IlahiList.dart';
import '../../../Widgets.dart';

class DayButtons extends StatefulWidget {
  @override
  State<DayButtons> createState() => _DayButtonsState();
}

class _DayButtonsState extends State<DayButtons> {
bool isButton = false;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: AnimatedCrossFade(
        firstChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AspectRatio(
                  aspectRatio: 1/1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                      onPressed: (){
                       setState((){
                         isButton = true;
                       });
                      }, child:  Icon(Icons.arrow_downward_outlined, color: Constants.primaryColor,) ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AspectRatio(
                  aspectRatio: 1/1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                      onPressed: (){
                        Navigator.push(context, SizeTransition2(QiblahCompass()));
                      }, child:  Image.asset("assets/kaaba.png", color: Constants.primaryColor, ) ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AspectRatio(
                  aspectRatio: 1/1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                      onPressed: (){
                        Navigator.push(context, SizeTransition2(EsmaScreen()));
                      }, child:  Image.asset("assets/allah.png", color: Constants.primaryColor, ) ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AspectRatio(
                  aspectRatio: 1/1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                      onPressed: (){
                        Navigator.push(context, SizeTransition2(ZikrPage()));
                      }, child:  Image.asset("assets/tasbih.png", color: Constants.primaryColor, ) ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AspectRatio(
                  aspectRatio: 1/1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                      onPressed: (){
                        Navigator.push(context, SizeTransition2(DiniBilgilerPage()));
                      }, child:  Image.asset("assets/dinibilgiler.png", color: Constants.primaryColor, ) ),
                ),
              ),
            ),





          ],
        ),
        secondChild: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            setState(() {
                              isButton = false;
                            });
                          }, child:  Icon(Icons.arrow_upward, color: Constants.primaryColor,) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(QiblahCompass()));
                          }, child:  Image.asset("assets/kaaba.png", color: Constants.primaryColor, ) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(EsmaScreen()));
                          }, child:  Image.asset("assets/allah.png", color: Constants.primaryColor, ) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(ZikrPage()));
                          }, child:  Image.asset("assets/tasbih.png", color: Constants.primaryColor, ) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(DiniBilgilerPage()));
                          }, child:  Image.asset("assets/dinibilgiler.png", color: Constants.primaryColor, ) ),
                    ),
                  ),
                ),





              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(DualarPage()));
                          }, child:   Image.asset("assets/dua-hands.png", color: Constants.primaryColor, width: 150, height: 100,) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(MapMosque()));
                          }, child:  Image.asset("assets/mosqaz.png", color: Constants.primaryColor,) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(QezaNamaz()));
                          }, child:  Center(child: Icon(Icons.calculate_outlined, color: Constants.primaryColor, size: 32,)) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(EBookList()));
                          }, child:   Icon(FontAwesomeIcons.quran, size: 30, color: Constants.primaryColor ,) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(Themes()));
                          }, child:  SvgPicture.asset("assets/mosq.svg", color: Constants.primaryColor, width: 50, height: 50,) ),
                    ),
                  ),
                ),






              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(UsefulLinks()));
                          }, child:  Icon(FontAwesomeIcons.link, size: 28, color: Constants.primaryColor ,)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(Ekarts()));
                          }, child: Icon(FontAwesomeIcons.sheetPlastic, size: 30, color: Constants.primaryColor ,) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(IlahiList()));
                          }, child:  Center(child: Icon(FontAwesomeIcons.music, size: 30, color: Constants.primaryColor ,)) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(Movies()));
                          }, child:   Icon(Icons.movie_creation_outlined, size: 37
                        , color: Constants.primaryColor ,) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(NamazPage()));

                          }, child:  Image.asset("assets/prayer-rug.png", color: Constants.primaryColor,) ),
                    ),
                  ),
                ),






              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(UsefulLinks()));
                          }, child:  Icon(FontAwesomeIcons.link, size: 28, color: Constants.primaryColor ,)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(Ekarts()));
                          }, child: Icon(FontAwesomeIcons.sheetPlastic, size: 30, color: Constants.primaryColor ,) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(IlahiList()));
                          }, child:  Center(child: Icon(FontAwesomeIcons.music, size: 30, color: Constants.primaryColor ,)) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(Movies()));
                          }, child:   Icon(Icons.movie_creation_outlined, size: 37
                        , color: Constants.primaryColor ,) ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.white),
                          onPressed: (){
                            Navigator.push(context, SizeTransition2(Shuhada()));

                          }, child:  Container(
                                width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Constants.primaryColor, width: 2)
                            ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset("assets/ks.jpg"))) ),
                    ),
                  ),
                ),






              ],
            ),

          ],
        ),
        crossFadeState: isButton ? CrossFadeState.showSecond : CrossFadeState.showFirst , duration: Duration(milliseconds: 300),
      ),
    );
  }
}
