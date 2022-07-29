import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/splashscreen.dart';
import 'ThemeService/ThemeDataService.dart';



void main() async{

  await GetStorage.init();

        SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Constants.primaryColor,
          statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light

       ));

  runApp( PrayerTimeApp());
}


class PrayerTimeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
builder: (context, child){
  return MediaQuery(
    data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
    child: child ?? Container(),
  );
},
      debugShowCheckedModeBanner: false,
      title: 'Gözəl İslam NamazApp',
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      home: MyCustomSplashScreen(),
    );
  }
}

