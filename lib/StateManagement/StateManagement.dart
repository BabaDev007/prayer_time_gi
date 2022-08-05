import 'package:jiffy/jiffy.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var isShow = false.obs;
  var isShowPrayerTime = false.obs;
  var isShowHikmetliSoz = false.obs;
  var difference =Jiffy().dayOfYear.obs;
  var difference2 = Jiffy().dayOfYear.obs;
  var cityname = "Bakı".obs;
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