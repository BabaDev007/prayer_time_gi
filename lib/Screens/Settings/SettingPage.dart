import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/HomeScreen.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Feedback/FeedbackPage.dart';
import '../../Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import '../../PageTransition/PageTransition.dart';
import '../../StateManagement/StateManagement.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SettingsPage extends StatefulWidget {

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  GetStorage box = GetStorage();
  String? _value;
  var zor = false;
  final Controller c = Get.put(Controller());
  var currentTime;
  var url = "1425";
  var isLoading = false;

  Future<void> getData(String url)async{
    setState((){
      isLoading = true;
    });
      var response = await http.get(Uri.parse("https://prayer-time-ws.herokuapp.com/api/dates/json/1.0/allDataYearly?indexOfCity=${url}"));

      var json = response.body;
      var jsonData = jsonDecode(utf8.decode(json.runes.toList()).toString());
      if (response.statusCode == 200) {
        currentTime = jsonData["data"];
        box.write("time", currentTime);
        c.cityname = box.read("c.cityname");


    }  }

  @override
  void initState() {
    isLoading  = false;
  c.isShowPrayerTime.value = box.read("prayertime") ?? true;
  c.isShowHikmetliSoz.value = box.read("hikmet") ?? true;
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
                              subtitle:  DropdownButton<String>(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 15,
                                elevation: 16,
                                style: TextStyle(color: Constants.primaryColor),
                                underline: Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 0, style: BorderStyle.none),
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    ),
                                  ),
                                ),
                                items: items,
                                onChanged: (value) async {
                                  setState(() {
                                    _value = value;
                                    url = value!;
                                    isLoading = true;






                                    switch(_value){
                                      case "1423": c.cityname = "Ağdam" as RxString;
                                      break;
                                      case "1424": c.cityname = "Şirvan"as RxString;
                                      break;
                                      case "1425":  c.cityname ="Bakı"as RxString;
                                      break;case "1426":  c.cityname ="Bərdə"as RxString;
                                    break;case "1427": c.cityname ="Fizuli"as RxString;
                                    break;case "1428":c.cityname = "Gəncə"as RxString;
                                    break;case "1432": c.cityname ="Lənkəran"as RxString;
                                    break;case "1435": c.cityname ="Mingəçevir"as RxString;
                                    break;case "1437":c.cityname = "Sabirabad"as RxString;
                                    break;case "1438": c.cityname ="Səlyan"as RxString;
                                    break;case "1439": c.cityname ="Şəki"as RxString;
                                    break;case "1440": c.cityname ="Sumqayıt"as RxString;
                                    break;case "1441": c.cityname ="Zaqatala"as RxString;
                                    break;case "1443": c.cityname ="Şuşa"as RxString;
                                    break;case "1445": c.cityname ="Naxçıvan"as RxString;
                                    break;case "1447": c.cityname ="Culfa"as RxString;
                                    break;case "21319": c.cityname ="Tovuz"as RxString;
                                    break;case "38073": c.cityname ="Ağdaş"as RxString;
                                    break;case "38172": c.cityname ="İmişli"as RxString;
                                    break;case "38174": c.cityname ="Gədəbəy"as RxString;
                                    break;case "38179": c.cityname ="Ağdərə"as RxString;
                                    break;case "38193": c.cityname ="Saatlı"as RxString;
                                    break;case "38290": c.cityname ="Kəngərli"as RxString;
                                    break;case "38356": c.cityname ="Daşkəsən"as RxString;
                                    break;case "38457": c.cityname ="Göyçay"as RxString;
                                    break;case "38654": c.cityname ="Lerik"as RxString;
                                    break;case "38788": c.cityname ="Qubadlı"as RxString;
                                    break;case "38875": c.cityname ="Siyəzən"as RxString;
                                    break;case "38904": c.cityname ="Biləsuvar"as RxString;
                                    break;case "38944": c.cityname ="Yardımlı"as RxString;
                                    break;case "38985": c.cityname ="Xankəndi"as RxString;
                                    break;case "43363": c.cityname ="Ağsu"as RxString;
                                    break;
                                    case "43392":c.cityname = "Neftçala"as RxString;
                                    break;
                                      case "43395":c.cityname = "Quba"as RxString;
                                      break; case "43397": c.cityname ="Ucar"as RxString;
                                    break; case "43398": c.cityname ="Xaçmaz"as RxString;
                                    break; case "43661": c.cityname ="Tərtər"as RxString;
                                    break; case "43649": c.cityname ="Astara"as RxString;
                                    break; case "43873": c.cityname ="Beyləqan"as RxString;
                                    break; case "60075": c.cityname ="İsmayıllı"as RxString;
                                    break; case "62280": c.cityname ="Qusar"as RxString;
                                    break;
                                      case "62281": c.cityname ="Ordubad"as RxString;
                                      break; case "62282":c.cityname = "Şamaxı"as RxString;
                                    break; case "43392":c.cityname = "Goranboy"as RxString;
                                    break; case "62728":c.cityname = "Balakən"as RxString;
                                    break; case "65729": c.cityname ="Qax"as RxString;
                                    break; case "65732": c.cityname ="Şəmkir"as RxString;
                                    break; case "65737":c.cityname = "Yevlax"as RxString;
                                    break; case "65739": c.cityname ="Laçın" as RxString;
                                    break; case "65744": c.cityname ="Cəlilabad"as RxString;
                                    break; case "67957": c.cityname ="Oğuz"as RxString;
                                    break; case "70928": c.cityname ="Qəbələ"as RxString;
                                    break; case "82092": c.cityname ="Ağcabədi"as RxString;
                                    break; case "92768": c.cityname ="Göygöl"as RxString;
                                    break; case "92807": c.cityname ="Zəngilan"as RxString;
                                    break; case "21320": c.cityname ="Qazax"as RxString;

                                    break;
                                    }








                                  });
try {
  final result = await InternetAddress.lookup("www.google.com");
  if (result.isNotEmpty&& result[0].rawAddress.isNotEmpty){

                                  await getData(_value!);
                                  setState((){


                                  });
                                  Navigator.pushReplacement(context, SizeTransition2(HomeScreen()));
                                  }
  }on SocketException catch(_){
  Get.defaultDialog(
    title: "System", middleText: "İnternet bağlantınızı yoxlayın", middleTextStyle: TextStyle(color: Constants.primaryColor, fontFamily: "Oswald"), onConfirm: (){
    Navigator.pushReplacement(context, SizeTransition2(HomeScreen()));


  }
  );
  }
},

                                hint: Text("${box.read("c.cityname")}"),
                                value: _value,
                              ),

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
                          ListTile(onTap: (){},
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
  var items = [ DropdownMenuItem<String>(
    child: Text('Ağdam'),
    value: '1423',
  ),
    DropdownMenuItem<String>(
      child: Text("Əli Bayramlı"),
      value: '1424',
    ),
    DropdownMenuItem<String>(
      child: Text("Bakı"),
      value: '1425',
    ),
    DropdownMenuItem<String>(
      child: Text("Bərdə"),
      value: '1426',
    ),
    DropdownMenuItem<String>(
      child: Text("Fizuli"),
      value: '1427',
    ),
    DropdownMenuItem<String>(
      child: Text("Gəncə"),
      value: '1428',
    ),DropdownMenuItem<String>(
      child: Text("Lənkəran"),
      value: '1432',
    ),
    DropdownMenuItem<String>(
      child: Text("Mingəçevir"),
      value: '1435',
    ),
    DropdownMenuItem<String>(
      child: Text("Sabirabad"),
      value: '1437',
    ),DropdownMenuItem<String>(
      child: Text("Səlyan"),
      value: '1438',
    ),
    DropdownMenuItem<String>(
      child: Text("Şəki"),
      value: '1439',
    ),
    DropdownMenuItem<String>(
      child: Text("Sumqayıt"),
      value: '1440',
    ),DropdownMenuItem<String>(
      child: Text("Zaqatala"),
      value: '1441',
    ),
    DropdownMenuItem<String>(
      child: Text("Şuşa"),
      value: '1443',
    ),
    DropdownMenuItem<String>(
      child: Text("Naxçıvan"),
      value: '1445',
    ),DropdownMenuItem<String>(
      child: Text("Culfa"),
      value: '1447',
    ),
    DropdownMenuItem<String>(
      child: Text("Tovuz"),
      value: '21319',
    ),
    DropdownMenuItem<String>(
      child: Text("Ağdaş"),
      value: '38073',
    ),DropdownMenuItem<String>(
      child: Text("İmişli"),
      value: '38172',
    ),
    DropdownMenuItem<String>(
      child: Text("Gədəbəy"),
      value: '38174',
    ),
    DropdownMenuItem<String>(
      child: Text("Ağdərə"),
      value: '38179',
    ),DropdownMenuItem<String>(
      child: Text("Saatlı"),
      value: '38193',
    ),
    DropdownMenuItem<String>(
      child: Text("Kəngərli"),
      value: '38290',
    ),
    DropdownMenuItem<String>(
      child: Text("Daşkəsən"),
      value: '38356',
    ),DropdownMenuItem<String>(
      child: Text("Göyçay"),
      value: '38457',
    ),
    DropdownMenuItem<String>(
      child: Text("Lerik"),
      value: '38654',
    ),
    DropdownMenuItem<String>(
      child: Text("Qubadlı"),
      value: '38788',
    ),DropdownMenuItem<String>(
      child: Text("Siyəzən"),
      value: '38875',
    ),
    DropdownMenuItem<String>(
      child: Text("Biləsuvar"),
      value: '38904',
    ),
    DropdownMenuItem<String>(
      child: Text("Yardımlı"),
      value: '38944',
    ),DropdownMenuItem<String>(
      child: Text("Xankəndi"),
      value: '38985',
    ),
    DropdownMenuItem<String>(
      child: Text("Ağsu"),
      value: '43363',
    ),
    DropdownMenuItem<String>(
      child: Text("Neftçala"),
      value: '43392',
    ),DropdownMenuItem<String>(
      child: Text("Quba"),
      value: '43395',
    ),
    DropdownMenuItem<String>(
      child: Text("Ucar"),
      value: '43397',
    ),
    DropdownMenuItem<String>(
      child: Text("Xaçmaz"),
      value: '43398',
    ),DropdownMenuItem<String>(
      child: Text("Tərtər"),
      value: '43611',
    ),
    DropdownMenuItem<String>(
      child: Text("Astara"),
      value: '43649',
    ),
    DropdownMenuItem<String>(
      child: Text("Beyləqan"),
      value: '43873',
    ), DropdownMenuItem<String>(
      child: Text("İsmayıllı"),
      value: '60075',
    ), DropdownMenuItem<String>(
      child: Text("Qusar"),
      value: '62280',
    ), DropdownMenuItem<String>(
      child: Text("Ordubad"),
      value: '62281',
    ), DropdownMenuItem<String>(
      child: Text("Şamaxı"),
      value: '62282',
    ), DropdownMenuItem<String>(
      child: Text("Goranboy"),
      value: '62642',
    ),
    DropdownMenuItem<String>(
      child: Text("Balakən"),
      value: '65728',
    ),DropdownMenuItem<String>(
      child: Text("Qax"),
      value: '65729',
    ),DropdownMenuItem<String>(
      child: Text("Şəmkir"),
      value: '65732',
    ),DropdownMenuItem<String>(
      child: Text("Yevlax"),
      value: '65737',
    ),
    DropdownMenuItem<String>(
      child: Text("Laçın"),
      value: '65739',
    ),DropdownMenuItem<String>(
      child: Text("Cəlilabad"),
      value: '65744',
    ),DropdownMenuItem<String>(
      child: Text("Oğuz"),
      value: '67957',
    ),DropdownMenuItem<String>(
      child: Text("Qəbələ"),
      value: '70928',
    ),DropdownMenuItem<String>(
      child: Text("Ağcabədi"),
      value: '82092',
    ),DropdownMenuItem<String>(
      child: Text("Göygöl"),
      value: '92768',
    ),
    DropdownMenuItem<String>(
      child: Text("Zəngilan"),
      value: '92807',
    ),DropdownMenuItem<String>(
      child: Text("Qazax"),
      value: '21320',
    )];
}
