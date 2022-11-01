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
        headerBackgroundColor: Constants.primaryColor,
        finishButtonText: 'Başla',
        skipTextButton: Text('Ötür', style: TextStyle(color: Colors.white),),
        trailing: SizedBox(),
        background: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/1112.jpg', scale: 5, ),
          ),
          Visibility(visible: true , child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/1116.jpg', scale: 4,),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/2226.jpg', scale: 5,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/2223.jpg', scale: 5,),
          ),
          Visibility(
            visible: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/1115.jpg', scale: 5,),
            ),
          ),
          Visibility(
            visible: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/1115.jpg', scale: 5,),
            ),
          ),


        ],
        totalPage: 6,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/1111.jpg', scale: 5, ),
                  height: 480,
                ),
                Text("Azərbaycanın müxtəlif şəhər və rayonlarının namaz, imsaq və iftar vaxtları",
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
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                SizedBox(height: 40,),

                SizedBox(
                  child: Image.asset('assets/1117.jpg', scale: 1, ),
                  height: 500,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Hikmətli sözlər və dini kitablar",
                      style: TextStyle(
                          fontSize: 24,
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 50,)
                  ],
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                SizedBox(height: 40,),

                SizedBox(
                  child: Image.asset('assets/2224.jpg', scale: 3, ),
                  height: 480,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Dini söhbətlər,  mövzular və videolar",
                      style: TextStyle(
                          fontSize: 24,
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/2222.jpg', scale: 5, ),
                  height: 400,
                ),
                Text("Qibləni təyin etmək üçün kompas və rahat zikr etməniz üçün təsbih",
                  style: TextStyle(
                      fontSize: 24,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,)

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/1113.jpg', scale: 4, ),
                  height: 400,
                ),
                Text("Bir çox faydalı funksiyalar",
                  style: TextStyle(
                      fontSize: 24,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 100,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/pngmosque.png', scale: 4, ),
                  height: 400,
                ),
                Text("www.namazvaxtı.org",
                  style: TextStyle(
                      fontSize: 24,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 100,)
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