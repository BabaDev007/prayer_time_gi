import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/Widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Constants.dart';


class EbookReader extends StatefulWidget {
  final String bookTitle;
  final String bookPath;


  EbookReader({super.key,  required this.bookTitle, required this.bookPath});

  @override
  _EbookReaderState createState() => _EbookReaderState();
}

class _EbookReaderState extends State<EbookReader> {
  late EpubController _epubReaderController;

  var _box;
  @override
  void initState() {
    _box =  box.read("arxaFon") ?? "white70";
    _fontSize = box.read("font") ?? 15;

    switch(_box ){
      case "white70" : _bacgroundColor = Colors.white70;
      break;
      case "lightBlueAccent": _bacgroundColor = Colors.lightBlueAccent;
      break;
      case "grey" : _bacgroundColor = Colors.grey;
      break;
      case "amber" : _bacgroundColor = Colors.amber;
      break;
      case "white" : _bacgroundColor = Colors.white;
      break;
    }

    _epubReaderController = EpubController(
      document:
      EpubDocument.openAsset('assets/books/${widget.bookPath}'),
      // epubCfi:
      //     'epubcfi(/6/6[chapter-2]!/4/2/1612)', // book_2.epub Chapter 16 paragraph 3
    );
    super.initState();
  }

  @override
  void dispose() {
    _epubReaderController.dispose();
    super.dispose();
  }
  void _increaseFontSize(){
    setState((){
      if(_fontSize < 51)
      _fontSize++;
    });
  }
  void _removwFontSize(){
    setState((){
      if(_fontSize > 10)
      _fontSize--;
    });
  }
  double _fontSize = 16;
  double _size = 16;
  var _bacgroundColor = Colors.white;
  GetStorage box = GetStorage();


  @override
  Widget build(BuildContext context) =>
      Scaffold(

    extendBodyBehindAppBar: true,
    appBar: AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text("${widget.bookTitle}", style: TextStyle(fontFamily: "Oswald"),),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          color: Colors.white,
          onPressed: () => Get.defaultDialog(
            backgroundColor: Colors.teal,
            title: "Düzəlişlər",
            titleStyle: TextStyle(color: Colors.white70),
            content: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Arxa Fon", style: TextStyle(color: Colors.white70),),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState((){
                                box.write("arxaFon", "white70");
                                _bacgroundColor = Colors.white70;
                              });
          },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  shape: BoxShape.circle,

                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState((){
                                box.write("arxaFon", "lightBlueAccent");

                                _bacgroundColor = Colors.lightBlueAccent;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    shape: BoxShape.circle
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState((){
                                box.write("arxaFon", "grey");

                                _bacgroundColor = Colors.grey;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle
                                ),
                              ),
                            ),
                          ),
                          InkWell( onTap: (){
                            setState((){
                              box.write("arxaFon", "amber");

                              _bacgroundColor = Colors.amber.shade300;
                            });
                          },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade300,
                                    shape: BoxShape.circle
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState((){
                                _bacgroundColor = Colors.white;
                                box.write("arxaFon", "white");

                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Zoom", style: TextStyle(
                      color: Colors.white70
                    ),),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           InkWell(
                             onTap: (){
                               setState((){
                                 _fontSize--;
                                 box.write("font", _fontSize);
                               });
                             },
                               child: Icon(Icons.remove, color: Colors.white, size: 30,)),
                           Icon(Icons.text_fields, size: 30),
                           InkWell(
                               onTap: (){
                                 setState((){
                                   _fontSize++;
                                   box.write("font", _fontSize);
                                 });
                               },
                               child: Icon(Icons.add, color: Colors.white,size: 30))
                         ],
                       ),
                     )

                  ],
                )
              ],
            )
          ),
        ),
      ],
    ),
    drawer: Drawer(
      backgroundColor: _bacgroundColor,

      child: Stack(
        children: [

          EpubViewTableOfContents(
            controller: _epubReaderController,

          )
        ],
      ),
    ),
    body: Stack(
      children: [
        Stack1(),
        SafeArea(
          child: Container(
            color: _bacgroundColor,
          ),
        ),
        SafeArea(
          child: EpubView(
            builders: EpubViewBuilders<DefaultBuilderOptions>(
              options:  DefaultBuilderOptions(

                textStyle: TextStyle(
                  fontFamily: "GentiumBookPlus",
                  fontSize: _fontSize
                )
              ),
              chapterDividerBuilder: (_) => const Divider(),
            ),
            controller: _epubReaderController,
          ),
        ),
      ],
    ));

  void _showCurrentEpubCfi(context) {
    final cfi = _epubReaderController.generateEpubCfi();

    if (cfi != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(cfi),
          action: SnackBarAction(
            label: 'GO',
            onPressed: () {
              _epubReaderController.gotoEpubCfi(cfi);
            },
          ),
        ),
      );
    }
  }
}

class _sheetGround extends StatefulWidget {
  const _sheetGround({Key? key}) : super(key: key);

  @override
  State<_sheetGround> createState() => _sheetGroundState();
}

class _sheetGroundState extends State<_sheetGround> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
      ),

    );
  }
}
