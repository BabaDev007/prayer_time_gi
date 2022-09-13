import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants.dart';

class DuaCard extends StatefulWidget {
  const DuaCard({Key? key}) : super(key: key);

  @override
  State<DuaCard> createState() => _DuaCardState();
}

class _DuaCardState extends State<DuaCard> {
  int maxLines = 4;
  var visual = "Oxu";

  var zor = false;
    @override
    Widget build(BuildContext context) {
      return  Padding(
        padding: const EdgeInsets.all(4.0),
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(" Günün duası", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "GentiumBookPlus", color: Constants.primaryColor ),),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: AnimatedCrossFade(
                      firstChild: Text( maxLines: 4, """Hədisi-şərifdə buyuruldu ki: Dünya və axirət səadəti istəyən, Allahümmə Rabbənə ətinə fiddünyə hasənətən və fil axirəti hasənətən və qına azəbənnər. Birahmətikə ya Ərhamərrahimin duasını oxusun.""",  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                        style: TextStyle(fontFamily: "GentiumBookPlus", fontWeight: FontWeight.w300, color: Colors.black.withOpacity(.8), ),),
                      secondChild: Text( maxLines: 1000,"""Hədisi-şərifdə buyuruldu ki: Dünya və axirət səadəti istəyən, Allahümmə Rabbənə ətinə fiddünyə hasənətən və fil axirəti hasənətən və qına azəbənnər. Birahmətikə ya Ərhamərrahimin duasını oxusun.""",  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                        style: TextStyle(fontFamily: "GentiumBookPlus", fontWeight: FontWeight.w300, color: Colors.black.withOpacity(.8), ),) ,
                      crossFadeState: zor ?  CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: 300),

                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(onPressed: () {
                        setState(() {
                          zor = !zor;
                          zor ? visual = "Bağla" : visual = "Oxu";                      });
                      },
                          child: Row(
                            children: [
                              Icon(Icons.chrome_reader_mode_outlined),
                              SizedBox(width: 10,),
                              Text(visual, style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),),
                            ],
                          )),
                      TextButton(onPressed: () {  },
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.share, color: Constants.primaryColor,),
                              SizedBox( width: 20,),
                              Text("Paylaş", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)

                            ],
                          )),


                    ],
                  )


                ],
              ),
            ),
          ),
        ),
      );;
  }
}
