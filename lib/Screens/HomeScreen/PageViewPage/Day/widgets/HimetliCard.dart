import 'package:flutter/material.dart';

import '../../../../../Constants.dart';

class HikmetliSozCard extends StatefulWidget {
  const HikmetliSozCard({Key? key}) : super(key: key);

  @override
  State<HikmetliSozCard> createState() => _HikmetliSozCardState();
}

class _HikmetliSozCardState extends State<HikmetliSozCard> {
  int maxLines = 4;
  var visual = "Oxu";
var zor = false;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(" Hikmətli sözlər", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "GentiumBookPlus", color: Constants.primaryColor ),),
            Text(" Hikmət əhli buyurdu ki,", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "GentiumBookPlus"  ,),),

              Padding(
                padding: const EdgeInsets.all(3.0),
                child: AnimatedCrossFade(
                  firstChild: Text( maxLines: maxLines, "Nəfsinə tabe olan pərişan olmuşdur. Ondan sonra oturub-durarkən onun yoldaşı şeytandır.",  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                    style: TextStyle(fontFamily: "GentiumBookPlus", fontWeight: FontWeight.w300, color: Colors.black.withOpacity(.8), ),),
                  secondChild:  Text( maxLines: maxLines, "Nəfsinə tabe olan pərişan olmuşdur. Ondan sonra oturub-durarkən onun yoldaşı şeytandır.",  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                    style: TextStyle(fontFamily: "GentiumBookPlus", fontWeight: FontWeight.w300, color: Colors.black.withOpacity(.8),),),
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
                      zor ? maxLines = 4: 1000;
                      maxLines == 1000 ? visual = "Bağla" : visual = "Oxu";

                    });
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
    );
  }
}
