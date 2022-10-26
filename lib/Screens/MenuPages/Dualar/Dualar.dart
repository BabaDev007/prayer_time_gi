
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../Constants.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';
import 'DualarClass.dart';
class DualarPage extends StatefulWidget {
  @override
  _DualarPageState createState() => _DualarPageState();
}

class _DualarPageState extends State<DualarPage> {
  String TapToExpandIt = 'Tap to Expand it';
  String Sentence = 'Widgets that have global keys reparent their subtrees when'
      ' they are moved from one location in the tree to another location in the'
      ' tree. In order to reparent its subtree, a widget must arrive at its new'
      ' location in the tree in the same animation frame in which it was removed'
      ' from its old location the tree.'
      ' Widgets that have global keys reparent their subtrees when they are moved'
      ' from one location in the tree to another location in the tree. In order'
      ' to reparent its subtree, a widget must arrive at its new location in the'
      ' tree in the same animation frame in which it was removed from its old'
      ' location the tree.';
  bool isExpanded = true;
  bool isExpanded2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Constants.primaryColor,
      appBar:



      PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              leading: IconButton(onPressed: () {      Navigator.pop(context);
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Dualar", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,
      body: Scrollbar(
        child: ListView.builder(
          itemCount: Dualar.dualar.length,
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (BuildContext context, int index) {
            return  InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  Dualar.dualar[index].expanded2 = ! Dualar.dualar[index].expanded2;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.symmetric(
                  horizontal:  Dualar.dualar[index].expanded2 ? 25 : 1,
                  vertical: 10                                                                                                                                                    ,
                ),
                padding: EdgeInsets.all(20),
                // height:  Dualar.dualar[index].expanded2? 70 : 450,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1200),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffe5d9d9).withOpacity(0.5),
                      blurRadius: 20,
                      offset: Offset(5, 10),
                    ),
                  ],
                  color: Colors.white.withOpacity(.9),
                  borderRadius: BorderRadius.all(
                    Radius.circular( Dualar.dualar[index].expanded2 ? 20 : 10),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Dualar.dualar[index].expanded2 ?  CircleAvatar(
                            child: Image.asset("assets/dua-hands.png", color: Colors.white, width: 30, height: 50,)) : SizedBox()
                      ),
                        Flexible(
                          child: Text(
                            Dualar.dualar[index].bashliq, maxLines:Dualar.dualar[index].expanded2 ? 1 : 2 ,
                            style: TextStyle(
                              fontFamily: "Oswald",
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Icon(
                          Dualar.dualar[index].expanded2
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Colors.black38,
                          size: 27,
                        ),
                      ],
                    ),
                    Dualar.dualar[index].expanded2 ? SizedBox() : SizedBox(height: 20),
                    AnimatedCrossFade(
                      firstChild: Text(
                        '',
                        style: TextStyle(
                          fontSize: 0,
                        ),
                      ),
                      secondChild: Text(
                        Dualar.dualar[index].metin,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.7,
                        ),
                      ),
                      crossFadeState:  Dualar.dualar[index].expanded2
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 1200),
                      reverseDuration: Duration.zero,
                      sizeCurve: Curves.fastLinearToSlowEaseIn,
                    ),
                  ],
                ),
              ),
            );
          },




        ),
      ),
    );
  }
}