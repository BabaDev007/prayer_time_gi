import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../Constants.dart';
class DayHeader extends StatefulWidget {
  const DayHeader({Key? key}) : super(key: key);

  @override
  State<DayHeader> createState() => _DayHeaderState();
}

class _DayHeaderState extends State<DayHeader> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [

            Container(
                child:  Opacity(opacity: .15,
                    child: Image.asset("assets/silhuette.png", fit: BoxFit.cover,)),
                height: Get.height/6,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20)

                )),

            Positioned(
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Əsr", style: TextStyle(fontSize: 30, fontFamily: "Oswald", color: Colors.white),),
                  Text("14:25", style: TextStyle(fontSize: 30, fontFamily: "Oswald", color: Colors.white.withOpacity(.6)),),

                ],
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child:

                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CircularPercentIndicator(
                      backgroundWidth: 4,
                      percent: .2,
                      progressColor: Constants.primaryColor,
                      backgroundColor: Colors.white38,
                      radius: 50.0,
                      lineWidth: 5.0,


                      center: FittedBox(
                        child: Text("-4:25:14", style: TextStyle(fontSize: 20, fontFamily: "Oswald", color: Colors.white  )),)),
                ))









          ],
        )
    );
  }
}
