import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import '../../../PaddingManager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../HomeScreen/PageViewPage/PageViewPage.dart';
class QezaNamaz extends StatefulWidget {
  const QezaNamaz({Key? key}) : super(key: key);

  @override
  State<QezaNamaz> createState() => _QezaNamazState();
}

class _QezaNamazState extends State<QezaNamaz> {
  GetStorage box = GetStorage();
  var currentDay = 0;
  var currentMonth = 0;
  var currentYear = 0;
  bool show = true;
  String? gender;
  int? _year;
  var subh, zohr, asr, sam, yatsi, vitr, oruc;
  @override
  void initState() {
    show =  box.read("showQeza")??true;
     subh = box.read("subhQeza");
     zohr = box.read("zohrQeza");
     asr = box.read("asrQeza");
     sam = box.read("samQeza");
     yatsi = box.read("yatsiQeza");
     vitr = box.read("vitrQeza");
     oruc = box.read("orucQeza");

    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
     box.write("subhQeza", subh);
      box.write("zohrQeza", zohr);
    box.write("asrQeza", asr);
    box.write("samQeza", sam);
    box.write("yatsiQeza", yatsi);
    box.write("vitrQeza", vitr);
    box.write("orucQeza", oruc);
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        leading: IconButton(onPressed: () {    Navigator.pop(context);
        }, icon: Icon(Icons.chevron_left, size: 30,),),
        title: Text("Qəza Hesablama", style: TextStyle(fontFamily: "Oswald"),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        shadowColor: Colors.transparent,
      ),
      body: show ? Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Gün", style: TextStyle(
                        fontSize: 20, color: Constants.primaryColor
                      ),),
                      NumberPicker(
                        value: currentDay,
                        minValue: 0,
                        maxValue: 365,
                        onChanged: (value){
                          print(currentDay);
                          setState(() => currentDay = value);},
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Ay", style: TextStyle(
                      fontSize: 20, color: Constants.primaryColor
                  ),),
                      NumberPicker(
                        value: currentMonth,
                        minValue: 0,
                        maxValue: 12,
                        onChanged: (value){
                          print(currentMonth);
                          setState(() => currentMonth = value);},                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("İl", style: TextStyle(
                      fontSize: 20, color: Constants.primaryColor
                  ),),
                      NumberPicker(
                        value: currentYear,
                        minValue: 0,
                        maxValue: 100,
                        onChanged: (value){
                          print(currentYear);
                          setState(() => currentYear = value);},                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {

               show = false;
               box.write("showQeza", false );
                _year = (currentYear*365 + currentMonth*30 + currentDay);
                subh = (_year);
                zohr = (_year);
                asr = (_year);
                sam = (_year);
                yatsi = (_year);
                vitr = (_year);
                oruc = (0);
                box.write("subhQeza", subh);
                box.write("zohrQeza", zohr);
                box.write("asrQeza", asr);
                box.write("samQeza", sam);
                box.write("yatsiQeza", yatsi);
                box.write("vitrQeza", vitr);
                box.write("orucQeza", oruc);






              });
              print(_year);


            }, child: Text("Hesabla"), style: ElevatedButton.styleFrom(backgroundColor: Constants.primaryColor),)
          ],
        ),
      ) :


      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                Padding(
                padding: PaddingManager().prayerTimeWidgetPadding,
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).errorColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(.2),
                        blurRadius: 30,
                        offset: Offset(20, 30),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),


                  child: ListTile(

                    title:
                    Text( "Sübh Namazı", maxLines: 1, style: TextStyle(fontSize: 15),),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        IconButton(icon: Icon(Icons.remove, color: Constants.primaryColor,), onPressed: () {
                          setState(() {
                            subh--;

                          });
                        },),
                        SizedBox(width: 10,),
                        AnimatedFlipCounter(value: subh),

                        SizedBox(width: 10,),

                        IconButton(icon: Icon(Icons.add, color: Constants.primaryColor,), onPressed: (){
                          setState(() {
                            subh++;

                          });
                        },),
                      ],
                    ),

                  ))),
                Padding(
                    padding: PaddingManager().prayerTimeWidgetPadding,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).errorColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.2),
                              blurRadius: 30,
                              offset: Offset(20, 30),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),


                        child: ListTile(

                          title:
                          Text( "Zöhr Namazı", maxLines: 1, style: TextStyle(fontSize: 15),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              IconButton(icon: Icon(Icons.remove, color: Constants.primaryColor,), onPressed: () {
                                setState(() {
                                  zohr--;

                                });
                              },),
                              SizedBox(width: 10,),
                              AnimatedFlipCounter(value: zohr),

                              SizedBox(width: 10,),

                              IconButton(icon: Icon(Icons.add, color: Constants.primaryColor,), onPressed: (){
                                setState(() {
                                  zohr++;

                                });
                              },),
                            ],
                          ),

                        ))),
                Padding(
                    padding: PaddingManager().prayerTimeWidgetPadding,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).errorColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.2),
                              blurRadius: 30,
                              offset: Offset(20, 30),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),


                        child: ListTile(

                          title:
                          Text( "Əsr Namazı", maxLines: 1, style: TextStyle(fontSize: 15),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              IconButton(icon: Icon(Icons.remove, color: Constants.primaryColor,), onPressed: () {
                                setState(() {
                                  asr--;

                                });
                              },),
                              SizedBox(width: 10,),
                              AnimatedFlipCounter(value: asr),

                              SizedBox(width: 10,),

                              IconButton(icon: Icon(Icons.add, color: Constants.primaryColor,), onPressed: (){
                                setState(() {
                                  asr++;

                                });
                              },),
                            ],
                          ),

                        ))),
                Padding(
                    padding: PaddingManager().prayerTimeWidgetPadding,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).errorColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.2),
                              blurRadius: 30,
                              offset: Offset(20, 30),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),


                        child: ListTile(

                          title:
                          Text( "Axşam Namazı", maxLines: 1, style: TextStyle(fontSize: 15),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              IconButton(icon: Icon(Icons.remove, color: Constants.primaryColor,), onPressed: () {
                                setState(() {
                                  sam--;

                                });
                              },),
                              SizedBox(width: 10,),
                              AnimatedFlipCounter(value: sam),

                              SizedBox(width: 10,),

                              IconButton(icon: Icon(Icons.add, color: Constants.primaryColor,), onPressed: (){
                                setState(() {
                                  sam++;

                                });
                              },),
                            ],
                          ),

                        ))),
                Padding(
                    padding: PaddingManager().prayerTimeWidgetPadding,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).errorColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.2),
                              blurRadius: 30,
                              offset: Offset(20, 30),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),


                        child: ListTile(

                          title:
                          Text( "İşa Namazı", maxLines: 1, style: TextStyle(fontSize: 15),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              IconButton(icon: Icon(Icons.remove, color: Constants.primaryColor,), onPressed: () {
                                setState(() {
                                  yatsi--;

                                });
                              },),
                              SizedBox(width: 10,),
                              AnimatedFlipCounter(value: yatsi),

                              SizedBox(width: 10,),

                              IconButton(icon: Icon(Icons.add, color: Constants.primaryColor,), onPressed: (){
                                setState(() {
                                  yatsi++;
                                });

                              },),
                            ],
                          ),

                        ))),
                Padding(
                    padding: PaddingManager().prayerTimeWidgetPadding,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).errorColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.2),
                              blurRadius: 30,
                              offset: Offset(20, 30),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),


                        child: ListTile(

                          title:
                          Text( "Vitr Namazı", maxLines: 1, style: TextStyle(fontSize: 15, )),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              IconButton(icon: Icon(Icons.remove, color: Constants.primaryColor,), onPressed: () {
                                setState(() {
                                  vitr--;

                                });
                              },),
                              SizedBox(width: 10,),
                              AnimatedFlipCounter(value: vitr),

                              SizedBox(width: 10,),

                              IconButton(icon: Icon(Icons.add, color: Constants.primaryColor,), onPressed: (){
                                setState(() {
                                  vitr++;

                                });
                              },),
                            ],
                          ),

                        ))),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ),
                Padding(
                    padding: PaddingManager().prayerTimeWidgetPadding,

                      child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).errorColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(.2),
                                blurRadius: 30,
                                offset: Offset(20, 30),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),


                          child: ListTile(

                            title:
                            Text( "Oruc", maxLines: 1, style: TextStyle(fontSize: 15, )),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                IconButton(icon: Icon(Icons.remove, color: Constants.primaryColor,), onPressed: () {
                                  setState(() {
                                    oruc--;

                                  });

                                },),
                                SizedBox(width: 10,),
                                AnimatedFlipCounter(value: oruc),

                                SizedBox(width: 10,),

                                IconButton(icon: Icon(Icons.add, color: Constants.primaryColor,), onPressed: (){
                                  setState(() {
                                    oruc++;

                                  });
                                },),
                              ],
                            ),

                          )),
                    ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("* Qeyd: Hesablama zamanı 1 il ortalama 365 gün, Ramazan ayı 30 gün olduğu nəzərə alınır",
                    style: TextStyle(color: Colors.white, ),),
                ),


              ],
            ),
          ),
        ),
      ),


    );
  }
}



