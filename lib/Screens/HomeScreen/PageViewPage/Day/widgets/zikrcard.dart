import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants.dart';

class ZikrCard extends StatefulWidget {
  const ZikrCard({Key? key}) : super(key: key);

  @override
  State<ZikrCard> createState() => _ZikrCardState();
}

class _ZikrCardState extends State<ZikrCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/tasbih.png", color: Colors.blue, width: 110, height: 100,),
                  SizedBox(width: 10,),
                  Expanded(child: Text("Zikilərinizi tamamladınız mı ?", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "GentiumBookPlus", color: Constants.primaryColor ),)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                      onPressed: () {},
                      child: Text("Bəli", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)),
                  OutlinedButton(
                      onPressed: () {},
                      child: Text("Xeyr", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)),

                ],
              ),



            ],
          ),
        ),
      ),
    );;
  }
}
