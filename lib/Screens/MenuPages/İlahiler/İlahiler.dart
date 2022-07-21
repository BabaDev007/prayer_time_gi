import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../../../PaddingManager.dart';

class IlahiTile  extends StatelessWidget {
  String name;
  String path;
  String subtitle;

  IlahiTile({required this.name, this.path = "", required this.subtitle, });

  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: InkWell(
          onTap: (){
            _launchUrl("$path",);

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
                leading: Icon(FontAwesomeIcons.youtube, color: Colors.red.shade700,),
                title: AutoSizeText(name, maxLines: 1,),
                trailing: Icon(Icons.chevron_right),
                subtitle: AutoSizeText(subtitle, maxLines: 1,),

              )),
        ));
  }
}
