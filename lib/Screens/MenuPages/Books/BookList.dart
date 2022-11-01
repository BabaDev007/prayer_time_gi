import 'dart:io';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Books/BookTile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../Constants.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';
import '../../HomeScreen/Widgets.dart';
import 'BookNameClass.dart';
import 'EbookListTile.dart';
import 'package:cool_alert/cool_alert.dart';


class BookList extends StatefulWidget {
   BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.primaryColor,
      extendBodyBehindAppBar: true,
      appBar:
      PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              actions: [
                IconButton(onPressed: (){
                  CoolAlert.show(
                      backgroundColor: Constants.primaryColor,
                      confirmBtnText: "Anladım",
                      cancelBtnText: "Xeyr",
                      context: context,
                      type: CoolAlertType.info,
                      text: "Təqdim olunmuş kitabların hər biri  Dini Qurumlarla İş Üzrə Dövlət Komitəsi tərəfindən yoxlanışdan keçərək, nəzarət markası ilə markalanmışdır.",
                      title: "Məlumat",

                      onConfirmBtnTap: (){
                        Navigator.pop(context);
                      }

                  ) ??false;




                }, icon: Icon(Icons.info_outline_rounded))
              ],
              leading: IconButton(onPressed: () {     Navigator.pop(context);
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Dini Kitablar", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,














      body: AnimationLimiter(
        child:  ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: _w /30, vertical: 100),
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: BookListDart.BookListView.length,
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
              child: BookTile(

                BookListDart.BookListView[index].bookPngPath,
              BookListDart.BookListView[index].bookTitle,
              BookListDart.BookListView[index].subtitle,
              BookListDart.BookListView[index].bookLink,


              ),
              ),
              ),
            );
          },

          ),
        ),
    );
  }
}
class EBookList extends StatefulWidget {
  EBookList({Key? key}) : super(key: key);

  @override
  State<EBookList> createState() => _EBookListState();
}

class _EBookListState extends State<EBookList> {
  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Constants.primaryColor,

        extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              actions: [
                IconButton(onPressed: (){
                  CoolAlert.show(
                      backgroundColor: Constants.primaryColor,
                      confirmBtnText: "Anladım",
                      cancelBtnText: "Xeyr",
                      context: context,
                      type: CoolAlertType.info,
                      text: "Təqdim olunmuş kitabların hər biri  Dini Qurumlarla İş Üzrə Dövlət Komitəsi tərəfindən yoxlanışdan keçərək, nəzarət markası ilə markalanmışdır.",
                      title: "Məlumat",
                      onCancelBtnTap: (){

                      },
                      onConfirmBtnTap: (){
                        Navigator.pop(context);

                      }

                  ) ??false;

                }, icon: Icon(Icons.info_outline_rounded))
              ],
              leading: IconButton(onPressed: () {     Navigator.pop(context);
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Dini Kitablar", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,



      body: Stack(
        children: [
          Stack1(),
          AnimationLimiter(
            child:  ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: _w /30, vertical: 100),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: BookListDart.BookListView1.length,
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
                      child: EBookTile(

                        BookListDart.BookListView1[index].bookPngPath,
                        BookListDart.BookListView1[index].bookTitle,
                        BookListDart.BookListView1[index].subtitle,
                        BookListDart.BookListView1[index].bookLink,


                      ),
                    ),
                  ),
                );
              },

            ),
          ),
        ],
      ),
    );
  }
}







