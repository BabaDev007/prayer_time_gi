import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constants.dart';
import 'package:flutter_slimy_card/flutter_slimy_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../HomeScreen/PageViewPage/PageViewPage.dart';
class FeedbackPage extends StatefulWidget {
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String url = "https://www.gozelislam.com";
  void call(String number) => launch("tel:$number");

  void _launchUrl() async {
    if (!await launch(Uri.parse(url).toString(), forceSafariVC: true, forceWebView: false)) throw 'Could not launch $url';
  }
  void _contact() async {
    final url = 'mailto:ginamazapp571@mail.ru';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }






Widget bottomCardWidget() {
  return FittedBox(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Web Sayt:", style: Theme.of(context).textTheme.headline6 ,),
              TextButton(onPressed: (){
                _launchUrl();
              }, child: Text("www.namazvaxti.org", textWidthBasis: TextWidthBasis.longestLine, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blue) ,))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("E-poçt:", style: Theme.of(context).textTheme.headline6 ,),
              TextButton(onPressed: (){
                _contact();
              }, child: Text("ginamazapp571@mail.ru", textWidthBasis: TextWidthBasis.longestLine, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blue) ,))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,

            children: [
              Text("Tel:", style: Theme.of(context).textTheme.headline6 ,),

              TextButton(onPressed: (){
                call("+(994) 55 233 70 70");
              }, child: Text("+(994) 55 233 70 70", textWidthBasis: TextWidthBasis.longestLine, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blue, ) ,))
            ],
          )
        ],
      ),
  );
}
Widget topCardWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          SvgPicture.asset("assets/svgmosque.svg", height: 70,),
          Text("NamazVaxti.org", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ,fontFamily: "Oswald", color:Constants.primaryColor),),
        ],
      ),
      Text(
        'Hər bir irad və təkliflərinizi, tətbiqdə aşkarlanan texniki problemləri aşağıdakı əlaqə vasitələri ilə bizə göndərə bilərsiniz. Fikirləriniz bizim üçün önəmlidir.', textAlign: TextAlign.justify, textScaleFactor: 1.04,
        style: TextStyle(
          fontSize: 16,
          fontFamily: "Oswald",

          color: Colors.black.withOpacity(.85),
        ),
      ),
      SizedBox(height: 40,)

    ],
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,



      appBar: AppBar(
        leading: IconButton(onPressed: () {      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return PageViewPage(); }));
        }, icon: Icon(Icons.chevron_left, size: 30,),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
elevation: 0,
        title: Text("Əlaqə", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FlutterSlimyCard(

          color: Colors.white,
          topCardWidget: topCardWidget(),
          bottomCardWidget: bottomCardWidget(),
        ),
      )

    );
  }
}




// Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text("Hər cür şikayət və təkliflərinizi aşağıdaki əlaqə vasitələrindən bizə göndərə bilərsiz.", textAlign: TextAlign.justify,
//           style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black.withOpacity(0.5)) ,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Web Sayt:", style: Theme.of(context).textTheme.headline6 ,),
//             TextButton(onPressed: (){
//               _launchUrl();
//             }, child: Text("www.gozelislam.com", textWidthBasis: TextWidthBasis.longestLine, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blue) ,))
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("E-poçt:", style: Theme.of(context).textTheme.headline6 ,),
//             TextButton(onPressed: (){
//               _contact();
//             }, child: Text("ginamazapp571@mail.ru", textWidthBasis: TextWidthBasis.longestLine, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blue) ,))
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Tel:", style: Theme.of(context).textTheme.headline6 ,),
//             TextButton(onPressed: (){
//               call("+(994) 55 233 70 70");
//             }, child: Text("+(994) 55 233 70 70", textWidthBasis: TextWidthBasis.longestLine, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blue) ,))
//           ],
//         )
//       ],
//     ),
//
//   ),
// ),