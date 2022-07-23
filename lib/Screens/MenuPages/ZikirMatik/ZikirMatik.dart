import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/services.dart'; // we need this for the vibrations
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Constants.dart';
import 'Buttons.dart';


class ZikrPage extends StatefulWidget {


  @override
  State<ZikrPage> createState() => _ZikrPageState();
}

class _ZikrPageState extends State<ZikrPage> {
  @override
  void initState() {
    _iconButtonVibr = box.read("icon") ?? false;
    _counter = box.read("counter") ?? 0;
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    box.write("counter", _counter);

    // TODO: implement dispose
    super.dispose();
  }
 var box = GetStorage();
  var _switchButton = AudioCache(prefix: "assets/music/") ;


  int _counter = 0;

  void _incrementCounter() {
    box.write("counter", _counter);
    _iconButtonVibr ?_switchButton.play("s3.wav") :
    HapticFeedback.vibrate();
     setState(() {
      _counter++;
    });
  }


  void _decrementCounter() {
    box.write("counter", _counter);

    _iconButtonVibr ?_switchButton.play("s3.wav") :
    HapticFeedback.vibrate();
    setState((){
      if(_counter >0){
        _counter--;
      };

    });

  }

  void _restart() {
    box.write("counter", _counter);

    _iconButtonVibr ?_switchButton.play("s3.wav") :
    HapticFeedback.vibrate();
    setState((){
      _counter = 0;

    });

  }

  String _zikr = "";
  bool _iconButtonVibr = true;






    @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Constants.primaryColor,

      extendBodyBehindAppBar: true,

      appBar: AppBar(
        actions: [

          IconButton(onPressed: (){
            setState((){
              _iconButtonVibr = !_iconButtonVibr;
              box.write("icon", _iconButtonVibr);

            });
          }, icon: AnimatedCrossFade(firstChild: Icon(Icons.vibration), secondChild: Icon(Icons.music_note_outlined),
      crossFadeState: _iconButtonVibr ? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: Duration(milliseconds: 300),

    )


          )],

        centerTitle: true,
        title: Text("Təsbih", textAlign: TextAlign.center ,style: TextStyle(
          fontSize: 25,
          fontFamily: "Oswald",
          color: Colors.white,

        ),),
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),

                 Align(
                   alignment: Alignment.center,
                   child: GestureDetector(
                     onTap: _incrementCounter,
                     child: Center(
                         child: FittedBox(
                           child: Padding(
                             padding: const EdgeInsets.all(20.0),
                             child: AnimatedFlipCounter(
                               textStyle: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white, fontFamily: "Oswald"),
                               duration: Duration(milliseconds: 300),
                               curve: Curves.decelerate,
                               value: _counter, /* pass in a number like 2014 */
                             ),
                           ),
                         )
                     ),
                   ),
                 ),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: GestureDetector(
                          onTap: _decrementCounter,
                        )),
                        Expanded(child: GestureDetector(
                          onTap: _incrementCounter,
                        )),


                      ],
                    ),
                    height: 100,
                  ),
                ),



                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                         Expanded(child: ZikrButton(metod: _decrementCounter, buttonName: "-", )),



                        Expanded(
                          child: FloatingActionButton(
                              mini: true,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              onPressed: (){
                                Get.defaultDialog(
                                  onConfirm: (){
                                    _restart();
                                    Navigator.of(context).pop();
                                  },
                                  middleText: "Sayağacı sıfırlamaqda əminsiniz",
                                    confirmTextColor: Colors.white,
                                  title: "System",
                                  textConfirm: "Bəli",
                                  textCancel: "Xeyr"

                                );
                              }
                              //_restart
                               ,
                              child:  Icon(
                                Icons.restart_alt,
                                size: w/10,
                              ),
                            ),
                        ),


                       Expanded(child: ZikrButton(metod: _incrementCounter, buttonName: "+"))

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h/9 ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
