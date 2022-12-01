import 'dart:io';
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
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  GetStorage box = GetStorage();

  var zor = false;
  final Controller c = Get.put(Controller());
  var currentTime;
  var url = "1425";
  var isLoading = false;


  @override
  void initState() {
    c.isShowShuhada.value = box.read("isShowShuhada") ?? true;
    c.isShowDua.value = box.read("isShowDua")?? true;
    c.isShowGunlukMovzu.value = box.read("isShowGunlukMovzu")?? true;
    c.isShowHikmetliSoz.value = box.read("isShowHikmetliSoz")?? true;
    c.isShowBook.value = box.read("isShowBook")?? true;
    c.isShowEKart.value = box.read("isShowEKart") ?? true;
    isLoading  = false;

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
extendBodyBehindAppBar: true,
      appBar:
      PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
            child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
leading: SizedBox(),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Düzəlişlər", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,

      body: isLoading ? Center(child: Container(
        height: Get.size.height/5,
          width: Get.size.width/1.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Lottie.asset("assets/loding.json", height: 80),
              SizedBox(height: 10,),
              Text("Zəhmət olmasa gözləyin", textAlign: TextAlign.center, style: TextStyle(fontFamily: "Oswald", color: Constants.primaryColor)),
              SizedBox(height: 10,)

            ],
          )),) : Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,

              children: [
                SizedBox(
                  height: 100,
                ),

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
                           SvgPicture.asset("assets/svgmosque.svg", height: 70,),
                          Text("NamazVaxti.org", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22, fontFamily: "Oswald", color: Constants.primaryColor),),
                          SizedBox(height: 10,),
                          ListTile(title: Text("Namaz Vaxtları",style: TextStyle(color: Colors.black38 ,fontWeight: FontWeight.w600) )),
                          ListTile(
                            onTap: (){
                            },
                            leading: Icon(Icons.timelapse, color: Constants.primaryColor,),
                            title: Text("Əlavə vaxtlar", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Text("Əsr-i Sani, İşa-i Sani, və s.", textAlign: TextAlign.left,)

                            , trailing: Switch(value: box.read("prayertime") ?? false, onChanged: (bool value) {
                            setState((){

                              box.write("prayertime", value);


                            });
                          },),),

                          ListTile(title: Text("Ümumi",style: TextStyle(color: Colors.black38 ,fontWeight: FontWeight.w600) )),
//

                          ListTile( leading:  Icon(Icons.legend_toggle, color: Constants.primaryColor,),
                            title: Text("Hikmətli Sözlər", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Text("Paneli aktiv et", textAlign: TextAlign.left,)

                            , trailing: Switch(value: c.isShowHikmetliSoz.isTrue,
                              onChanged: (bool value) {
                                setState((){
                                  c.isShowHikmetliSoz.value = value ;
                                  box.write("isShowHikmetliSoz", c.isShowHikmetliSoz.value);

                                });
                              },),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),
                          ListTile( leading:   Icon(Icons.view_day_outlined, color: Constants.primaryColor),

                            title: Text("Günün Mövzusu", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Text("Paneli aktiv et", textAlign: TextAlign.left,)

                            , trailing: Switch(value: c.isShowGunlukMovzu.isTrue,
                              onChanged: (bool value) {
                                setState((){
                                  c.isShowGunlukMovzu.value = value ;
                                  box.write("isShowGunlukMovzu", c.isShowGunlukMovzu.value);

                                });
                              },),),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 20),
                          //   child: Divider(),
                          // ),
                          // ListTile( leading:
                          // Image.asset("assets/dua-hands.png", color:Constants.primaryColor, width: 22, height: 30,),
                          //
                          //   title: Text("Günün Duası", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                          //   subtitle: Text("Paneli aktiv et", textAlign: TextAlign.left,)
                          //
                          //   , trailing: Switch(value: c.isShowDua.isTrue,
                          //
                          //     onChanged: (bool value) {
                          //       setState((){
                          //         c.isShowDua.value = value ;
                          //         box.write("isShowDua", c.isShowDua.value);
                          //
                          //       });
                          //     },),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),
                          ListTile( leading: Icon(FontAwesomeIcons.bookOpenReader, size: 20, color: Constants.primaryColor,),
                            title: Text("Dini Kitablar", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Text("Paneli aktiv et", textAlign: TextAlign.left,)

                            , trailing: Switch(value: c.isShowBook.isTrue,
                              onChanged: (bool value) {
                                setState((){
                                  c.isShowBook.value = value;
                                  box.write("isShowBook", c.isShowBook.value);

                                });
                              },),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),
                          ListTile( leading:  Container(
                            width: 23,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Constants.primaryColor, width: 2)
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset("assets/ks.jpg"))),
                            title: Text("Kəlməyi Şəhadət", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Text("Paneli aktiv et", textAlign: TextAlign.left,)

                            , trailing: Switch(value: c.isShowShuhada.isTrue,
                              onChanged: (bool value) {
                                setState((){
                                  c.isShowShuhada.value = value;
                                  box.write("isShowShuhada", c.isShowShuhada.value);

                                });
                              },),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),
                          ListTile( leading:  Icon(FontAwesomeIcons.sheetPlastic, size: 25, color: Constants.primaryColor ,),
                            title: Text("E-kartlar", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
                            subtitle: Text("Paneli aktiv et", textAlign: TextAlign.left,)

                            , trailing: Switch(value: c.isShowEKart.isTrue,
                              onChanged: (bool value) {
                                setState((){
                                  c.isShowEKart.value = value;
                                  box.write("isShowEKart", c.isShowEKart.value);

                                });
                              },),),
                          SizedBox(height: 25,)













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
                          ListTile(onTap: (){
                            if (Platform.isAndroid || Platform.isIOS) {
                              final appId = Platform.isAndroid ? 'com.turkiyetakvimi&gl=US' : 'YOUR_IOS_APP_ID';
                              final url = Uri.parse(
                                Platform.isAndroid
                                    ? "market://details?id=$appId"
                                    : "https://apps.apple.com/app/id$appId",
                              );
                              launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                              leading: Icon(Icons.star_rate_outlined,size: 20, color: Constants.primaryColor,),
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
// ListTile(
//                               leading: Icon(Icons.location_on_outlined, color: Constants.primaryColor,),
//                               title: Text("Şəhər", style: TextStyle(fontWeight: FontWeight.w600, color: Constants.primaryColor),) ,
//                               subtitle:
//                               DropdownButton<String>(
//                                 icon: Icon(Icons.keyboard_arrow_down),
//                                 iconSize: 15,
//                                 elevation: 16,
//                                 style: TextStyle(color: Constants.primaryColor),
//                                 underline: Container(
//                                   decoration: ShapeDecoration(
//                                     shape: RoundedRectangleBorder(
//                                       side: BorderSide(width: 0, style: BorderStyle.none),
//                                       borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                                     ),
//                                   ),
//                                 ),
//                                 items: items,
//                                 onChanged: (value) async {
//                                   setState(() {
//                                     _value = value;
//                                     url = _value!;
//                                     isLoading = true;
//                                     box.write("c.cityname", c.cityname);
//
//
//
//
//
//                                     switch(_value){
//                                       case "1423": c.cityname = "Ağdam" as RxString;
//                                       break;
//                                       case "1424": c.cityname = "Şirvan"as RxString;
//                                       break;
//                                       case "1425":  c.cityname ="Bakı"as RxString;
//                                       break;case "1426":  c.cityname ="Bərdə"as RxString;
//                                     break;case "1427": c.cityname ="Fizuli"as RxString;
//                                     break;case "1428":c.cityname = "Gəncə"as RxString;
//                                     break;case "1432": c.cityname ="Lənkəran"as RxString;
//                                     break;case "1435": c.cityname ="Mingəçevir"as RxString;
//                                     break;case "1437":c.cityname = "Sabirabad"as RxString;
//                                     break;case "1438": c.cityname ="Səlyan"as RxString;
//                                     break;case "1439": c.cityname ="Şəki"as RxString;
//                                     break;case "1440": c.cityname ="Sumqayıt"as RxString;
//                                     break;case "1441": c.cityname ="Zaqatala"as RxString;
//                                     break;case "1443": c.cityname ="Şuşa"as RxString;
//                                     break;case "1445": c.cityname ="Naxçıvan"as RxString;
//                                     break;case "1447": c.cityname ="Culfa"as RxString;
//                                     break;case "21319": c.cityname ="Tovuz"as RxString;
//                                     break;case "38073": c.cityname ="Ağdaş"as RxString;
//                                     break;case "38172": c.cityname ="İmişli"as RxString;
//                                     break;case "38174": c.cityname ="Gədəbəy"as RxString;
//                                     break;case "38179": c.cityname ="Ağdərə"as RxString;
//                                     break;case "38193": c.cityname ="Saatlı"as RxString;
//                                     break;case "38290": c.cityname ="Kəngərli"as RxString;
//                                     break;case "38356": c.cityname ="Daşkəsən"as RxString;
//                                     break;case "38457": c.cityname ="Göyçay"as RxString;
//                                     break;case "38654": c.cityname ="Lerik"as RxString;
//                                     break;case "38788": c.cityname ="Qubadlı"as RxString;
//                                     break;case "38875": c.cityname ="Siyəzən"as RxString;
//                                     break;case "38904": c.cityname ="Biləsuvar"as RxString;
//                                     break;case "38944": c.cityname ="Yardımlı"as RxString;
//                                     break;case "38985": c.cityname ="Xankəndi"as RxString;
//                                     break;case "43363": c.cityname ="Ağsu"as RxString;
//                                     break;case "43392":c.cityname = "Neftçala"as RxString;
//                                     break;case "43395":c.cityname = "Quba"as RxString;
//                                     break; case "43397": c.cityname ="Ucar"as RxString;
//                                     break; case "43398": c.cityname ="Xaçmaz"as RxString;
//                                     break; case "43661": c.cityname ="Tərtər"as RxString;
//                                     break; case "43649": c.cityname ="Astara"as RxString;
//                                     break; case "43873": c.cityname ="Beyləqan"as RxString;
//                                     break; case "60075": c.cityname ="İsmayıllı"as RxString;
//                                     break; case "62280": c.cityname ="Qusar"as RxString;
//                                     break; case "62281": c.cityname ="Ordubad"as RxString;
//                                     break; case "62282":c.cityname = "Şamaxı"as RxString;
//                                     break; case "43392":c.cityname = "Goranboy"as RxString;
//                                     break; case "62728":c.cityname = "Balakən"as RxString;
//                                     break; case "65729": c.cityname ="Qax"as RxString;
//                                     break; case "65732": c.cityname ="Şəmkir"as RxString;
//                                     break; case "65737":c.cityname = "Yevlax"as RxString;
//                                     break; case "65739": c.cityname ="Laçın" as RxString;
//                                     break; case "65744": c.cityname ="Cəlilabad"as RxString;
//                                     break; case "67957": c.cityname ="Oğuz"as RxString;
//                                     break; case "70928": c.cityname ="Qəbələ"as RxString;
//                                     break; case "82092": c.cityname ="Ağcabədi"as RxString;
//                                     break; case "92768": c.cityname ="Göygöl"as RxString;
//                                     break; case "92807": c.cityname ="Zəngilan"as RxString;
//                                     break; case "21320": c.cityname ="Qazax"as RxString;
//
//                                     break;
//                                     }
//
//
//
//
//
//
//
//
//                                   });
//
//
//                                   await getData(_value!);
//
//                                   Navigator.pushReplacement(context, SizeTransition2(SettingsPage()));
//
//
// },
//
//                                 hint: Text("${box.read("c.cityname")}"),
//                                 value: _value,
//                               ),
//
//                                ),