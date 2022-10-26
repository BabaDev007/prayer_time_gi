import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_time_gi/Screens/MenuPages/ZikirMatik/ZikirlerPage.dart';
import 'package:prayer_time_gi/StateManagement/StateManagement.dart';
import '../../../../../Constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../PageTransition/PageTransition.dart';
import '../../../../MenuPages/Ekarts/Ekarts.dart';

class ZikrCard extends StatefulWidget {

  @override
  State<ZikrCard> createState() => _ZikrCardState();
}

class _ZikrCardState extends State<ZikrCard> {
  GetStorage box = GetStorage();
  var visible = true;
  Controller c = Get.put(Controller());
  var isOk = false;
  @override
  void initState() {

   isOk = box.read("zikrsucces${Jiffy().dayOfYear}") ?? false;
   visible = !isOk;
   print(box.read("zikrsucces${Jiffy().dayOfYear}"));
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {

    box.write("zikrsucces${Jiffy().dayOfYear}", isOk);
    box.remove("zikrsucces${Jiffy().dayOfYear-1}");

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible ,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                AnimatedCrossFade(firstChild:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/tasbeh1.png", width: 90, height: 90,),
                        SizedBox(width: 10,),
                        Expanded(child: Text("Zikrlərinizi tamamladınız mı ?", style: TextStyle(fontWeight: FontWeight.normal,  color: Constants.primaryColor, fontSize: Get.width/15 ),)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                isOk = true;
                                box.write("zikrsucces${Jiffy().dayOfYear}", isOk);
                              });
                            },
                            child: Text("Bəli", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)),

                        OutlinedButton(
                            onPressed: () {
                              Navigator.push(context, SizeTransition2(ZikirlerPage()));

                            },
                            child: Text("Xeyr", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),))
                      ],
                    ),



                  ],
                ) , secondChild: Center(child: Lottie.asset("assets/96237-success.json", width: 100)),
                  crossFadeState: isOk ? CrossFadeState.showSecond : CrossFadeState.showFirst , duration: Duration(milliseconds: 300),),

          ),
        ),
      ),
    );
  }
}
