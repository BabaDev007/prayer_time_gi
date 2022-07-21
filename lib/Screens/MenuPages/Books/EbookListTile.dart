import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Books/PdfViewer.dart';

import '../../../PaddingManager.dart';
import '../../../PageTransition/PageTransition.dart';
import 'Ebook reader.dart';

class EBookTile extends StatelessWidget {


  EBookTile( this.bookPngPath , this.bookTitle , this.subtitle, this.bookLink,  );
  final String bookPngPath;
  final String bookTitle;
  final String subtitle;
  final String bookLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(SizeTransition3(
                EbookReader(bookTitle: bookTitle, bookPath: bookLink,)));

            // Navigator.of(context).push(SizeTransition3(BookReader(path: bookLink, pathWord: bookTitle,)));
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
                leading: Image.asset("$bookPngPath", fit: BoxFit.cover, ),
                title: Text(bookTitle),
                trailing: Icon(Icons.chevron_right),
                subtitle: Text(subtitle),

              )),
        ));
  }
}
