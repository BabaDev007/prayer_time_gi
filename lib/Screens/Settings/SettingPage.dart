import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Feedback/FeedbackPage.dart';
import '../../Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import '../../PageTransition/PageTransition.dart';
import '../../StateManagement/StateManagement.dart';
import '../../ThemeService/ThemeDataService.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  GetStorage box = GetStorage();
  var zor = false;
  final Controller c = Get.put(Controller());

  @override
  void initState() {
  c.isShowPrayerTime.value = box.read("prayertime") ?? false;
  c.isShowHikmetliSoz.value = box.read("hikmet") ?? false;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,

      appBar:
           AppBar(
             leading: IconButton(icon: Icon(Icons.home_filled), onPressed: (){Navigator.pop(context);},),

              backgroundColor: Colors.transparent,


              centerTitle: true,
              title: Text("Düzəlişlər", style: TextStyle(fontFamily: "Oswald"),),
              elevation: 0,
            ),

      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,

              children: [

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 10,
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                     width: Get.size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 30,),
                           Icon(Icons.mosque_outlined, size: 70, color: Constants.primaryColor,),
                          Text("Gözəl İslam", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22, fontFamily: "Oswald", color: Constants.primaryColor),),
                          SizedBox(height: 10,),
                          ListTile(title: Text("Namaz Vaxtları",style: TextStyle(color: Colors.black38 ,fontWeight: FontWeight.w600) )),
                          ListTile(
                            onTap: (){
                            },
                            leading: Icon(Icons.timelapse, color: Constants.primaryColor,),
                            title: Text("Əlavə vaxtlar", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Text("Əsr-i Sani, İşa-i Sani, və s.", textAlign: TextAlign.left,)

                            , trailing: Switch(value: c.isShowPrayerTime.isTrue, onChanged: (bool value) {
                            setState((){
                                    c.isShowPrayerTime.value = value ;
                                    box.write("prayertime", c.isShowPrayerTime.value);

                            });
                          },),),

                          ListTile(title: Text("Ümumi",style: TextStyle(color: Colors.black38 ,fontWeight: FontWeight.w600) )),
                          ListTile(
                              leading: Icon(Icons.location_on_outlined, color: Constants.primaryColor,),
                              title: Text("Şəhər", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                              subtitle: Text("Göyçay", textAlign: TextAlign.left,)

                              , ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),
                          ListTile( leading: Icon(FontAwesomeIcons.font, size: 20, color: Constants.primaryColor,),
                            title: Text("Hikmətli Sözlər", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Text("Hikmətli sözlər panelini görünür et", textAlign: TextAlign.left,)

                            , trailing: Switch(value: c.isShowHikmetliSoz.isTrue,
                              onChanged: (bool value) {
                                setState((){
                                  c.isShowHikmetliSoz.value = value ;
                                  box.write("hikmet", c.isShowHikmetliSoz.value);

                                });
                              },),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),
                          ListTile(  leading: Icon(Icons.mode_night_outlined,size: 20, color: Constants.primaryColor,),
                            title: Text("Tema", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Text("Gecə və gündüz rejimi", textAlign: TextAlign.left,)

                            , trailing: Switch(value: Get.isDarkMode, onChanged: (bool value) {
                              setState((){
                                ThemeService().changeThemeMode();

                                  Get.showSnackbar(

                                      GetSnackBar(

borderRadius: 25,
duration: Duration(seconds: 1),
                                          message:"",
                                          messageText: Center(
                                            child: Text("Rejim aktivləşdi", style: TextStyle(
                                                color: Constants.primaryColor
                                            ),),
                                          ),
                                          // colorText: Colors.white,
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor: Colors.white
                                      )
                                  );



                              });
                            },),),











                        ],
                      ),



                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 10,
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      width: Get.size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          SizedBox(height: 10,),
                          ListTile(title: Text("Digər",style: TextStyle(color: Colors.black38 ,fontWeight: FontWeight.w600) )),
                          ListTile(  leading: Icon(Icons.star_rate_outlined,size: 20, color: Constants.primaryColor,),
                              title: Text("Dəyərləndir", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                              subtitle: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text("Tətbiqi qiymətləndirin", textAlign: TextAlign.left,),
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),

                          ListTile(
                            onTap: ()async{
                              await Share.share("Azərbaycan üçün Namaz Vaxtı tətbiqi https://play.google.com/store/apps/details?id=com.turkiyetakvimi&gl=US");
                            },
                              leading: Icon(Icons.share_outlined,size: 20, color: Constants.primaryColor,),
                            title: Text("Paylaş", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text("Tətbiqi başqaları ilə paylaş", textAlign: TextAlign.left,),
                            )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),



                          ListTile(
                            onTap: (){
                              Navigator.push(context, SizeTransition2(FeedbackPage()));
                            },
                              leading: Icon(Icons.contactless_outlined,size: 20, color: Constants.primaryColor,),
                              title: Text("Əlaqə", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                              subtitle: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text("Şikayət və təkliflərinizi bizə göndərin", textAlign: TextAlign.left,),
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),
                          ListTile(  leading: Icon(Icons.verified_outlined,size: 20, color: Constants.primaryColor,),
                              title: Text("Versiya", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black38),) ,
                              subtitle: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text("1.0.0", textAlign: TextAlign.left, style: TextStyle(color: Colors.black38),),
                              )),











                        ],
                      ),



                    ),
                  ),
                )


              ],
            ),
          ),
        ),
      )
    );
  }
}
