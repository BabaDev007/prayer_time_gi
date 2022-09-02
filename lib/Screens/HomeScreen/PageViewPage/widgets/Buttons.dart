import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Constants.dart';
import '../../../../PageTransition/PageTransition.dart';
import '../../../MenuPages/DiniBilgiler/DiniBilgiler.dart';
import '../../../MenuPages/Esmail_Husna/EsmaScreen.dart';
import '../../../MenuPages/KompassScreen/qiblah_compass.dart';
import '../../../MenuPages/ZikirMatik/ZikirMatik.dart';

class DayButtons extends StatelessWidget {
  const DayButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
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
                      Navigator.push(context, SizeTransition2(QiblahCompass()));
                    }, child:  Icon(Icons.more_vert_sharp, color: Constants.primaryColor,) ),
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
    );
  }
}
