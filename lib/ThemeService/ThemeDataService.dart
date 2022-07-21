import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../Constants.dart';

class ThemeService{
  final lightTheme = ThemeData.light().copyWith(
    hintColor: Constants().aboveWidgetColor,
    errorColor: Colors.white,
  );


  final darkTheme = ThemeData.dark().copyWith(
    errorColor: Colors.black26,
    hintColor: Colors.black12,
  );

  final storageKey = "isDarkMode";
  final _getStorage = GetStorage();



  isSavedDarkMode(){
    return _getStorage.read(storageKey) ?? false;
  }

  ThemeMode getThemeMode(){
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }
  saveThemeMode(bool isDarkMode){
    _getStorage.write(storageKey, isDarkMode);
  }
  changeThemeMode(){
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }




}