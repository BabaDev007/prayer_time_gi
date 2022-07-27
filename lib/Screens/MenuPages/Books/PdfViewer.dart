import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Constants.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';

class BookReader extends StatefulWidget {
  final String path;
  final String pathWord;

  const BookReader({super.key, required this.path, required this.pathWord});

  @override
  State<BookReader> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
var pdfController;
var isShow  = false;
  @override
  void initState() {
    pdfController = PdfController(document:PdfDocument.openData(InternetFile.get('${widget.path}')));
    super.initState();
  }
var page = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Visibility(
        visible: isShow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children :[
            FloatingActionButton(
              backgroundColor: Constants.primaryColor.withOpacity(.4),
              child: Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              onPressed: () {

                pdfController.animateToPage(page -1, duration: Duration(milliseconds: 250), curve: Curves.ease);
              },
            ),


            FloatingActionButton(
              backgroundColor: Constants.primaryColor.withOpacity(.4),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onPressed: () {
                pdfController.animateToPage(page + 1, duration: Duration(milliseconds: 250), curve: Curves.ease);


              },
            ),

          ],
        ),
      ),
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(


        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('${widget.pathWord}' , style: TextStyle(fontFamily: "Oswald"),),

      ),
      body: Stack(
alignment: Alignment.center,
        children: [
          PdfView(
            onPageChanged: (index){
              setState((){
               page = index ;

              });
            },
            physics: BouncingScrollPhysics(),
            controller: pdfController,
            builders: PdfViewBuilders<DefaultBuilderOptions>(
              options: const DefaultBuilderOptions(
                loaderSwitchDuration: const Duration(seconds: 1),

              ),
              documentLoaderBuilder: (_) =>

              const Center(child: CircularProgressIndicator( color: Colors.white,)),
              pageLoaderBuilder: (_) {
if(isShow == false ){
  setState((){
    isShow = true;
  });
}



                return const Center(child: CircularProgressIndicator(color: Colors.white,));
              },
              errorBuilder: (_, error) {


                return Center(child: Container(
                  color: Constants.primaryColor,
                  child: CircularProgressIndicator(color: Colors.white,),
                ));},

            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Visibility(
              visible: isShow,
              child: PdfPageNumber(
                controller: pdfController,
                // When `loadingState != PdfLoadingState.success`  `pagesCount` equals null_
                builder: (_, state, loadingState, pagesCount) => Container(
                  alignment: Alignment.center,
                  child: Card(
                    color: Colors.white.withOpacity(.6),
                    child: Text(
                      '$page/${pagesCount ?? 0}',
                      style: const TextStyle(fontSize: 20, fontFamily: "Oswald"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );

  }
}




class BookReaderNamaz extends StatefulWidget {


  @override
  State<BookReaderNamaz> createState() => _BookReaderNamazState();
}

class _BookReaderNamazState extends State<BookReaderNamaz> {
  var pdfController;
  var isShow  = false;
  @override
  void initState() {
    pdfController = PdfController(document:PdfDocument.openAsset("assets/books/namaz.pdf"));
    super.initState();
  }
  var page = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: Visibility(
          visible: isShow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children :[
              FloatingActionButton(
                backgroundColor: Constants.primaryColor.withOpacity(.4),
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                onPressed: () {

                  pdfController.animateToPage(page -1, duration: Duration(milliseconds: 250), curve: Curves.ease);
                },
              ),


              FloatingActionButton(
                backgroundColor: Constants.primaryColor.withOpacity(.4),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                onPressed: () {
                  pdfController.animateToPage(page + 1, duration: Duration(milliseconds: 250), curve: Curves.ease);


                },
              ),

            ],
          ),
        ),
        backgroundColor: Constants.primaryColor,
        appBar: AppBar(



          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text('${"Namaz Öyrənirəm"}' , style: TextStyle(fontFamily: "Oswald"),),

        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            PdfView(
              onPageChanged: (index){
                setState((){
                  page = index ;

                });
              },
              physics: BouncingScrollPhysics(),
              controller: pdfController,
              builders: PdfViewBuilders<DefaultBuilderOptions>(
                options: const DefaultBuilderOptions(
                  loaderSwitchDuration: const Duration(seconds: 1),

                ),
                documentLoaderBuilder: (_) =>

                const Center(child: CircularProgressIndicator( color: Colors.white,)),
                pageLoaderBuilder: (_) {
                  if(isShow == false ){
                    setState((){
                      isShow = true;
                    });
                  }



                  return const Center(child: CircularProgressIndicator(color: Colors.white,));
                },
                errorBuilder: (_, error) {


                  return Center(child: Container(
                    color: Constants.primaryColor,
                    child: CircularProgressIndicator(color: Colors.white,),
                  ));},

              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Visibility(
                visible: isShow,
                child: PdfPageNumber(
                  controller: pdfController,
                  // When `loadingState != PdfLoadingState.success`  `pagesCount` equals null_
                  builder: (_, state, loadingState, pagesCount) => Container(
                    alignment: Alignment.center,
                    child: Card(
                      color: Colors.white.withOpacity(.6),
                      child: Text(
                        '$page/${pagesCount ?? 0}',
                        style: const TextStyle(fontSize: 20, fontFamily: "Oswald"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );

  }
}


