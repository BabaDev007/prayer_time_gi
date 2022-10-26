import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants.dart';
import '../../../../MenuPages/Dualar/DualarClass.dart';
import 'package:jiffy/jiffy.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/dua-hands.png", color: Colors.blue, width: 25, height: 30,),
                      SizedBox(width: 10,),
                      Text("Günün duası", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "PlayfairDisplay-VariableFont", color: Constants.primaryColor ),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: AnimatedCrossFade(
                      firstChild: Text( maxLines: 4, Dualar.dualar2[Jiffy().dayOfYear].metin,  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                        style: TextStyle(fontFamily: "PlayfairDisplay-VariableFont", color: Colors.black.withOpacity(.8), ),),
                      secondChild: Text( maxLines: 1000, Dualar.dualar2[Jiffy().dayOfYear].metin,  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                        style: TextStyle(fontFamily: "PlayfairDisplay-VariableFont", color: Colors.black.withOpacity(.8), ),) ,
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
