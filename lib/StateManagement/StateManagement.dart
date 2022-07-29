import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var isShow = false.obs;
  var isShowPrayerTime = false.obs;
  var isShowHikmetliSoz = false.obs;
  var difference = DateTime.now().difference(DateTime(2021,DateTime.december,31)).inDays.obs;
  var dif =  DateTime.now().difference(DateTime(2021,DateTime.december,31)).inDays.obs;
  void lastDay(){
    if(!(difference < 0)){
      difference--;
    }
  }
  void nextDay(){
    if(!(difference > 364 )){
      difference++;
    }
  }


}