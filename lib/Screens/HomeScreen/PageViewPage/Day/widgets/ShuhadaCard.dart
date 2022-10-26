import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Shuhada/Shuhada.dart';

import '../../../../../PageTransition/PageTransition.dart';
import '../../../../MenuPages/KompassScreen/qiblah_compass.dart';


class ShuhadaCard extends StatelessWidget {
  const ShuhadaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child:


      InkWell(
        onTap: (){
          Navigator.push(context, SizeTransition2(Shuhada()));
        },
        child: Container(


          child: Stack(
            alignment: Alignment.center,
            children: [


              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                color: Colors.white,
                child: Container(

                  width: double.infinity,
                  child: FittedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/ks.jpg", fit: BoxFit.contain,)
                        ),



                      ],
                    ),
                  ),
                ),
              ),





            ],
          ),
        ),
      ),

    );;
  }
}
