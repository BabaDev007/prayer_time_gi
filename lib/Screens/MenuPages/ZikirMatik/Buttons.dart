import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
      enableFeedback: false,
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
        height: isTapped ? 150 : 160,
        width: isTapped ? 200 : 210,
        decoration: BoxDecoration(
          border: Border.all(color: isTapped ? Colors.red :Colors.green,  width: 4),
          shape: BoxShape.circle,
          color: Colors.white,

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 100,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Center(
          child: AnimatedTextKit(

            animatedTexts: [
            ScaleAnimatedText(
              '${widget.buttonName}' ,
              duration: Duration(milliseconds: 200),
              textStyle: TextStyle(

                color: Constants.primaryColor,
                fontWeight: FontWeight.w100,
                fontSize: isTapped ? 30 : 40,
              ),
            ),
          ],)
        ),
      ),
    );
  }
}

