import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/HomeScreen.dart';
import 'ThemeService/ThemeDataService.dart';



void main() async{
  await GetStorage.init();

        SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,

       ));

  runApp( PrayerTimeApp());
}

class PrayerTimeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gözəl İslam NamazApp',
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      home: HomeScreen(),
    );
  }
}

