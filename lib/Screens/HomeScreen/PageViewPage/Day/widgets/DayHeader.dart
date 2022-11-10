import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prayer_time_gi/StateManagement/StateManagement.dart';
import '../../../../../Constants.dart';
class DayHeader extends StatefulWidget {
  @override
  State<DayHeader> createState() => _DayHeaderState();
}

class _DayHeaderState extends State<DayHeader> {
  Controller c = Get.put(Controller());
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
                    gradient: LinearGradient(colors: [Colors.blueAccent.withOpacity(.4 ), Constants.primaryColor.withOpacity(.8)]

                    ),
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(20)

                )),

            Positioned(
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${c.globalTimeName}\n${c.globalTimeTime}".toString(), style: TextStyle(fontSize: 25, fontFamily: "Oswald", color: Colors.white),),


                ],
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child:

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularPercentIndicator(
                      backgroundWidth: 1,
                      percent: .2,
                      progressColor: Colors.white,
                      backgroundColor: Colors.white38,
                      radius: 40.0,
                      lineWidth: 3.0,


                      center: FittedBox(
                        child: Text(c.duration.toString().substring(0,7), style: TextStyle(fontSize: 20, fontFamily: "Oswald", color: Colors.white  )),)),
                ))









          ],
        )
    );
  }
}
