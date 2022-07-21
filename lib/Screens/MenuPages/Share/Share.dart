import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../PaddingManager.dart';

class MenuListTileSHare extends StatelessWidget {

  final String title;
  final Icon icon;
  final String path;
  MenuListTileSHare({required this.title, required this.icon,  this.path = "",  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: InkWell(
          onTap: ()async{
            await Share.share("Azərbaycan üçün Namaz Vaxtı tətbiqi https://play.google.com/store/apps/details?id=com.turkiyetakvimi&gl=US");
          },
          child: Container(
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
                leading: icon,
                title: Text(title),
                trailing: Icon(Icons.chevron_right),

              )),
        ));
  }
}

class MenuListTileFeedBack extends StatelessWidget {

  final String title;
  final Icon icon;
  final String path;
  MenuListTileFeedBack({required this.title,  this.icon = const Icon(Icons.web_outlined),  this.path = "", Key? key}) : super(key: key);
  void _createEmail() async{
    const emailaddress = 'mailto:admin@fluttercentral.com?subject=Sample Subject&body=This is a Sample email';

    if(await canLaunch(emailaddress)) {
      await launch(emailaddress);
    } else {
      throw 'Could not Email';
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: InkWell(
          onTap: (){
      _createEmail();
          },
          child: Container(
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
                leading: icon,
                title: Text(title),
                trailing: Icon(Icons.chevron_right),

              )),
        ));
  }
}
