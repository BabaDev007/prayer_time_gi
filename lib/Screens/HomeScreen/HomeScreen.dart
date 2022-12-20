import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/HomeScreenBody/HomeScreenBody.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/PageViewPage.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/splashscreen.dart';
import 'package:prayer_time_gi/Screens/MenuPages/ZikirMatik/ZikirMatik.dart';
import 'package:prayer_time_gi/Screens/Settings/SettingPage.dart';
import '../../Constants.dart';
import '../../PageTransition/PageTransition.dart';
import '../../StateManagement/StateManagement.dart';
import '../MenuPages/DataTable/DataTable.dart';
import 'package:http/http.dart' as http;
import 'DraverPage.dart';
import 'package:get_storage/get_storage.dart';

import 'SplashError.dart';
class HomeScreen extends StatefulWidget  {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  var zor;
GetStorage box = GetStorage();

  final Controller c = Get.put(Controller());
var currentTime;
bool isLoading = false;
  Future<void> getData(String url)async{

    var response = await http.get(Uri.parse("https://prayer-time-ws.herokuapp.com/api/dates/json/1.0/allDataYearly?indexOfCity=${url}"));

    var json = response.body;
    var jsonData = jsonDecode(utf8.decode(json.runes.toList()).toString());
    if (response.statusCode == 200) {
      currentTime = jsonData["data"];
      box.write("time", currentTime);


    }
    }

  var date = "data";
  List months =
  ['Yanvar', 'Fevral', 'Mart', 'Aprel', 'May','İyun','İyul','Avqust','Sentyabr','Oktyabr','Noyabr','Dekabr'];
  List weekday = ["Bzr. ertəsi", "Çər. axşamı", "Çərşənbə", "Cümə axşamı", "Cümə", "Şənbə", "Bazar"];

  String cityname = "Bakı";

  Future<void>yearControl()async{
    if(box.read("yearOfUpdate")!=DateTime.now().year){
      await box.write("time", null);
      Navigator.pushReplacement(context, PageTransition(SplashError()));
    }
  }
  @override
  void initState() {
    yearControl();
    zor = box.read("time");
    date =  "${zor['${c
        .difference}']['baseTime']["todayHijrahDate"]}";
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
      drawer: DrawerPage(),
      extendBodyBehindAppBar: true,

      backgroundColor:  Constants.primaryColor.withOpacity(.1),
     appBar: AppBar(
       leading: TextButton(
         child: CircleAvatar(child: Icon(Icons.menu_open_rounded)),
         onPressed: () =>   scaffoldKey.currentState?.openDrawer()
       ),
       iconTheme: IconThemeData(color: Colors.white),


       title:   Row(
         mainAxisAlignment: MainAxisAlignment.end,

         children: [
           DropdownButton<String>(
             icon: SizedBox(),
             iconSize: 0,
             elevation: 16,
             style: TextStyle(color: Constants.primaryColor,
                 fontSize: 15,
                 fontFamily: "Oswald"
             ),
             underline: SizedBox(),

             items: items,
             onChanged: (value) async {
               setState(() {

                 isLoading = true;
                 switch(value){
                   case "1423": cityname = "Ağdam" ;
                   break;
                   case "1424": cityname = "Şirvan";
                   break;
                   case "1425":  cityname ="Bakı";
                   break;case "1426":  cityname ="Bərdə";
                 break;case "1427": cityname ="Fizuli";
                 break;case "1428":cityname = "Gəncə";
                 break;case "1432": cityname ="Lənkəran";
                 break;case "1435": cityname ="Mingəçevir";
                 break;case "1437":cityname = "Sabirabad";
                 break;case "1438": cityname ="Səlyan";
                 break;case "1439": cityname ="Şəki";
                 break;case "1440": cityname ="Sumqayıt";
                 break;case "1441": cityname ="Zaqatala";
                 break;case "1443": cityname ="Şuşa";
                 break;case "1445": cityname ="Naxçıvan";
                 break;case "1447": cityname ="Culfa";
                 break;case "21319": cityname ="Tovuz";
                 break;case "38073": cityname ="Ağdaş";
                 break;case "38172": cityname ="İmişli";
                 break;case "38174": cityname ="Gədəbəy";
                 break;case "38179": cityname ="Ağdərə";
                 break;case "38193": cityname ="Saatlı";
                 break;case "38290": cityname ="Kəngərli";
                 break;case "38356": cityname ="Daşkəsən";
                 break;case "38457": cityname ="Göyçay";
                 break;case "38654": cityname ="Lerik";
                 break;case "38788": cityname ="Qubadlı";
                 break;case "38875": cityname ="Siyəzən";
                 break;case "38904": cityname ="Biləsuvar";
                 break;case "38944": cityname ="Yardımlı";
                 break;case "38985": cityname ="Xankəndi";
                 break;case "43363": cityname ="Ağsu";
                 break;case "43392":cityname = "Neftçala";
                 break;case "43395":cityname = "Quba";
                 break; case "43397": cityname ="Ucar";
                 break; case "43398": cityname ="Xaçmaz";
                 break; case "43661": cityname ="Tərtər";
                 break; case "43649": cityname ="Astara";
                 break; case "43873": cityname ="Beyləqan";
                 break; case "60075": cityname ="İsmayıllı";
                 break; case "62280": cityname ="Qusar";
                 break; case "62281": cityname ="Ordubad";
                 break; case "62282":cityname = "Şamaxı";
                 break; case "43392":cityname = "Goranboy";
                 break; case "62728":cityname = "Balakən";
                 break; case "65729": cityname ="Qax";
                 break; case "65732": cityname ="Şəmkir";
                 break; case "65737":cityname = "Yevlax";
                 break; case "65739": cityname ="Laçın" ;
                 break; case "65744": cityname ="Cəlilabad";
                 break; case "67957": cityname ="Oğuz";
                 break; case "70928": cityname ="Qəbələ";
                 break; case "82092": cityname ="Ağcabədi";
                 break; case "92768": cityname ="Göygöl";
                 break; case "92807": cityname ="Zəngilan";
                 break; case "21320": cityname ="Qazax";

                 break;
                 }
               });


               try{
                 await getData(value!);
                 box.write("nameOfCity", cityname);



                 Navigator.pushReplacement(context, SizeTransition2(PageViewPage()));
               }
               catch(e){
                 setState(() {
                   isLoading = false;
                 });
                 CoolAlert.show(
                     lottieAsset: "assets/75267-no-wifi.json",
                     backgroundColor: Constants.primaryColor,
                     confirmBtnText: "Ok",
                     cancelBtnText: "Xeyr",
                     context: context,
                     type: CoolAlertType.error,
                     title: 'İnternet Bağlantınızı Yoxlayın',
                     onCancelBtnTap: (){
                       Navigator.pop(context);
                     },
                     onConfirmBtnTap: (){
                       Navigator.pop(context);
                     }
                 );
               }
             },
             hint: Container(
                 decoration: BoxDecoration(
                     color: Constants.primaryColor.withOpacity(.8),
                     borderRadius: BorderRadius.circular(20)

                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(6.0),
                   child: Text("${box.read("nameOfCity") ?? "Bakı"}", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Oswald"),),
                 )),
           ),

         ],
       ),

       actions: [
         TextButton(onPressed: (){
            Navigator.push(context, SizeTransition2(DataTable1()));


         }, child: CircleAvatar(child: Icon(Icons.calendar_month, color: Colors.white, ))),
         TextButton(onPressed: (){
           Navigator.push(context, SizeTransition2(ZikrPage()));

         },  child: CircleAvatar(child: Opacity(opacity: .7,child: Image.asset("assets/tasbeh1.png", width: 40, height: 30, ))),),
       ],

    //    title: FittedBox(
    //      child: Row(
    //        mainAxisAlignment: MainAxisAlignment.center,
    //        crossAxisAlignment: CrossAxisAlignment.center,
    //        children: [
    //          Icon(FontAwesomeIcons.mapLocation, size: 14,),
    //
    //          Padding(
    //            padding: const EdgeInsets.only(left: 8.0),
    //            child: Text(
    //              "${box.read("nameofcity")}",
    //              // "${zor['${c
    //              //     .difference}']["cityOfName"]}" == "Baku (Baki)" ? "Bakı" : "${zor['${c
    //              //     .difference}']["cityOfName"]}", overflow: TextOverflow.fade,
    //
    //              style: TextStyle(color: Colors.white, fontSize: 15,
    //                  fontFamily: "Oswald"),),
    //          ),
    //        ],
    //      ),
    //    ),
    //
    //           // Icon(Icons.mosque_outlined),
    //
    //    actions: [
    //
    //
    //      Container(
    //        padding: EdgeInsets.all(5),
    //        decoration: BoxDecoration(
    //          borderRadius: BorderRadius.circular(20),
    //          border: Border.all(color: Colors.white70)
    //        ),
    //        child: Column(
    //          mainAxisSize: MainAxisSize.min,
    //          mainAxisAlignment: MainAxisAlignment.center,
    //          crossAxisAlignment: CrossAxisAlignment.center,
    //          children: [
    //
    //
    //
    //               Text("${DateTime.parse("${zor['${c
    //                .difference}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor['${c
    //     .difference}']['baseTime']["todayDate"]}").month - 1]}, ${weekday[DateTime.parse("${zor['${c
    //     .difference}']['baseTime']["todayDate"]}").weekday - 1]}",
    //
    // style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 14, color: Colors.white, fontFamily: "Oswald") ) ,
    //             Text(
    //
    //              "${"${zor['${c
    //                  .difference}']['baseTime']["todayHijrahDate"]}".capitalize}",
    //              maxLines: 1,
    //
    //
    //              style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 13, color: Colors.white70,fontFamily: "Oswald" )
    //                  ),
    //
    //          ],
    //        ),
    //      ),
    //      // IconButton(icon: Icon(Icons.chevron_left, size: 30,), onPressed: () { c.lastDay(); },),
    //      //
    //      // IconButton(icon: Icon(Icons.chevron_right, size: 30,), onPressed: () { c.nextDay(); },),
    //
    //     // IconButton(icon: Icon(FontAwesomeIcons.kaaba, size: 18 ,), onPressed: () {  Navigator.push(context, SizeTransition2(QiblahCompass())); },),
    //
    //     SizedBox(width: 15,)
    //    ],
       elevation: 0,
       backgroundColor: Colors.transparent,
     ),
     body:  Stack(
       alignment: Alignment.center,
       children: [
         Body(),
        isLoading ? Center(
             child: Container(
               color: Colors.black12,
               alignment: Alignment.center,
               child:  Lottie.asset("assets/loding.json", height: 80),
             ),

         ) : SizedBox(),

       ],
     )
       );


  }
  var items = [
    DropdownMenuItem<String>(
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


















// GestureDetector(
//     onTap: (){
//
//
//       Get.isDarkMode ?   controller.animateTo(0) :  controller.animateTo(0.5);
//       ThemeService().changeThemeMode();
//     },
//     child: Lottie.asset(
//       frameRate: FrameRate.max ,
//
//         Constants().lottieasset, controller: controller,
//
//
//
//     )),