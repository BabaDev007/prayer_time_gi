import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/splashscreen.dart';
import '../../Constants.dart';
import '../../PageTransition/PageTransition.dart';

class SplashError extends StatelessWidget {
  const SplashError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Lottie.asset("assets/75267-no-wifi.json",height: 200 ),
           Text("İnternet bağlantısı yoxdur",  style: TextStyle(
             color: Colors.white
           ),),
           SizedBox(height: 20,),
           
           OutlinedButton(onPressed: () {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyCustomSplashScreen()));

           },
             child: Text("Yenilə", ),)

         ],
       ),
      )
    );
  }
}
