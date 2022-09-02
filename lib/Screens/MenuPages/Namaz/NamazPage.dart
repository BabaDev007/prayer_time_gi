import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../Constants.dart';
import '../../../PaddingManager.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../PageTransition/PageTransition.dart';
import '../Books/BookList.dart';
class NamazPage extends StatelessWidget {

  var _listTile = [
    _listTileWidget("Namaz nədir ?", "Yazılı", Container(), Icon(Icons.picture_as_pdf_outlined)),
    _listTileWidget("ss", "sss", Container(), Icon(Icons.add)),
    _listTileWidget("ss", "sss", Container(), Icon(Icons.add)),
    _listTileWidget("ss", "sss", Container(), Icon(Icons.add)),
    _listTileWidget("ss", "sss", Container(), Icon(Icons.add)),
    _listTileWidget("ss", "sss", Container(), Icon(Icons.add)),
    _listTileWidget("ss", "sss", Container(), Icon(Icons.add)),
    _listTileWidget("ss", "sss", Container(), Icon(Icons.add)),

  ];




  @override
  Widget build(BuildContext context) {
   var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Faydalı Keçidlər",style: TextStyle(fontFamily: "Oswald")),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.chevron_left, size: 30,)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [

          SafeArea(
            child: AnimationLimiter(
              child: ListView.builder(

                padding: EdgeInsets.all(_w / 30),
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: _listTile.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: Duration(milliseconds: 80),
                    child: SlideAnimation(
                      duration: Duration(milliseconds: 1800),
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: 30,
                      verticalOffset: 300.0,
                      child: FlipAnimation(
                          duration: Duration(milliseconds: 3000),
                          curve: Curves.fastLinearToSlowEaseIn,
                          flipAxis: FlipAxis.y,
                          child: _listTile[index]
                      ),
                    ),
                  );
                },

              ),
            ),
          ),
        ],
      ),
    );
  }


}

class _listTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget widget;
  final Icon icon;

  _listTileWidget(this.title, this.subtitle, this.widget, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: InkWell(
          onTap: (){
            Navigator.push(context, SizeTransition2(widget));
          },
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
                leading: icon,
                title: AutoSizeText(title, maxLines: 1,),
                trailing: Icon(Icons.chevron_right),
                subtitle: AutoSizeText(subtitle, maxLines: 1,),

              )),
        ));;
  }
}

