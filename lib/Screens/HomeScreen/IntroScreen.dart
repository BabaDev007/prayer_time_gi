import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/PageViewPage.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/splashscreen.dart';
import '../../Constants.dart';
class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoardingSlider(
        onFinish: (){
          Navigator.pushReplacement(context, PageTransition(PageViewPage()));
        },
        controllerColor: Colors.blue,
        pageBackgroundColor: Constants.primaryColor.withOpacity(.1),
        headerBackgroundColor: Colors.transparent,
        finishButtonText: 'Başla',
        skipTextButton: Text('Keç'),
        trailing: Text('Şəhər seç'),
        background: [
          Image.asset('assets/pn', ),
          Image.asset('assets/slide_2.png'),
          Image.asset('assets/slide_1.png'),
          Image.asset('assets/slide_2.png'),
        ],
        totalPage: 4,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text("Azərbaycanın müxtəlif şəhər və rayonlarının namaz, imsaq, "
                    "iftar vaxtlarını ən rahat şəkildə və reklam olmadan tətbiqimizdən əldə edə bilərsiniz",
                style: TextStyle(
                  fontSize: 24,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text("Günlük hikmətli sözlər, dini söhbətlər, mövzular və videolar",
                  style: TextStyle(
                      fontSize: 24,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text("Qibləni təyin etmək üçün kompas",
                  style: TextStyle(
                      fontSize: 24,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text("Daha rahat zikr etməniz üçün təsbih",
                  style: TextStyle(
                      fontSize: 24,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// class IntroScreen extends StatefulWidget {
//   @override
//   State<IntroScreen> createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   final List<Introduction> list = [
//     Introduction(
//       title: 'Namaz Vaxları',
//       subTitle: 'Ölkənin müxtəlif şəhər və rayonlarının namaz, iftar, imsaq vaxtlarını ən rahat şəkildə heç bir reklamla qarşılaşmadan tətbqimizdən əldə edin',
//       imageUrl: 'assets/calendar.png',
//       imageWidth: 150,
//       imageHeight: 80,
//     ),
//     Introduction(
//       title: 'Delivery',
//       subTitle: 'Your order will be immediately collected and',
//       imageUrl: 'assets/images/onboarding4.png',
//     ),
//     Introduction(
//       title: 'Receive Money',
//       subTitle: 'Pick up delivery at your door and enjoy groceries',
//       imageUrl: 'assets/images/onboarding5.png',
//     ),
//     Introduction(
//       title: 'Finish',
//       subTitle: 'Browse the menu and order directly from the application',
//       imageUrl: 'assets/images/onboarding3.png',
//     ),
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return IntroScreenOnboarding(
//       backgroudColor: Constants.primaryColor.withOpacity(.1),
//       introductionList: list,
//       onTapSkipButton: () {
//         Navigator.pushReplacement(context, PageTransition(PageViewPage()));
//       },
//     );
//   }
// }