import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Books/BookList.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Books/PdfViewer.dart';
import '../../../../../Constants.dart';
import '../../../../../PageTransition/PageTransition.dart';
import '../../../../MenuPages/Books/BookNameClass.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
class BookCard extends StatefulWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  CarouselSliderController _controller = CarouselSliderController();
 var slidePage = 0;
 var slidePage1 = 2200000;
  var _sliderKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.menu_book_sharp, color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text("Dini Kitablar", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor ),),
                ],
              ),
          InkWell(
            onTap: (){
               Navigator.push(context, SizeTransition2(BookReader(path: BookListDart.BookListView[slidePage].bookLink, pathWord: BookListDart.BookListView[slidePage].bookTitle,)));

            },
            child: Container(
              height: 200,
              child: CarouselSlider.builder(
                controller: _controller,
                onSlideChanged: (value){
                  setState(() {
                slidePage = value - slidePage1;
                if(slidePage == 22){
                  slidePage = 0;
                  slidePage1  = slidePage1 + 22;
                }
                  });
                  print(slidePage);
                },
                  key: _sliderKey,
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  slideBuilder: (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(BookListDart.BookListView[index].bookPngPath),
                    );
                  },
                  slideTransform: FlipHorizontalTransform(),
                  slideIndicator: CircularSlideIndicator(
                    indicatorBackgroundColor: Colors.black12,
                    currentIndicatorColor: Colors.blue,
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  itemCount: BookListDart.BookListView.length),
            ),
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(onPressed: () {
                    Navigator.push(context, SizeTransition2(BookList()));

                  },
                      child: Row(
                        children: [
                          Icon(Icons.read_more_rounded),
                          SizedBox(width: 10,),
                          Text("Bütün kitablar", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),),
                        ],
                      )),
                  OutlinedButton(onPressed: () {
                    Navigator.push(context, SizeTransition2(BookReader(path: BookListDart.BookListView[slidePage].bookLink, pathWord: BookListDart.BookListView[slidePage].bookTitle,)));

                  },
                      child: Row(
                        children: [
                          Icon(Icons.chrome_reader_mode_outlined),
                          SizedBox(width: 10,),
                          Text("Oxu", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),),
                        ],
                      )),



                ],
              ),





              // Swiper(
              //   autoplayDelay: 5000,
              //   indicatorLayout: PageIndicatorLayout.SLIDE,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Card(child: Image.asset(BookListDart.BookListView[index].bookPngPath));
              //   },
              //   scrollDirection: Axis.horizontal,
              //   itemCount: BookListDart.BookListView.length,
              //   autoplay: true,
              //   axisDirection: AxisDirection.right,
              //   itemHeight: 200,
              //   itemWidth: 300,
              //   pagination: new SwiperPagination(
              //
              //   ),
              //   layout: SwiperLayout.STACK,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
