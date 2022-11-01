import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Screens/MenuPages/Books/PdfViewer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import '../../../Constants.dart';
import '../../../PaddingManager.dart';
import '../../../PageTransition/PageTransition.dart';
class BookTile extends StatelessWidget {


  BookTile( this.bookPngPath , this.bookTitle , this.subtitle, this.bookLink,  );
  final String bookPngPath;
  final String bookTitle;
  final String subtitle;
  final String bookLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: InkWell(
          onTap: ()async{
            var connectivityResult = await (Connectivity().checkConnectivity());
            if (connectivityResult == ConnectivityResult.mobile) {
              CoolAlert.show(
                lottieAsset: "assets/mobile_data.json",
                  backgroundColor: Constants.primaryColor,
                  confirmBtnText: "Anladım",
                  cancelBtnText: "Xeyr",
                  context: context,
                  type: CoolAlertType.info,
                  text: "Bu əməliyyatı yerinə yetirərkən sizdən internet trafikinizə uyğun olaraq məbləğ çıxıla bilər",
                  title: "Məlumat",

                  onConfirmBtnTap: (){
                    Navigator.pop(context);
                    Navigator.of(context).push(SizeTransition3(BookReader(path: bookLink, pathWord: bookTitle,)));
                  }

              ) ??false;
// I am connected to a mobile network.
            } else if (connectivityResult == ConnectivityResult.wifi) {
// I am connected to a wifi network.
            }


            // Navigator.of(context).push(SizeTransition3(BookReader(path: bookLink, pathWord: bookTitle,)));
          },
          child: Container(
            height: 80 ,
              decoration: BoxDecoration(
                color: Theme.of(context).errorColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.2),
                    blurRadius: 30,
                    offset: Offset(20, 30),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),


              child: ListTile(
                leading: Image.asset("$bookPngPath", fit: BoxFit.cover, ),
                title: Text(bookTitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 15,overflow: TextOverflow.ellipsis),),
                trailing: Icon(Icons.chevron_right, color: Constants.primaryColor,),
                subtitle: Text(subtitle, textAlign: TextAlign.center),

              )),
        ));
  }
}
