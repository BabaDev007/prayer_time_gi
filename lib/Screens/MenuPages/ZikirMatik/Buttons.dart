import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../PaddingManager.dart';
import 'package:marquee/marquee.dart';

class ZikrButton extends StatefulWidget {
  final Function() metod;
  final String buttonName;

  const ZikrButton({super.key, required this.metod, required this.buttonName});
  @override
  _ZikrButtonState createState() => _ZikrButtonState();
}

class _ZikrButtonState extends State<ZikrButton>
    with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      onTap: widget.metod,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 90 : 100,
        width: isTapped ? 170 : 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 30,
              offset: Offset(3, 7),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '${widget.buttonName}',
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}

class TesbihatList extends StatefulWidget {
final String title;
final int number;
final Function()  metod;
  TesbihatList(this.title, this.number, this.metod,  );

  @override
  State<TesbihatList> createState() => _TesbihatListState();
}

class _TesbihatListState extends State<TesbihatList> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: PaddingManager().prayerTimeWidgetPadding,

      child: Container(
      height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(.2),
                blurRadius: 30,
                offset: Offset(20, 30),
              ),
            ],
            borderRadius: BorderRadius.circular(25),
          ),


          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              onTap: widget.metod,
              trailing: CircleAvatar(
                backgroundColor: Colors.teal,
                child: AutoSizeText("${widget.number}", maxLines: 1,),
              ),
              title: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("${widget.title}", maxLines: 2, style: Theme.of(context).textTheme.headline6?.
                copyWith(color: Colors.white70, fontWeight: FontWeight.w300),),
              )
            ),
          )),
    );
  }
}
