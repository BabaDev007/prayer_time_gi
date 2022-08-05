import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Books/BookTile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../Constants.dart';
import '../../HomeScreen/Widgets.dart';
import 'BookNameClass.dart';
import 'EbookListTile.dart';
import 'package:get/get.dart';


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
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Get.defaultDialog(
                onConfirm: (){
                  Get.back();
                },
              title: "Məlumat",
              middleText: "Təqdim olunmuş kitabların hər biri  Dini Qurumlarla İş Üzrə Dövlət Komitəsi tərəfindən yoxlanışdan keçərək, nəzarət markası ilə markalanmışdır."
                              );

          }, icon: Icon(Icons.info_outline_rounded))
        ],
        title: Text("Dini Kitablar", style: TextStyle(fontFamily: "Oswald"),),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.chevron_left, size: 30,)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),



      body: SafeArea(
        child: AnimationLimiter(
          child:  ListView.builder(
              padding: EdgeInsets.all( _w /30),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [ IconButton(onPressed: (){
          Get.defaultDialog(
            onConfirm: (){
              Get.back();
            },
              title: "Məlumat",
              middleText: "Təqdim olunmuş kitabların hər biri Dini İşlər üzrə komitənin yoxlanılmasından keçmiş, həqiqi İslam alimlərinin"
                  " əsərləridir."            );

        }, icon: Icon(Icons.info_outline_rounded))],

        title: Text("Dini Kitablar", style: TextStyle(fontFamily: "Oswald"),),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.chevron_left, size: 30,)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),



      body: Stack(
        children: [
          Stack1(),
          SafeArea(
            child: AnimationLimiter(
              child:  ListView.builder(
                padding: EdgeInsets.all( _w /30),
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
          ),
        ],
      ),
    );
  }
}







