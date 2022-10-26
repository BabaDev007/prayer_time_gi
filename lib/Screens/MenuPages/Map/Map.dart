import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lottie/lottie.dart';
import '../../../Constants.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';
class MapMosque extends StatefulWidget {
  const MapMosque({Key? key}) : super(key: key);

  @override
  State<MapMosque> createState() => _MapMosqueState();
}

class _MapMosqueState extends State<MapMosque> {
  bool zor = false;
  double progress = 0;
  InAppWebViewController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              leading: IconButton(onPressed: () {     Navigator.pop(context);
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Məscidlər", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,











      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: InAppWebView(

                        initialUrlRequest:
                        URLRequest(url: Uri.parse('https://www.google.az/maps/search/mosque/')),
                        androidOnGeolocationPermissionsShowPrompt:
                            (InAppWebViewController controller, String origin) async {
                          return GeolocationPermissionShowPromptResponse(
                              origin: origin,
                              allow: true,
                              retain: true
                          );
                        },
                        onProgressChanged: (InAppWebViewController controller, int progress) {
                          setState(() {
                            this.progress = progress / 100;
                          });
                        },
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: _buildProgressBar()
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildProgressBar() {
    if (progress != 1.0) {
      return Center(child: Lottie.asset("assets/loding.json", height: 80),);
// You can use LinearProgressIndicator also
//      return LinearProgressIndicator(
//        value: progress,
//        valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
//        backgroundColor: Colors.blue,
//      );
    }
    return Container();
  }
}











